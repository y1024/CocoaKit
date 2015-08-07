//
//  NSString+StringKit.h
//  CocoaKit
//
//  Created by sky on 15/6/17.
//  Copyright (c) 2015年 iOS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (StringKit)

/**
 *  返回 00：00：00 格式时间
 *
 *  @param string 2015-02-25 14:30:30
 *
 *  @return 
 */
- (NSString*)clockStringWithDateString;

/**
 *  返回 00：00：00 格式时间
 *
 *  @param
 *
 *  @return
 */
- (NSString*)clockStringWithDate:(NSDate*)date;

/**
 *  返回 00：00：00 格式时间
 *
 *  @param
 *
 *  @return
 */

+ (NSString*)clockStringWithTimeInterval:(NSInteger)timeInterval;

/**
 *  计算 字符串 高度
 *
 *  @param font   字体大小
 *  @param _width 限定长度
 *
 *  @return 字符串所占位置
 */
- (CGSize)textSizeWithFont:(CGFloat)font totalSizeWidth:(CGFloat)_width;
/**
 *  格式化 字符串 去除多余0
 *
 *  @param number
 *
 *  @return
 */
+ (NSString*)fromatStringWithNumber:(CGFloat)number;

/**
 *  本地寻找图片
 *
 *  @param imageName
 *
 *  @return
 */
+ (NSString*)filePathWithimageName:(NSString*)imageName;


@end
