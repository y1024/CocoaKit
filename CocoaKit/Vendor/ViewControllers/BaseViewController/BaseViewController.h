//
//  BaseViewController.h
//  CocoaKit
//
//  Created by 杜晓星 on 15/4/10.
//  Copyright (c) 2015年 iOS. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CocoaKit.h"

#import "MJRefresh.h"


#import "RDVTabBarController.h"
#import "RDVTabBarItem.h"


@interface BaseViewController : UIViewController

- (void)setIndex:(NSInteger)index SelectedImage:(NSString*)selectedImage unSelectedImage:(NSString*)unSelectedImage;

- (void)setIndex:(NSInteger)index selectedBackgroundImage:(NSString*)selectedImage unSelectedBackgroundImage:(NSString*)unSelectedBackgroundImage;

- (void)tabBarHidden;

- (void)tabBarShow;

- (void)setBadgeValue:(NSInteger)_badgeValue;

- (CGFloat)tabBarHeight;

@end
