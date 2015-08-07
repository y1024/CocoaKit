//
//  UIImageView+ImageViewKit.m
//  MiYouGe
//
//  Created by sky on 15/6/24.
//  Copyright (c) 2015年 iOSDev. All rights reserved.
//

#import "UIImageView+ImageViewKit.h"

@implementation UIImageView (ImageViewKit)

+ (instancetype)imageViewWithImageName:(NSString*)imageName
{
    UIImageView *resultImageView = nil;
    resultImageView = [self imageViewWithImageName:imageName hightLightImageName:@""];
    return resultImageView;
}
+ (instancetype)imageViewWithNoCacheImageName:(NSString*)imageName
{
    UIImageView *resultImageView = nil;
    resultImageView = [[UIImageView alloc]initWithImage:[UIImage imageWithContentsOfFile:[NSString filePathWithimageName:imageName]]];
    
    return resultImageView;
    
}

+ (instancetype)imageViewWithImageName:(NSString *)imageName hightLightImageName:(NSString*)hightName
{
    UIImageView *resultImageView = nil;
    resultImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:imageName] highlightedImage:[UIImage imageNamed:hightName]];
    return resultImageView;
}
+ (instancetype)imageViewWithNoCacheImageName:(NSString *)imageName hightLightImageName:(NSString*)hightName
{
    UIImageView *resultImageView = nil;
    resultImageView = [[UIImageView alloc]initWithImage:[UIImage imageWithContentsOfFile:[NSString filePathWithimageName:imageName]] highlightedImage:[UIImage imageWithContentsOfFile:[NSString filePathWithimageName:hightName]]];
    return resultImageView;
}




@end
