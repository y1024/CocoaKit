//
//  NSDate+CalendarKit.m
//  CocoaKit
//
//  Created by 杜晓星 on 15/5/22.
//  Copyright (c) 2015年 iOS. All rights reserved.
//

#import "NSDate+CalendarKit.h"

@implementation NSDate (CalendarKit)


- (NSInteger)numberOfDaysInCurrentMonth
{
    return [NSDate numberOfDaysInMonthWithDate:[NSDate date]];
}

+ (NSInteger)numberOfDaysInMothWithDate:(NSDate*)date
{
    return [self numberOfDaysInMonthWithDate:date];
}

+ (NSInteger)numberOfDaysInMonthWithDateString:(NSString*)dateSting
{
    NSDate *date = [NSDate reFormatDateStringWithDateString:dateSting];
    return [self numberOfDaysInMonthWithDate:date];
}

+ (NSInteger)numberOfDaysInMonthWithDate:(NSDate*)date
{
    return [[NSCalendar currentCalendar]rangeOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:date].length;
}

- (NSUInteger)weeklyOfCurrentMonthFirstDay
{
    return [[NSCalendar currentCalendar] ordinalityOfUnit:NSDayCalendarUnit inUnit:NSWeekCalendarUnit forDate:self];
}
- (NSDate*)firstDayOfCurrentMonth
{
    NSDate *firstDate = nil;
    BOOL ok = [[NSCalendar currentCalendar] rangeOfUnit:NSMonthCalendarUnit startDate:&firstDate interval:NULL forDate:self];
    
    NSAssert1(ok, @"Failed to calculate the first day of the month based on %@", self);
    
    return firstDate;
}

- (NSString*)weeklyStringOfCurrentMonthFirstDay
{
    NSString *weeklyString = nil;
    
    NSDate *firstDayDate = [self firstDayOfCurrentMonth];
    
    NSInteger weekIntegerValue = [self weekIntegerValueWithDate:firstDayDate];
    
    weeklyString = [self weekStringWithWeekIntegerValue:weekIntegerValue];
    
    return  weeklyString;
}

- (NSInteger)weekIntegerValueWithDate:(NSDate*)date
{
    NSInteger weekIntValue = 0;
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSChineseCalendar];
    NSDateComponents *comps= [calendar components:(NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit |NSWeekdayCalendarUnit) fromDate:date];
    weekIntValue = [comps weekday];
    
    return weekIntValue ;
}

- (NSDate*)lastDayOfCurrentMonth
{
    NSCalendarUnit calendarUnit = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit;
    NSDateComponents *dateComponents = [[NSCalendar currentCalendar] components:calendarUnit fromDate:self];
    dateComponents.day = [self numberOfDaysInCurrentMonth];
    return [[NSCalendar currentCalendar] dateFromComponents:dateComponents];
}

- (NSInteger)weeklyOfCurrentMonthLastDay
{
    NSInteger weekIntValue = 0;
    NSDate *lastDay = [self lastDayOfCurrentMonth];
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSChineseCalendar];
    NSDateComponents *comps= [calendar components:(NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit |NSWeekdayCalendarUnit) fromDate:lastDay];
    weekIntValue = [comps weekday];
    
    return weekIntValue ;
}

- (NSString*)weeklyStringOfCurrentMonthLastDay
{
    NSString *weeklyString = nil;
    
    NSDate *lastDayDate = [self lastDayOfCurrentMonth];
    
    NSInteger weekIntegerValue = [self weekIntegerValueWithDate:lastDayDate];
    
    weeklyString = [self weekStringWithWeekIntegerValue:weekIntegerValue];
    
    return  weeklyString;
}


#pragma mark 周
- (NSString*)weekStringWithWeekIntegerValue:(NSUInteger)weekIntegerValue
{
    NSString *weekString = nil;
    
    switch (weekIntegerValue) {
        case 1:
            weekString = @"周日";
            break;
        case 2:
            weekString = @"周一";
            break;
        case 3:
            weekString = @"周二";
            break;
        case 4:
            weekString = @"周三";
            break;
        case 5:
            weekString = @"周四";
            break;
        case 6:
            weekString = @"周五";
            break;
        case 7:
            weekString = @"周六";
            break;
    }
    return weekString;
}

#pragma mark 格式化日期
+ (NSString*)formatDateWithDate:(NSDate*)date
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:MonthFormatString];
    
    return [formatter stringFromDate:date];
}

+ (NSDate*)reFormatDateStringWithDateString:(NSString*)dateString
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:MonthFormatString];
    
    return [formatter dateFromString:dateString];
}


@end
