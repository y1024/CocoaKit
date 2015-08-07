//
//  CocoaKit.m
//  CocoaKit
//
//  Created by 杜晓星 on 15/3/31.
//  Copyright (c) 2015年 iOS. All rights reserved.
//

#import "CocoaKit.h"

#import <SystemConfiguration/SystemConfiguration.h>
#import <SystemConfiguration/CaptiveNetwork.h>
#import <CommonCrypto/CommonCrypto.h>
#import <objc/runtime.h>

#import <QuartzCore/QuartzCore.h>
#import <Accelerate/Accelerate.h>

#import <CoreTelephony/CTCarrier.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>


#import "FMDB.h"

#import "RegionModel.h"


@implementation CocoaKit : NSObject

#pragma mark APPInfo


NSString *const AttributionDBPath()
{
    NSString *resourcePath = [[NSBundle mainBundle]pathForResource:@"AttributionDB" ofType:@"sqlite"];
    
    return resourcePath;
}

NSString *const APPName()
{
        NSDictionary *appInfoDictionary = [NSBundle mainBundle].infoDictionary;
    
    return appInfoDictionary[@"CFBundleDisplayName"];
}

NSString *const APPVersion()
{
    NSDictionary *appInfoDictionary = [NSBundle mainBundle].infoDictionary;
    
    return appInfoDictionary[@"CFBundleShortVersionString"];
}

NSString *const APPBuildVersion()
{
    NSDictionary *appInfoDictionary = [NSBundle mainBundle].infoDictionary;
    
    return appInfoDictionary[@"CFBundleVersion"];
}
void const  OpenAPPInStore(NSInteger appID)
{
    NSString *appURLString = [NSString stringWithFormat:@"http://itunes.apple.com/us/app/id%ld",(long)appID];
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:appURLString]];
}

id  const AllAPPs()
{
    
    Class LSApplicationWorkspace_class = objc_getClass("LSApplicationWorkspace");
    
    NSObject* workspace = [LSApplicationWorkspace_class performSelector:@selector(defaultWorkspace)];

    return [workspace performSelector:@selector(allApplications)];
    
}

#pragma mark Device

BOOL const IPhone()
{
    return [[UIDevice currentDevice]userInterfaceIdiom] == UIUserInterfaceIdiomPhone ;
}

BOOL const IPhone4s()
{
    return ([UIScreen mainScreen].bounds.size.height == 480.0f) && ([UIScreen mainScreen].bounds.size.width == 320.0f);
}

BOOL const IPhone5S()
{
    return ([UIScreen mainScreen].bounds.size.height == 568.0f) && ([UIScreen mainScreen].bounds.size.width == 320.0f);
}

BOOL const IPhone6()
{
    return ([UIScreen mainScreen].bounds.size.height == 667.0f) && ([UIScreen mainScreen].bounds.size.width == 375.0f);
}

BOOL const IPhone6Plus()
{
    return ([UIScreen mainScreen].bounds.size.height == 736.0f) && ([UIScreen mainScreen].bounds.size.width == 414.0f) ;
}


#pragma mark SystemVersion
double const SystemVersion()
{
    return [[UIDevice currentDevice].systemVersion doubleValue];
}
BOOL const IOS8()
{
    return [[UIDevice currentDevice].systemVersion floatValue] >= 8.0 && [[UIDevice currentDevice].systemVersion floatValue] < 9.0;
}

BOOL const IOS7()
{
    return [[UIDevice currentDevice].systemVersion floatValue] >= 7.0 && [[UIDevice currentDevice].systemVersion floatValue] < 8.0 ;
}

BOOL const IOS6()
{
    return [[UIDevice currentDevice].systemVersion floatValue] >= 6.0 && [[UIDevice currentDevice].systemVersion floatValue] < 7.0;
}

#pragma mark Screen
CGRect const ScreenFrame()
{
    return [UIScreen mainScreen].bounds;
}
CGFloat const ScreenWidth()
{
    return [UIScreen mainScreen].bounds.size.width;
}

