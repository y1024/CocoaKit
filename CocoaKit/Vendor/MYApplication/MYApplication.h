//
//  MYApplication.h
//  CocoaKit
//
//  Created by sky on 15/6/11.
//  Copyright (c) 2015年 iOS. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  引导自定义applicationDelegate
 *  需要在 plist文件中 添加字段
 *  key               value
 *  Principal class  DDApplication
 */

@interface MYApplication : UIResponder<UIApplicationDelegate>

{
    BOOL handleBackgroundFlag;
}

@property (strong, nonatomic) UIWindow *window;

- (void)hanleBackgroundWithFlag:(BOOL)flag;

@end
