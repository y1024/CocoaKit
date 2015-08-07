//
//  NSDate+DateKit.m
//  MiYouGe
//
//  Created by sky on 15/6/27.
//  Copyright (c) 2015年 iOSDev. All rights reserved.
//

#import "NSDate+DateKit.h"

@implementation NSDate (DateKit)

- (NSString*)formatterString
{
    NSDateFormatter *formatter=[[NSDateFormatter alloc] init];
    [formatter setDateFormat:JS_DateFormatter];
    
    NSString *dateString = [formatter stringFromDate:self];
    
    return dateString;
}

+ (NSDate*)fromString:(NSString*)dateString
{
    NSDateFormatter *formatter=[[NSDateFormatter alloc] init];
    [formatter setDateFormat:JS_DateFormatter];
    NSDate *date = [formatter dateFromString:dateString];
    return date;
}


@end