CGFloat const ScreenHeight()
{
    return [UIScreen mainScreen].bounds.size.height;
    
}

void const NSLogRect(CGRect rect)
{
    NSLog(@"x:%.4f, y:%.4f, w:%.4f, h:%.4f", rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
}

void const NSLogSize(CGSize size)
{
    NSLog(@"w:%.4f, h:%.4f", size.width, size.height);
}
void const NSLogPoint(CGPoint point)
{
    NSLog(@"x:%.4f, y:%.4f", point.x, point.y);
}


#pragma mark HomePath

NSString  *const HomePath()
{
    return NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
}

#pragma mark Kit

void  const ShowAlertView(NSString *_title,NSString *_message,NSString *_cancle,NSString *_other,id _delegate,int _tag)
{
    UIAlertView *kAlertView = [[UIAlertView alloc]initWithTitle:_title message:_message delegate:_delegate cancelButtonTitle:_cancle otherButtonTitles:_other, nil];
    kAlertView.tag = _tag;
    [kAlertView show];
    
}

void const StatusBarBlack()
{
    [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleDefault animated:NO];
    
}

void const StatusBarWhite()
{
    [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
    
}

id const SafeUserDefault(NSString*_key)
{
    id result = nil ;
    
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    if ([[NSUserDefaults standardUserDefaults]objectForKey:_key]) {
        
        result = [[NSUserDefaults standardUserDefaults]objectForKey:_key];
        
    }
    return _key;
}
void const SafeRemoveUserDefault(NSString *_key)
{
    if ([[NSUserDefaults standardUserDefaults]objectForKey:_key]) {
        
        [[NSUserDefaults standardUserDefaults]removeObjectForKey:_key];
        [[NSUserDefaults standardUserDefaults]synchronize];
    }
}

#pragma mark UIColor

UIColor* const HexString(NSString* _HexString)
{
    
    unsigned int    redColor = 0 ;
    unsigned int    greenColor = 0 ;
    unsigned int    blueColor = 0 ;
    
    UIColor *resultColor = nil ;
    
    
    if ([_HexString hasPrefix:@"#"]) {
        
        @try {
            
            [[NSScanner scannerWithString:[_HexString substringWithRange:NSMakeRange(1, 2)]]scanHexInt:&redColor];
            
            
            [[NSScanner scannerWithString:[_HexString substringWithRange:NSMakeRange(3, 2)]]scanHexInt:&greenColor];
            
            [[NSScanner scannerWithString:[_HexString substringWithRange:NSMakeRange(5, 2)]]scanHexInt:&blueColor];
            
            
            resultColor = [UIColor colorWithRed:redColor/255.0f green:greenColor/255.0f blue:blueColor/255.0f alpha:1];
            
            
            return resultColor;
            
        }
        @catch (NSException *exception) {
            
            NSLog(@"\n__FUNCTION__:%s\n__LINE__:%d\nException:%@",__FUNCTION__,__LINE__,exception);
            
            return [UIColor blueColor] ;
            
        }
        @finally {
        }
    }
    else
    {
        
        @try {
            
            [[NSScanner scannerWithString:[_HexString substringWithRange:NSMakeRange(0, 2)]]scanHexInt:&redColor];
            
            
            [[NSScanner scannerWithString:[_HexString substringWithRange:NSMakeRange(2, 2)]]scanHexInt:&greenColor];
            
            [[NSScanner scannerWithString:[_HexString substringWithRange:NSMakeRange(4, 2)]]scanHexInt:&blueColor];
            
            
            resultColor = [UIColor colorWithRed:redColor/255.0f green:greenColor/255.0f blue:blueColor/255.0f alpha:1];
            
            return resultColor;
            
        }
        @catch (NSException *exception) {
            
            NSLog(@"\n__FUNCTION__:%s\n__LINE__:%d\nException:%@",__FUNCTION__,__LINE__,exception);
            
            return [UIColor blueColor] ;
            
        }
        @finally {
            
            
        }
    }
}

UIColor* const RGB(CGFloat _R,CGFloat _G,CGFloat _B)
{
    UIColor *RGBColor = nil ;
    
    RGBColor = RGBA(_R, _G, _B, 1);
    
    return RGBColor ;
}
UIColor* const RGBA(CGFloat _R,CGFloat _G,CGFloat _B,CGFloat _A)
{
    UIColor *RGBColor = nil ;
    
    RGBColor = [UIColor colorWithRed:_R/255.0f green:_G/255.0f blue:_B/255.0f alpha:_A/1.0f];
    
    return RGBColor ;
}

#pragma mark NSObject+Kit
BOOL const nullArray(NSObject*_array)
{
    if (!_array) {
        
        return NO;
    }
    if ([_array isKindOfClass:[NSNull class]]) {
        
        return NO;
    }
    
    if (![_array isKindOfClass:[NSArray class]]) {
        
        return NO ;
    }
    
    NSArray *selfArray = (NSArray*)_array ;
    
    if ([selfArray count] == 0) {
        
        return NO;
    }
    else
    {
        return YES;
    }
    
}
BOOL const nullString(NSObject *_string)
{
    if (!_string) {
        
        return NO;
    }
    
    if ([_string isKindOfClass:[NSNull class]]) {
        
        return NO;
    }
    if (![_string isKindOfClass:[NSString class]]) {
        
        return NO ;
    }
    
    NSString *stringSelf = (NSString*)_string;
    
    if ([stringSelf isEqualToString:@""]) {
        
        return NO;
    }
    else
    {
        return YES;
    }
    
}
BOOL const nullDictionary(NSObject *_dictionary)
{
    if (!_dictionary) {
        return NO;
    }
    
    if ([_dictionary isKindOfClass:[NSNull class]]) {
        
        return NO;
    }
    else
    {
        return YES;
    }
    
}


#pragma mark NSString+Kit
NSString* const REUTF8String(NSString*_string)
{
    NSString *resultString = nil ;
    
    if (nullString(_string)) {
        
        resultString = [_string  stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    }
    
    return resultString ;
}
NSString* const UTF8String(NSString*_string)
{
    NSString *UTF8String = nil ;
    
    if (nullString(_string)) {
        
        UTF8String = [_string stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    }
    return UTF8String;
}
NSString* const ChineseCharacterStringToCombineSyllables(NSString*_string)
{
    NSMutableString *mutableChineseString = [NSMutableString stringWithString:_string];
    
    __block NSString *resultString = @"";
    
    
    @autoreleasepool {
        
        if (CFStringTransform((__bridge CFMutableStringRef)mutableChineseString, 0, kCFStringTransformMandarinLatin, NO))
        {
            //            NSLog(@"拼音带声调:%@",mutableChineseString);
        }
        if (CFStringTransform((__bridge CFMutableStringRef)mutableChineseString, 0, kCFStringTransformStripCombiningMarks, NO))
        {
            //            NSLog(@"不带拼音带声调:%@",mutableChineseString);
            NSArray *mutableChineseStringArray = [mutableChineseString componentsSeparatedByString:@" "];
            [mutableChineseStringArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                
                resultString = [resultString stringByAppendingString:obj];
            }];
        }
    }
    
    return resultString ;
}
BOOL const ContainString(NSString*_aString,NSString *_anotherString)
{
    
    if (IOS8()) {
        
        /**
         *  to do ~~~~~~~~~
         */
        return [_aString containsString:_anotherString];
    }
    
    if ([_aString rangeOfString:_anotherString].length > 0 && [_aString rangeOfString:_anotherString].location != NSNotFound ) {
        return YES;
    }
    return NO ;
}

#pragma mark UIImage+Kit

UIImage* const NoCache(NSString*_imageFullName)
{
    UIImage  *resultImage = nil ;
    NSString *imageName = nil;
    NSString *imageType = nil;
    NSString *filePath = nil;
    
    if (ContainString(_imageFullName, @".")) {
        
        imageName = [[_imageFullName componentsSeparatedByString:@"."]firstObject];
        imageType = [[_imageFullName componentsSeparatedByString:@"."]lastObject];
        
        filePath = [[NSBundle mainBundle]pathForResource:imageName ofType:imageType];
    }
    else
    {
        filePath = [[NSBundle mainBundle]pathForResource:_imageFullName ofType:@"png"];
    }
    
    resultImage = [UIImage imageWithContentsOfFile:filePath];
    
    return resultImage;
}

UIImage* const BlurImage(UIImage* image,CGFloat _blurPercent)
{
    NSData *imageData = UIImageJPEGRepresentation(image, 1); // convert to jpeg
    UIImage* destImage = [UIImage imageWithData:imageData];
    
    
    if (_blurPercent < 0.f || _blurPercent > 1.f) {
        _blurPercent = 0.5f;
    }
    int boxSize = (int)(_blurPercent * 40);
    boxSize = boxSize - (boxSize % 2) + 1;
    
    CGImageRef img = destImage.CGImage;
    
    vImage_Buffer inBuffer, outBuffer;
    
    vImage_Error error;
    
    void *pixelBuffer;
    
    
    //create vImage_Buffer with data from CGImageRef
    
    CGDataProviderRef inProvider = CGImageGetDataProvider(img);
    CFDataRef inBitmapData = CGDataProviderCopyData(inProvider);
    
    
    inBuffer.width = CGImageGetWidth(img);
    inBuffer.height = CGImageGetHeight(img);
    inBuffer.rowBytes = CGImageGetBytesPerRow(img);
    
    inBuffer.data = (void*)CFDataGetBytePtr(inBitmapData);
    
    //create vImage_Buffer for output
    
    pixelBuffer = malloc(CGImageGetBytesPerRow(img) * CGImageGetHeight(img));
    
    if(pixelBuffer == NULL)
        NSLog(@"No pixelbuffer");
    
    outBuffer.data = pixelBuffer;
    outBuffer.width = CGImageGetWidth(img);
    outBuffer.height = CGImageGetHeight(img);
    outBuffer.rowBytes = CGImageGetBytesPerRow(img);
    
    // Create a third buffer for intermediate processing
    void *pixelBuffer2 = malloc(CGImageGetBytesPerRow(img) * CGImageGetHeight(img));
    vImage_Buffer outBuffer2;
    outBuffer2.data = pixelBuffer2;
    outBuffer2.width = CGImageGetWidth(img);
    outBuffer2.height = CGImageGetHeight(img);
    outBuffer2.rowBytes = CGImageGetBytesPerRow(img);
    
    //perform convolution
    error = vImageBoxConvolve_ARGB8888(&inBuffer, &outBuffer2, NULL, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend);
    if (error) {
        NSLog(@"error from convolution %ld", error);
    }
    error = vImageBoxConvolve_ARGB8888(&outBuffer2, &inBuffer, NULL, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend);
    if (error) {
        NSLog(@"error from convolution %ld", error);
    }
    error = vImageBoxConvolve_ARGB8888(&inBuffer, &outBuffer, NULL, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend);
    if (error) {
        NSLog(@"error from convolution %ld", error);
    }
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef ctx = CGBitmapContextCreate(outBuffer.data,
                                             outBuffer.width,
                                             outBuffer.height,
                                             8,
                                             outBuffer.rowBytes,
                                             colorSpace,
                                             (CGBitmapInfo)kCGImageAlphaNoneSkipLast);
    CGImageRef imageRef = CGBitmapContextCreateImage (ctx);
    UIImage *returnImage = [UIImage imageWithCGImage:imageRef];
    
    //clean up
    CGContextRelease(ctx);
    CGColorSpaceRelease(colorSpace);
    
    free(pixelBuffer);
    free(pixelBuffer2);
    CFRelease(inBitmapData);
    
    CGImageRelease(imageRef);
    
    return returnImage;
}


#pragma mark NSURLConnection+Kit

NSString *const WiFiName()
{
    NSString *wifiName = nil;
    
    CFArrayRef wifiInterfaces = CNCopySupportedInterfaces();
    
    if (!wifiInterfaces) {
        return nil;
    }
    
    NSArray *interfaces = (__bridge NSArray *)wifiInterfaces;
    
    for (NSString *interfaceName in interfaces) {
        CFDictionaryRef dictRef = CNCopyCurrentNetworkInfo((__bridge CFStringRef)(interfaceName));
        
        if (dictRef) {
            NSDictionary *networkInfo = (__bridge NSDictionary *)dictRef;
            NSLog(@"network info -> %@", networkInfo);
            wifiName = [networkInfo objectForKey:(__bridge NSString *)kCNNetworkInfoKeySSID];
            CFRelease(dictRef);
        }
    }
    
    CFRelease(wifiInterfaces);
    return wifiName;
}
void const CleanCookies(NSString *urlString)
{
    /*
     关于HTTPCookies
     
     NSMutableURLRequest
     mutableURLRequest.HTTPShouldHandleCookies = NO ;系统提供的方法可以不产生Cookies
     系统产生HTTPCookies 保存本地速度比较慢。
     在下次启动程序时，可以直接清理。
     */
    NSURL *cleanURL = [NSURL URLWithString:urlString];
    if (cleanURL) {
        NSArray *cookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookiesForURL:cleanURL];
        for (int i = 0; i < [cookies count]; i++) {
            NSHTTPCookie *cookie = (NSHTTPCookie *)cookies[i];
            [[NSHTTPCookieStorage sharedHTTPCookieStorage] deleteCookie:cookie];
        }
    }
}
void const CleanCaches(NSString *urlString)
{
    /*
     关于HTTPCaches
     相同的URL 不同时间启动 产生的缓存文件名字不一样。第一次启动产生缓存以后没有清理，下次启动则清理不成功。
     如果使用相同的URL再次请求，则会覆盖原来的缓存文件。
     如果需要清理缓存文件的话，建议每次程序退出前就清理。
     */
    NSURLRequest *cleanURLRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    
    if (cleanURLRequest) {
        [[NSURLCache sharedURLCache]removeCachedResponseForRequest:cleanURLRequest];
    }
    
    
}
NSString *const InterentState()
{
    UIApplication *mainApplication = [UIApplication sharedApplication];
    
    /*
     // 遍历当前app的所有属性，找到关于状态栏的
     unsigned int appOutCount = 0 ;
     Ivar *ivars = class_copyIvarList(mainApplication.class, &appOutCount);
     for (int  i = 0 ; i < appOutCount; i ++) {
     Ivar ivar = ivars[i];
     printf("遍历当前app的所有属性:%s\n", ivar_getName(ivar));
     }
     
     // 遍历状态栏的所有成员
     unsigned int statusBarOutCount = 0;
     id statusBar = [mainApplication valueForKeyPath:@"statusBar"];
     Ivar *statusBar_ivars = class_copyIvarList([statusBar class], &statusBarOutCount);
     
     for (int i = 0; i < statusBarOutCount; i++) {
     Ivar ivar =statusBar_ivars[i];
     printf("遍历状态栏的所有成员:%s\n", ivar_getName(ivar));
     }
     
     //所有当前显示的视图
     
     NSArray *foregroundView_children = [[[mainApplication valueForKeyPath:@"statusBar"] valueForKeyPath:@"foregroundView"] subviews];
     for (id childView in foregroundView_children) {
     NSLog(@"所有当前显示的视图:%@", [childView class]);
     }
     */
    
    //获取当前网络状态
    NSArray *children = [[[mainApplication valueForKeyPath:@"statusBar"] valueForKeyPath:@"foregroundView"] subviews];
    
    int type = 0;
    for (id child in children) {
        
        if ([child isKindOfClass:NSClassFromString(@"UIStatusBarDataNetworkItemView")]) {
            type = [[child valueForKeyPath:@"dataNetworkType"] intValue];
        }
    }
    
    if (type == 0 ) {
        return @"没有网络";
        
    }
    if (type == 1) {
        return @"2g 网络";
    }
    if (type == 2) {
        return @"3g 网络";
    }
    if (type == 3 ) {
        return @"4g 网络";
    }
    if (type == 5 ) {
        return  @"wifi 网络";
    }
    else
    {
        return @"未知网络";
    }
    
}


#pragma mark AVCaptureDevice+Kit

void const TurnOnLed()
{
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if ([device hasTorch]) {
        [device lockForConfiguration:nil];
        [device setTorchMode: AVCaptureTorchModeOn];
        [device unlockForConfiguration];
    }
}
void const TurnOffLed()
{
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if ([device hasTorch]) {
        [device lockForConfiguration:nil];
        [device setTorchMode: AVCaptureTorchModeOff];
        [device unlockForConfiguration];
    }
    
}
BOOL const CameraAccess()
{
    BOOL access = NO ;
    
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    
    if(authStatus == AVAuthorizationStatusAuthorized)
    {
        NSLog(@"允许状态");
        
        access = YES ;
    }
    else if (authStatus == AVAuthorizationStatusRestricted)
    {
        NSLog(@"AVAuthorizationStatusRestricted");
        access = NO;
    }
    
    else if (authStatus == AVAuthorizationStatusDenied)
    {
        
        ShowAlertView(@"未获得授权使用摄像头", @"请在iOS-设置-隐私-相机中打开", @"知道了", nil, nil, 0);
        access = NO ;
        
    }
    else if (authStatus == AVAuthorizationStatusNotDetermined)
    {
        NSLog(@"系统还未知是否访问，第一次开启相机时");
        
        access = NO ;
    }
    
    if (![UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear]) {
        
        
        ShowAlertView(@"提示", @"摄像头不可用", @"知道了", nil, nil, 0);
        access = NO ;
    }
    
    return access ;
}

#pragma mark NSData+AES

NSData *const AESEncrypt(NSData *_data,NSString *_key,size_t size)//加密
{
    NSUInteger dataLength = [_data length];
    
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    
    void *buffer = malloc(bufferSize);
    
    size_t numBytesEncrypted = 0;
    
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt, kCCAlgorithmAES128,
                                          
                                          kCCOptionPKCS7Padding/*这里就是刚才说到的PKCS7Padding填充了*/| kCCOptionECBMode,
                                          
                                          [_data bytes], kCCKeySizeAES128,
                                          
                                          NULL,/* 初始化向量(可选) */
                                          
                                          [_data bytes], dataLength,/*输入*/
                                          
                                          buffer, bufferSize,/* 输出 */
                                          
                                          &numBytesEncrypted);
    
    if (cryptStatus == kCCSuccess) {
        
        return [NSData dataWithBytesNoCopy:buffer length:numBytesEncrypted];
        
    }
    
    free(buffer);//释放buffer
    
    return nil;
    
}

NSData *const AES128Encrypt(NSData *_data,NSString *_key)//加密
{
    return  AESEncrypt(_data, _key, kCCAlgorithmAES128);
}
NSData *const AES256Encrypt(NSData *_data,NSString *_key)//加密
{
    return AESEncrypt(_data, _key, kCCKeySizeAES256);
}

NSData *const AESDecrypt(NSData *_data,NSString *_key,size_t size)//解密
{
    //同理，解密中，密钥也是32位的
    
    const void * keyPtr2 = [_data bytes];
    
    const char (*keyPtr)[size] = keyPtr2;
    
    //对于块加密算法，输出大小总是等于或小于输入大小加上一个块的大小
    
    //所以在下边需要再加上一个块的大小
    
    NSUInteger dataLength = [_data length];
    
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    
    void *buffer = malloc(bufferSize);
    
    size_t numBytesDecrypted = 0;
    
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt, kCCAlgorithmAES128,
                                          
                                          kCCOptionPKCS7Padding/*这里就是刚才说到的PKCS7Padding填充了*/| kCCOptionECBMode,
                                          
                                          keyPtr, size,
                                          
                                          NULL,/* 初始化向量(可选) */
                                          
                                          [_data bytes], dataLength,/* 输入 */
                                          
                                          buffer, bufferSize,/* 输出 */
                                          
                                          &numBytesDecrypted);
    
    if (cryptStatus == kCCSuccess) {
        
        return [NSData dataWithBytesNoCopy:buffer length:numBytesDecrypted];
        
    }
    
    free(buffer);
    
    return nil;
}
NSData *const AES128Decrypt(NSData *_data,NSString *_key)//解密
{
    return AESDecrypt(_data, _key, kCCKeySizeAES128);
}
NSData *const AES256Decrypt(NSData *_data,NSString *_key)//解密
{
    return AESDecrypt(_data, _key, kCCKeySizeAES256);
}


