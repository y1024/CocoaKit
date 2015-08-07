//
//  MYApplication.m
//  CocoaKit
//
//  Created by sky on 15/6/11.
//  Copyright (c) 2015年 iOS. All rights reserved.
//

#import "MYApplication.h"
#import "BackgroundRunner.h"
#import "IQKeyboardManager.h"

@implementation MYApplication

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    [IQKeyboardManager sharedManager].enable = YES;
    
    return YES;
}


- (void)hanleBackgroundWithFlag:(BOOL)flag;
{
    handleBackgroundFlag = flag;
    
    if (flag) {
        
        [self setupBackground];
        
    }
    
}

- (void)setupBackground
{
    [self performSelectorInBackground:@selector(runningInBackground) withObject:nil];
}

- (void)runningInBackground
{
    static NSInteger timer = 0 ;
    
    while (1) {
        
        timer ++ ;
        
        [NSThread sleepForTimeInterval:1];
        
        if (timer%60 == 0) {
            
            NSLog(@"run");
        }
    }
}



- (void)applicationWillResignActive:(UIApplication *)application
{
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    
    if (handleBackgroundFlag) {
        
        if ([[UIDevice currentDevice] isMultitaskingSupported]) {
            [[BackgroundRunner shared] run];
        }
    }
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    if (handleBackgroundFlag) {
        
        [[BackgroundRunner shared] stop];
    }
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
