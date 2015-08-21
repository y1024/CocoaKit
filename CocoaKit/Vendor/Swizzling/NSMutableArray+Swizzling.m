//
//  NSMutableArray+Swizzling.m
//  CocoaKit
//
//  Created by sky on 15/6/26.
//  Copyright (c) 2015年 iOS. All rights reserved.
//

#import "NSMutableArray+Swizzling.h"
#import <objc/runtime.h>

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

+ (void)load {
    
    Class selfClass = object_getClass(self);
    
    Method addObj = class_getInstanceMethod(selfClass, @selector(addObject:));
    Method logAddobject = class_getInstanceMethod(selfClass, @selector(logAddObject:));
    method_exchangeImplementations(addObj, logAddobject);
    
//    Class selfClass = object_getClass(self);
    
    NSLog(@"name:%@",NSStringFromClass(selfClass));
}

- (void)logAddObject:(id)anObj {
    [self logAddObject:anObj];
    NSLog(@"Added object %@ to array %@", anObj, self);
}

@end
