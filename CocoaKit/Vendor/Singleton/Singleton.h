//
//  Singleton.h
//  CocoaKit
//
//  Created by 杜晓星 on 15/3/31.
//  Copyright (c) 2015年 iOS. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "JSObject.h"

@interface Singleton :JSObject

+ (instancetype)shareSingleton;


@end
