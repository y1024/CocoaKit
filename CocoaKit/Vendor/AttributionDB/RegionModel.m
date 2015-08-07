//
//  RegionModel.m
//  CocoaKit
//
//  Created by 杜晓星 on 15/5/8.
//  Copyright (c) 2015年 iOS. All rights reserved.
//

#import "RegionModel.h"

@implementation RegionModel

- (NSString*)description
{
    return [NSString stringWithFormat:@"号码前缀:%@ 省份:%@ 城市:%@ 运营商:%@",_prefixNumber,_province,_city,_corporation];
}

@end
