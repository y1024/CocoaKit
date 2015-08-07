//
//  BlurViewController.m
//  CocoaKit
//
//  Created by 杜晓星 on 15/5/11.
//  Copyright (c) 2015年 iOS. All rights reserved.
//

#import "BlurViewController.h"

@interface BlurViewController ()

@end

@implementation BlurViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self tabBarHidden];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *image = NoCache(@"Clouds");
    UIImage *blurImage = BlurImage(image, 0.2);
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 20 + 44, ScreenWidth(), 390/2)];
    imageView.image = image;
    [self.view addSubview:imageView];
    
    UIImageView *blurImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 20 + 390/2 + 50 + 44, ScreenWidth(), 390/2)];
    blurImageView.image = blurImage;
    [self.view addSubview:blurImageView];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
