//
//  CocoaKit.h
//  CocoaKit
//
//  Created by 杜晓星 on 15/3/31.
//  Copyright (c) 2015年 iOS. All rights reserved.
//



//        unsigned int outCount = 0;
//        Ivar *vars = class_copyIvarList([UIAlertView class], &outCount); // 获取到所有的成员变量列表
//
//        // 遍历所有的成员变量
//        for (int i = 0; i < outCount; i++) {
//            Ivar ivar = vars[i]; // 取出第i个位置的成员变量
//
//            const char *propertyName = ivar_getName(ivar); // 获取变量名
//            const char *propertyType = ivar_getTypeEncoding(ivar); // 获取变量编码类型
//            printf("%d,---%s--%s\n",i, propertyName, propertyType);
//
//        }
//    });




#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

#import <AVFoundation/AVFoundation.h>


@class RegionModel;

@interface CocoaKit : NSObject


extern NSString *const AttributionDBPath();

#pragma mark APPInfo

extern NSString *const APPName();
extern NSString *const APPVersion();
extern NSString *const APPBuildVersion();
extern void     const  OpenAPPInStore(NSInteger appID);
extern id  const AllAPPs();

#pragma mark Device

extern BOOL const IPhone();
extern BOOL const IPhone4s();
extern BOOL const IPhone5S();
extern BOOL const IPhone6();
extern BOOL const IPhone6Plus();

#pragma mark SystemVersion

extern double const SystemVersion();
extern BOOL const IOS8();
extern BOOL const IOS7();
extern BOOL const IOS6();

#pragma mark Screen

extern CGRect const ScreenFrame();
extern CGFloat const ScreenWidth();
extern CGFloat const ScreenHeight();
extern void const NSLogRect(CGRect rect);
extern void const NSLogSize(CGSize size);
extern void const NSLogPoint(CGPoint point);

#pragma mark HomePath

extern NSString *const HomePath();

#pragma mark Kit

extern void const StatusBarBlack();
extern void const StatusBarWhite();
extern id   const SafeUserDefault(NSString*_key);
extern void const SafeRemoveUserDefault(NSString *_key);
extern void const ShowAlertView(NSString *_title,NSString *_message,NSString *_cancle,NSString *_other,id _delegate,int _tag);


#pragma mark UIColor+Kit

extern UIColor* const HexString(NSString* hexString);
extern UIColor* const RGB(CGFloat _R,CGFloat _G,CGFloat _B);
extern UIColor* const RGBA(CGFloat _R,CGFloat _G,CGFloat _B,CGFloat _A);

#pragma mark NSString+Kit
extern NSString* const REUTF8String(NSString*_string);
extern NSString* const UTF8String(NSString*_string);
extern NSString* const ChineseCharacterStringToCombineSyllables(NSString*_string);
extern BOOL const ContainString(NSString*_aString,NSString *_anotherString);

#pragma mark NSObject+Kit
extern BOOL const nullArray(NSObject*_array);
extern BOOL const nullString(NSObject *_string);
extern BOOL const nullDictionary(NSObject *_dictionary);

#pragma mark UIImage+Kit
/**
 *  从本地读取图片
 *
 *  @param _imageFullName 图片全名
 *
 *  @return 图片
 */
extern UIImage* const NoCache(NSString*_imageFullName);
/**
 *  对图片进行毛玻璃效果处理
 *
 *  @param image        原图片
 *  @param _blurPercent 处理百分比
 *
 *  @return 处理过图片
 */
extern UIImage* const BlurImage(UIImage*image,CGFloat _blurPercent);

#pragma mark NSURLConnection+Kit

extern NSString *const WiFiName();
extern void const CleanCookies(NSString *urlString);
extern void const CleanCaches(NSString *urlString);
extern NSString *const InterentState();

#pragma mark AVCaptureDevice+Kit

extern void const TurnOnLed();
extern void const TurnOffLed();
extern BOOL const CameraAccess();

#pragma mark NSData+AES

extern NSData *const AES128Encrypt(NSData *_data,NSString *_key);//加密
extern NSData *const AES256Encrypt(NSData *_data,NSString *_key);//加密

extern NSData *const AES128Decrypt(NSData *_data,NSString *_key);//解密
extern NSData *const AES256Decrypt(NSData *_data,NSString *_key);//解密

#pragma mark Call

extern void const CallPhone(NSString* phone);

RegionModel *queryWithPhoneNmuber(NSString* phoneNmuber);


@end
