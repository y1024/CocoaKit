//
//  NSString+StringKit.m
//  CocoaKit
//
//  Created by sky on 15/6/17.
//  Copyright (c) 2015年 iOS. All rights reserved.
//

#import "NSString+StringKit.h"

@implementation NSString (StringKit)

- (NSString*)clockStringWithDateString
{
    NSString *resultString = nil;
    
    NSDateFormatter *fromat=[[NSDateFormatter alloc] init];
    [fromat setDateFormat:JS_DateFormatter];
                             
    NSDate *nowDate=[NSDate date];
  
    NSDate *endDate = [fromat dateFromString:self];
                             
    int timeInterval = [endDate timeIntervalSinceDate:nowDate];
    int timeHour = (timeInterval/60)/60;
    int timeMin = (timeInterval/60)%60;
    int timeSecond = timeInterval%60;
    
    resultString = [NSString stringWithFormat:@"%02d:%02d:%02d",timeHour, timeMin,timeSecond];
    return resultString;
}

- (NSString*)clockStringWithDate:(NSDate*)date
{
    NSString *resultString = nil;
    
    NSDateFormatter *fromat=[[NSDateFormatter alloc] init];
    [fromat setDateFormat:JS_DateFormatter];
    
    NSDate *endDate = [fromat dateFromString:self];
    
    int timeInterval = [endDate timeIntervalSinceDate:date];
    int timeHour = (timeInterval/60)/60;
    int timeMin = (timeInterval/60)%60;
    int timeSecond = timeInterval%60;
    
    resultString = [NSString stringWithFormat:@"%02d:%02d:%02d",timeHour, timeMin,timeSecond];
    return resultString;
}

+ (NSString*)clockStringWithTimeInterval:(NSInteger)timeInterval
{
    NSString *resultString = nil;
    NSInteger timeHour = (timeInterval/60)/60;
    NSInteger timeMin = (timeInterval/60)%60;
    NSInteger timeSecond = timeInterval%60;
    
    resultString = [NSString stringWithFormat:@"%02ld:%02ld:%02ld",(long)timeHour, (long)timeMin,(long)timeSecond];
    return resultString;
}

- (CGSize)textSizeWithFont:(CGFloat)font totalSizeWidth:(CGFloat)_width
{
    CGRect rect = [self boundingRectWithSize:CGSizeMake(_width, 999) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:font], NSFontAttributeName,nil] context:nil];
    
    CGSize textSize = CGSizeMake(ceil(CGRectGetWidth(rect)), ceil(CGRectGetHeight(rect)));
    
    return  textSize ;
}
+ (NSString*)fromatStringWithNumber:(CGFloat)number
{
    NSString *string = [NSString stringWithFormat:@"%.10lf",number];
    
    NSMutableString *mutableString = [[NSMutableString alloc]initWithString:string];
    
    for (NSUInteger i = mutableString.length - 1; i<-1; i--) {
        
        if ([mutableString characterAtIndex:i] != '0') {
            
            if ([mutableString characterAtIndex:i] == '.') {
                
                [mutableString deleteCharactersInRange:NSMakeRange(i ,mutableString.length - i )];
                
                break;
            }
            
            [mutableString deleteCharactersInRange:NSMakeRange(i + 1,mutableString.length - i  - 1)];
            break ;
            
        }
    }
    
    return mutableString;
}

+ (NSString*)filePathWithimageName:(NSString*)imageName
{
    NSString *imageType = nil;
    NSString *filePath = nil;
    
    if (ContainString(imageName, @".")) {
        
        imageName = [[imageName componentsSeparatedByString:@"."]firstObject];
        imageType = [[imageName componentsSeparatedByString:@"."]lastObject];
        
        filePath = [[NSBundle mainBundle]pathForResource:imageName ofType:imageType];
    }
    else
    {
        filePath = [[NSBundle mainBundle]pathForResource:imageName ofType:@"png"];
    }
    return filePath;
}

@end
