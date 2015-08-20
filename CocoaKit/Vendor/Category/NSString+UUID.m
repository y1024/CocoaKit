//
//  NSString+UDID.m
//  CocoaKit
//
//  Created by emiaobao on 15/8/20.
//  Copyright (c) 2015年 iOS. All rights reserved.
//

#import "NSString+UUID.h"

@implementation NSString (UUID)

+ (NSString*)UUID
{
    NSString *UUID = [[UIDevice currentDevice].identifierForVendor UUIDString];
    
    return UUID;
}

@end
