//
//  RegionModel.h
//  CocoaKit
//
//  Created by 杜晓星 on 15/5/8.
//  Copyright (c) 2015年 iOS. All rights reserved.
//


/**
 *  归属地 模型
 *
 *  @param nonatomic
 *
 *  @return 
 */

#import "TSObject.h"

@interface RegionModel : TSObject

/**
 *  号码前缀
 */
@property(nonatomic)NSString *prefixNumber;
/**
 *  省份
 */
@property(nonatomic)NSString *province;
/**
 *  城市
 */
@property(nonatomic)NSString *city;
/**
 *  运营商 中国移动 联通 电信 固定电话
 */
@property(nonatomic)NSString *corporation;

@end
