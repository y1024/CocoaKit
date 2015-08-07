//
//  MYHUD.h
//  CocoaKit
//
//  Created by sky on 15/6/11.
//  Copyright (c) 2015年 iOS. All rights reserved.
//

#import "MYObject.h"

@interface MYHUD : MYObject

/**
 *  只提示文字
 *
 *  @param text 提示内容
 *  可作调试用
 */

+ (void)showMBPHudWithTextOnly:(NSString*)text;

/**
 *  添加常规加载状态
 */
+ (void)showMBPhUDWithLoadingState;
/**
 *  移除Hud
 */
+ (void)hideMBPHub;

@end
