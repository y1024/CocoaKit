//
//  NSDate+CalendarKit.h
//  CocoaKit
//
//  Created by 杜晓星 on 15/5/22.
//  Copyright (c) 2015年 iOS. All rights reserved.
//

#import <Foundation/Foundation.h>

#define FullDateFormatString @"yyyy-MM-dd HH:mm:ss zzz"  // zzz代表时区

#define YearFormatString    @"yyyy"
#define MonthFormatString   @"yyyy-MM"
#define DayFormatString     @"yyyy-MM-dd"
#define HourFormatString    @"yyyy-MM-dd HH"
#define MinuteFormatString  @"yyyy-MM-dd HH:mm"
#define SecondFormatString  @"yyyy-MM-dd HH:mm:ss"

@interface NSDate (CalendarKit)

/**
 *  本月有多少天
 *
 *  @return 天数
 */
- (NSInteger)numberOfDaysInCurrentMonth;
/**
 *  获取某日期 当月有多少天
 *
 *  @param date
 *
 *  @return
 */
+ (NSInteger)numberOfDaysInMothWithDate:(NSDate*)date;
/**
 *  获取某日期 当月有多少天
 *
 *  @param dateSting 2015-02
 *
 *  @return
 */
+ (NSInteger)numberOfDaysInMonthWithDateString:(NSString*)dateSting;

/**
 *  获取当前月 第一天
 *
 *  @return
 */
- (NSDate*)firstDayOfCurrentMonth;
/**
 *  获取当前月 第一天 在 一周中占位
 *
 *  @return
 */
- (NSUInteger)weeklyOfCurrentMonthFirstDay;
/**
 *  当前月第一天是周几
 */
- (NSString*)weeklyStringOfCurrentMonthFirstDay;

/**
 *  本月最后一天
 *
 *  @return
 */
- (NSDate*)lastDayOfCurrentMonth;
/**
 *  本月最后一天 在一周中占位
 *
 *  @return
 */
- (NSInteger)weeklyOfCurrentMonthLastDay;
/**
 *  本月最后一天周几
 *
 *  @return
 */
- (NSString*)weeklyStringOfCurrentMonthLastDay;


//- (NSDate*)dayIn

/**
 *  格式化日期 默认使用宏定义
 *
 *  @param date 日期
 *
 *  @return 字符串
 */
+ (NSString*)formatDateWithDate:(NSDate*)date;

/**
 *  对字符串取日期
 *
 *  @param dateString
 *
 *  @return
 */
+ (NSDate*)reFormatDateStringWithDateString:(NSString*)dateString;


@end
