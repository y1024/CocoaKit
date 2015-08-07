//
//  UIImageView+ImageViewKit.h
//  MiYouGe
//
//  Created by sky on 15/6/24.
//  Copyright (c) 2015年 iOSDev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (ImageViewKit)

/**
 *  有缓存加载图片
 *
 *  @param imageName 常规图片
 *
 *  @return
 */
+ (instancetype)imageViewWithImageName:(NSString*)imageName;

/**
 *  从本地搜索图片 加载
 *
 *  @param imageName
 *
 *  @return
 */
+ (instancetype)imageViewWithNoCacheImageName:(NSString*)imageName;

/**
 *  有缓存加载图片 并附有高亮图片
 *
 *  @param imageName
 *  @param hightName
 *
 *  @return
 */
+ (instancetype)imageViewWithImageName:(NSString *)imageName hightLightImageName:(NSString*)hightName;

/**
 *  有缓存加载图片 并附有高亮图片
 *
 *  @param imageName
 *  @param hightName
 *
 *  @return
 */
+ (instancetype)imageViewWithNoCacheImageName:(NSString *)imageName hightLightImageName:(NSString*)hightName;


@end
