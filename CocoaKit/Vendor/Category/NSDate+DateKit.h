//
//  NSDate+DateKit.h
//  MiYouGe
//
//  Created by sky on 15/6/27.
//  Copyright (c) 2015年 iOSDev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (DateKit)

/**
 *  格式化 时间
 *
 *  @return
 */
- (NSString*)formatterString;
/**
 *  字符串 转 Date
 *
 *  @param dateString
 *
 *  @return
 */
+ (NSDate*)fromString:(NSString*)dateString;

@end
