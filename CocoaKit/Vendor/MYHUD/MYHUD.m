//
//  MYHUD.m
//  CocoaKit
//
//  Created by sky on 15/6/11.
//  Copyright (c) 2015年 iOS. All rights reserved.
//

#import "MYHUD.h"

#import "MBProgressHUD.h"
#import "CocoaKit.h"

@implementation MYHUD

+ (void)showMBPHudWithTextOnly:(NSString*)text
{
    UIWindow *keyWindow = [UIApplication sharedApplication].windows[0];
    
    MBProgressHUD *hub = [MBProgressHUD showHUDAddedTo:keyWindow animated:YES];
    hub.mode = MBProgressHUDModeText;
    hub.labelText = text;
    hub.margin = 10.0f;
    hub.yOffset = ScreenHeight()/2 - 50 - 20;
    hub.removeFromSuperViewOnHide = YES;
    [hub hide:YES afterDelay:1.0f];
}

+ (void)showMBPhUDWithLoadingState
{
    UIWindow *keyWindow = [UIApplication sharedApplication].windows[0];
    
    MBProgressHUD *hub = [MBProgressHUD showHUDAddedTo:keyWindow animated:YES];
    
    hub.labelText = @"Loading";
}
+ (void)hideMBPHub
{
    UIWindow *keyWindow = [UIApplication sharedApplication].windows[0];
    
    [MBProgressHUD hideAllHUDsForView:keyWindow animated:YES];
}

@end
