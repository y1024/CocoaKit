//
//  QRViewController.m
//  CocoaKit
//
//  Created by 杜晓星 on 15/4/10.
//  Copyright (c) 2015年 iOS. All rights reserved.
//

#import "QRViewController.h"

#import <AVFoundation/AVFoundation.h>

#define timeInterval 0.05f

@interface QRViewController ()<AVCaptureMetadataOutputObjectsDelegate>

{
    NSTimer                         *_timer;

    AVCaptureDevice                 *_device;
    AVCaptureDeviceInput            *_input;
    AVCaptureMetadataOutput         *_output;
    AVCaptureSession                *_session;
    AVCaptureVideoPreviewLayer      *_layer;
    
    UIImageView                     *_lineView;
}

@end

@implementation QRViewController


- (void)dealloc
{
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [_session stopRunning];
    
    [_timer invalidate];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
     [self tabBarHidden];
    
    [_session startRunning];
    
    [_timer fire];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self buildSubViews];
    
    [self buildCamera];
}


#pragma mark - buildSubViews
- (void)buildSubViews
{
    
    [self setTitle:@"QRViewController"];
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:timeInterval target:self selector:@selector(lineViewAnnation) userInfo:nil repeats:YES];
    
    [[NSRunLoop currentRunLoop]addTimer:_timer forMode:NSRunLoopCommonModes];
    
    self.view.backgroundColor = [UIColor clearColor];
    
    UIImageView *_backImageView = [[UIImageView alloc]initWithImage:NoCache(@"pick_bg.png")];
    _backImageView.bounds = CGRectMake(0, 0, 446/2, 446/2);
    _backImageView.center = self.view.center;
    [self.view addSubview:_backImageView];
    
    _lineView = [[UIImageView alloc]initWithImage:NoCache(@"line.png")];
    _lineView.frame = CGRectMake(0, 0, 446/2, 16/2);
    [_backImageView addSubview:_lineView];
    
    UIButton *lightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    lightButton.center = CGPointMake(self.view.center.x, self.view.center.y + 150);
    lightButton.bounds = CGRectMake(0, 0, 96/2, 96/2);
    [lightButton setImage:NoCache(@"btn_Off_Light.png") forState:normal];
    [lightButton setImage:NoCache(@"btn_On_Light.png") forState:UIControlStateSelected];
    [lightButton addTarget:self action:@selector(lightButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:lightButton];
}

- (void)buildCamera
{
    
    if (!CameraAccess()) {
        
        return ;
    }
    
    _device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    
    NSError *deviceError = nil ;
    
    _input = [AVCaptureDeviceInput deviceInputWithDevice:_device error:&deviceError];
    
    
    NSAssert(!deviceError, [deviceError localizedDescription]);
    
    _output = [[AVCaptureMetadataOutput alloc]init];
    [_output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    _session = [[AVCaptureSession alloc]init];
    [_session setSessionPreset:AVCaptureSessionPresetHigh];
    if ([_session canAddInput:_input]) {
        
        [_session addInput:_input];
    }
    if ([_session canAddOutput:_output]) {
        
        [_session addOutput:_output];
    }
    
    //条码类型
    _output.metadataObjectTypes = @[AVMetadataObjectTypeQRCode,AVMetadataObjectTypeCode93Code,AVMetadataObjectTypeCode128Code];
    
    _layer = [[AVCaptureVideoPreviewLayer alloc]initWithSession:_session];
    _layer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    _layer.frame = CGRectMake(0, 64, ScreenWidth(), ScreenHeight() - 64);
    [self.view.layer insertSublayer:_layer atIndex:0];
}

- (void)lightButtonClick:(UIButton*)lightButton
{
    lightButton.selected = !lightButton.selected;
    if (lightButton.selected == YES) {
        
        TurnOnLed();
    }
    else
    {
        TurnOffLed() ;
    }
}
- (void)lineViewAnnation
{
    static BOOL   isDown = YES ;
    
    if (isDown) {
        
         _lineView.frame = CGRectMake(0,_lineView.frame.origin.y + 2.0f, 446/2, 16/2);
        
        if (_lineView.frame.origin.y >= 446/2-16.0/2) {
            
            isDown = NO;
        }
    }
    if (!isDown) {
        
        _lineView.frame = CGRectMake(0,_lineView.frame.origin.y - 2.0f, 446/2, 16/2);
        
        if (_lineView.frame.origin.y <= 0.0f) {
            
            isDown = YES;
        }
    }
}

- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection
{
    NSString *stringValue = nil;
    
    if ([metadataObjects count] >0)
    {
        AVMetadataMachineReadableCodeObject * metadataObject = [metadataObjects objectAtIndex:0];
        stringValue = metadataObject.stringValue;
    }
    
    NSLog(@"条码内容:%@",stringValue);
    
    [_timer invalidate];
    [_session stopRunning];
    
    if (self.navigationController) {
        
        [self.navigationController popViewControllerAnimated:YES];
    }else
    {
        [self dismissViewControllerAnimated:YES completion:^{
            
        }];
    }
}


@end
