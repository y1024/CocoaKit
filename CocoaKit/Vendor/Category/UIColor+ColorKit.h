//
//  UIColor+ColorKit.h
//  MiYouGe
//
//  Created by sky on 15/6/20.
//  Copyright (c) 2015年 iOSDev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (ColorKit)

+ (UIColor*)RGBColorWithR:(CGFloat)_R G:(CGFloat)_G B:(CGFloat)_B;
+ (UIColor*)RGBAColorWithR:(CGFloat)_R G:(CGFloat)_G B:(CGFloat)_B A:(CGFloat)_A;

+ (UIColor*)HexString:(NSString*)hexString;

@end
