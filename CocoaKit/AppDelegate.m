//
//  AppDelegate.m
//  CocoaKit
//
//  Created by 杜晓星 on 15/3/31.
//  Copyright (c) 2015年 iOS. All rights reserved.
//

#import "AppDelegate.h"

#import "MainViewController.h"

#import "CocoaKit.h"

#import "QRViewController.h"

#import "RDVTabBarController.h"

#import "RegionModel.h"

#import "NSDate+CalendarKit.h"

#import "NSString+StringKit.h"

#import "NSMutableArray+Swizzling.h"

#import <objc/runtime.h>
#import "NSObject+Swizzling.h"

void method(id obj)
{
    
}


@implementation AppDelegate



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [super application:application didFinishLaunchingWithOptions:launchOptions];

    [self hanleBackgroundWithFlag:YES];
    
    [self setupViewControllers];
    
//    RegionModel *model = queryWithPhoneNmuber(@"03733693206");
//    
//    NSLog(@"model:%@",model);
//    
//    NSLog(@"%ld",[[NSDate date] weeklyOfCurrentMonthFirstDay]);
//    
//    NSLog(@"%@",[[NSDate date]weeklyStringOfCurrentMonthFirstDay]);
//    
//    NSLog(@"%ld",[NSDate numberOfDaysInMonthWithDateString:@"2015-05"]);
//    
//    NSLog(@"%@",[[NSDate date] lastDayOfCurrentMonth]);
//    
//    NSLog(@"%@",[[NSDate date]weeklyStringOfCurrentMonthLastDay]);
//    
//    NSLog(@"%@",[@"2015-06-17 18:07:00" clockStringWithDate:[NSDate date]]);
    
//    NSObject *obj = [[NSObject alloc]init];
//    
//    Method normal = class_getClassMethod([obj class], @selector(init));
//    Method myInit = class_getClassMethod([obj class], @selector(ts_init));
//    method_exchangeImplementations(normal, myInit);
    
//    NSObject *obj2 = [[NSObject alloc]init];
    
    
    NSMutableArray *ay  = [[NSMutableArray alloc]init];
    
//    NSLog(@"imp:%@",imp);
    
    [ay addObject:@"2"];
    NSLog(@"ary:%@",ay);
    
//    Method ori_Method =  class_getInstanceMethod([ay class], @selector(addObject:));
//    Method my_Method = class_getInstanceMethod([ay class], @selector(js_addObject:));
//    method_exchangeImplementations(ori_Method, my_Method);
//      
//    [ay addObject:@"a"];
//    [ay addObject:@"b"];
//    [ay addObject:@"a"];
//    
    
    
    
//    NSLog(@"%@",ay);
    
    
    

    
    
    return YES;
}



- (void)setupViewControllers
{
    MainViewController *mainVC = [[MainViewController alloc]init];
    UINavigationController *mainNav = [[UINavigationController alloc]initWithRootViewController:mainVC];
    QRViewController *QRVC = [[QRViewController alloc]init];
    UINavigationController *QRNav = [[UINavigationController alloc]initWithRootViewController:QRVC];
    
    RDVTabBarController *rdt = [[RDVTabBarController alloc]init];
    rdt.viewControllers = @[mainNav,QRNav];
  
    [mainVC setIndex:0 SelectedImage:@"first_normal.png" unSelectedImage:@"first_selected.png"];
    [mainVC setBadgeValue:10];
    [mainVC setIndex:0 selectedBackgroundImage:@"tabbar_selected_background" unSelectedBackgroundImage:@"tabbar_normal_background"];
    [QRVC setIndex:1 SelectedImage:@"second_normal.png" unSelectedImage:@"second_selected.png"];
    
    [QRVC setIndex:1 selectedBackgroundImage:@"tabbar_selected_background" unSelectedBackgroundImage:@"tabbar_normal_background"];
    
    self.window.rootViewController = rdt;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    [super applicationWillResignActive:application];
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    [super applicationDidEnterBackground:application];
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
   [super applicationWillEnterForeground:application];
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{

    [super applicationDidBecomeActive:application];
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    [super applicationWillTerminate:application];
}

@end
