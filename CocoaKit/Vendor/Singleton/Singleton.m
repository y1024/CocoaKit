//
//  Singleton.m
//  CocoaKit
//
//  Created by 杜晓星 on 15/3/31.
//  Copyright (c) 2015年 iOS. All rights reserved.
//

#import "Singleton.h"

@implementation Singleton


static Singleton *_singletonObject = nil ;

- (void)dealloc
{
    NSLog(@"%s",__FUNCTION__);
}

- (instancetype)init
{
    if (_singletonObject) {

        return _singletonObject;
    }
    else
    {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            
            _singletonObject = [super init];
            
        });
    }
    return _singletonObject ;
}

+ (instancetype)shareSingleton
{
    if (_singletonObject) {
        
        return _singletonObject;
 
    }
    _singletonObject = [[super allocWithZone:nil]init];
    
    return _singletonObject ;
}

#pragma mark + allocWithZone
+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    return [self shareSingleton];
}
#pragma mark - copyWithZone
- (instancetype)copyWithZone:(NSZone*)zone
{
    return self ;
}
@end
