//
//  NSMutableArray+Swizzling.m
//  CocoaKit
//
//  Created by sky on 15/6/26.
//  Copyright (c) 2015年 iOS. All rights reserved.
//

#import "NSMutableArray+Swizzling.h"


@implementation NSMutableArray (Swizzling)

- (void)js_addObject:(id)anObject
{
    if (self.count > 0) {
        for (NSString *str in self) {
            if ([str isEqualToString:anObject]) {
                
                return;
            }
        }
    }
    [self js_addObject:anObject];
    
}



@end
