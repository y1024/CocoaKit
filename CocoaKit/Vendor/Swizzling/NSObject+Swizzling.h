//
//  NSObject+Swizzling.h
//  CocoaKit
//
//  Created by Code on 15/8/21.
//  Copyright (c) 2015年 iOS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Swizzling)

- (instancetype)ts_init;

- (instancetype)init;

+ (void)load;

+ (IMP)swizzleSelector:(SEL)origSelector
               withIMP:(IMP)newIMP;



@end