#pragma mark Call

extern void const CallPhone(NSString* phone)
{
    CTTelephonyNetworkInfo *info = [[CTTelephonyNetworkInfo alloc] init];
    CTCarrier *carrier = [info subscriberCellularProvider];
    NSString *isoCountryCode =  [carrier mobileCountryCode];
    if ([isoCountryCode length]!=0) {
        
        NSURL *phoneNumberURL = [NSURL URLWithString:[NSString stringWithFormat:@"telprompt://%@",phone]];
        [[UIApplication sharedApplication] openURL:phoneNumberURL];
        
    }else{
        NSString *msg =  @"呼叫失败，没有可用的SIM卡!";
        
        ShowAlertView(@"提示", msg, @"确定", nil, nil, 0);
        
    }

}

RegionModel  *queryWithPhoneNmuber(NSString* phoneNmuber)
{
    RegionModel *resultModel = nil;
    
    NSString *queryString = nil;
    
    
    if ([phoneNmuber hasPrefix:@"0"]) {
        
        NSLog(@"截取前 4 位作为区号进行搜索");
        
        queryString = [NSString stringWithFormat:@"SELECT * FROM Region WHERE Number = '%@'",[phoneNmuber substringToIndex:4]];
        
        resultModel = queryWithQueryString(queryString);
        
        
        if (resultModel.prefixNumber) {
            
            return resultModel;
            
        }
        else
        {
            NSLog(@"截取前 3 位作为区号进行搜索");
            
            queryString = [NSString stringWithFormat:@"SELECT * FROM Region WHERE Number = '%@'",[phoneNmuber substringToIndex:3]];
            
            resultModel = queryWithQueryString(queryString);
            
            return resultModel;
        }
        
    }
    
    else
    {
        
        NSLog(@"当前查询号码为手机号码");
        queryString = [NSString stringWithFormat:@"SELECT * FROM Region WHERE Number = %@",[phoneNmuber substringToIndex:7]];
        
        resultModel = queryWithQueryString(queryString);
        
        return resultModel;
        
    }
    
    return resultModel;
}


RegionModel*queryWithQueryString(NSString*_string)
{
    RegionModel *model = [[RegionModel alloc]init];
    
    FMDatabase *db = [[FMDatabase alloc]initWithPath:AttributionDBPath()];
    
    [db open];
    
    FMResultSet *resultSet = [db executeQuery:_string];
    
    
    while ([resultSet next]) {
        
        model.prefixNumber = [resultSet stringForColumn:@"Number"];
        model.province = [resultSet stringForColumn:@"Province"];
        model.city = [resultSet stringForColumn:@"City"];
        model.corporation = [resultSet stringForColumn:@"Corporation"];
    }
    [resultSet close];
    [db close];
    
     return model;
}



@end
