//
//  ReactiveCocoaViewController.m
//  CocoaKit
//
//  Created by emiaobao on 15/8/10.
//  Copyright (c) 2015年 iOS. All rights reserved.
//

#import "ReactiveCocoaViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
@interface ReactiveCocoaViewController ()

@end

@implementation ReactiveCocoaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self reactiveCocoa];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)reactiveCocoa
{
    NSArray *array = @[ @1, @2, @3 ];
    RACSequence * stream = [array rac_sequence];
    [stream map:^id (id value){
        return @(pow([value integerValue], 2));
    }];
    NSLog(@"%@",[stream array]);
    
    NSLog(@"%@",[[[array rac_sequence] map:^id (id value){
        return @(pow([value integerValue], 2));
    }] array]);
    
    NSLog(@"%@",[[stream filter:^BOOL(id value) {
        return [value integerValue] %2 == 0 ;
    }]array]);
    
    NSLog(@"%@", [[[array rac_sequence] filter:^BOOL (id value){
        return [value integerValue] % 2 == 0;
    }] array]);
    
    NSLog(@"%@",[[[array rac_sequence] map:^id (id value){
        return [value stringValue];
    }] foldLeftWithStart:@"" reduce:^id (id accumulator, id value){
        return [accumulator stringByAppendingString:value];
    }]);
    
    
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
