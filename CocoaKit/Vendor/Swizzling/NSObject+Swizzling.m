//
//  NSObject+Swizzling.m
//  CocoaKit
//
//  Created by Code on 15/8/21.
//  Copyright (c) 2015年 iOS. All rights reserved.
//

#import "NSObject+Swizzling.h"
#import <objc/runtime.h>
@implementation NSObject (Swizzling)

- (instancetype)ts_init
{
    NSLog(@"name:%@",NSStringFromClass([self class]));
    
    return [[NSObject alloc]init];
}

+ (void)load;
{
    Class selfClass = object_getClass(self);

    NSLog(@"name:%@",NSStringFromClass(selfClass));

}

+ (IMP)swizzleSelector:(SEL)origSelector
               withIMP:(IMP)newIMP
{
    Class class = [self class];
    Method origMethod = class_getInstanceMethod(class,
                                                origSelector);
    IMP origIMP = method_getImplementation(origMethod);
    
    if(!class_addMethod(self, origSelector, newIMP,
                        method_getTypeEncoding(origMethod)))
    {
        method_setImplementation(origMethod, newIMP);
    }
    
    return origIMP;
}

//- (instancetype)init
//{
//    NSLog(@"name:%@",NSStringFromClass([self class]));
//    
//    return [[NSObject alloc]init];
//
//}

@end
