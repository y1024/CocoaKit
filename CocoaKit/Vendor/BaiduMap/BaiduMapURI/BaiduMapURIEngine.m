//
//  BaiduMapURIEngine.m
//  BaiduMapURIDemo
//
//  Created by soarsky on 14/12/11.
//  Copyright (c) 2014年 KaiFa_3_Bu. All rights reserved.
//

#import "BaiduMapURIEngine.h"

#define APPNAME [[[NSBundle mainBundle]infoDictionary]objectForKey:@"CFBundleDisplayName"]

#define BaiduMapExists [[UIApplication sharedApplication]canOpenURL:[NSURL URLWithString:[@"baidumap://map" stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]]




@implementation BaiduMapURIEngine


#pragma mark - 导航路线图
/*
 protocol://product/[service/]action[?parameters] //parameters 功能参数定义,具体规范见功能协议说明
 本示例是通过该 URL 启劢地图 app 并进入北京市从中关村到五道口的驾车导航路线图
 baidumap://map/direction?origin=中关村&destination=五道口&mode=driving&region=北京
*/
+ (void)navigationRoutefrom:(NSString*)from destination:(NSString*)destination where:(NSString*)region
{
    /*
     model :  driving 驾车
              walking 步行
              transit 公交
     */
    NSString *navigationURI = [NSString stringWithFormat:@"baidumap://map/direction?origin=%@&destination=%@&mode=driving&region=%@",from,destination,region];
    
    [self openBaiduMapClientWithURLString:navigationURI];
}

#pragma mark - 指定坐标点上显示点的名称和内容信息
/*
    调用该接口可调起 IOS 百度地图,且在指定坐标点上显示点的名称和内容信息。
    
    "baidumap://map/marker?location=40.047669,116.313082&title=我的位置&content=百度奎科大厦&src=yourCompanyName|yourAppName"
    lat 纬度
    lng 经度
*/
+ (void)showInfoWithTitle:(NSString*)title content:(NSString*)content lat:(double)lat lng:(double)lng
{

    if (BaiduMapExists) {
        
        NSString *clientShowInfo = [NSString stringWithFormat:@"baidumap://map/marker?location=%.20lf,%.20lf&title=%@&content=%@&src=%@",lat,lng,title,content,APPNAME];
        [self openBaiduMapClientWithURLString:clientShowInfo];
    }
    else
    {
        NSString *browserShowInfo = [NSString stringWithFormat:@"http://api.map.baidu.com/marker?location=%.20lf,%.20lf&title=%@&content =%@&output=html&src=%@",lat,lng,title,content,APPNAME];
        [self openBrowserWithURLString:browserShowInfo];

    }
 
}

#pragma mark - 显示地址对应的坐标点
/*
    调用该接口可以在调起百度地图时,当前页面显示地址对应的坐标点。
 
    <a href="baidumap://map/geocoder?address=北京市海淀区上地信息路 9 号奎科科技大厦&src=yourCompa nyName|yourAppName">地理编码</a>
    第一次调用时候卡在搜索界面 iPhone4s
*/

+ (void)showGeocodingWithAddress:(NSString*)address
{
    if (BaiduMapExists) {
    
        NSString *clientShowGeocoding = [NSString stringWithFormat:@"baidumap://map/geocoder?address=%@&src=%@",address,APPNAME];
        
        [self openBaiduMapClientWithURLString:clientShowGeocoding];
    }
    else
    {
        NSString *browsertShowGeocoding = [NSString stringWithFormat:@"http://api.map.baidu.com/geocoder?address=%@&output=html&src=%@",address,APPNAME];
        
        [self openBrowserWithURLString:browsertShowGeocoding];
    }

}

#pragma mark - 标注形式显示位置和地址信息
/*
    调用该接口可调起 iOS 百度地图,经过逆地理编码后,以标注形式显示位置和地址信息。
    
    //网页应用调起 iOS 百度地图方式举例
    <a href="baidumap://map/geocoder?location=39.990912172420714,116.32715863448607&coord_type =gcj02&src=yourCompanyName|yourAppName">逆地理编码</a>
*/
+ (void)showGeocodingWithLat:(double)lat lng:(double)lng
{
    if (BaiduMapExists) {
        NSString *clientShowGeocoding = [NSString stringWithFormat:@"baidumap://map/geocoder?location=%.20lf,%.20lf&coord_type =gcj02&src=%@",lat,lng,APPNAME];
        
        [self openBaiduMapClientWithURLString:clientShowGeocoding];
    }
    else
    {
        NSString *browserShowGeocoding = [NSString stringWithFormat:@"http://api.map.baidu.com/geocoder?location=%.20lf,%.20lf&coord_type=gcj02&output=html&src=%@",lat,lng,APPNAME];
        
        [self openBrowserWithURLString:browserShowGeocoding];
    }
}
#pragma mark - POI(地点)搜索
/*
 POI(地点)搜索
 <a href="baidumap://map/place/search?query=%E9%A4%90%E9%A6%86&location=31.204055632862, 121.41117785465&radius=1000&region=上海&src=yourCompanyName|yourAppName">周边检索</a>
 */
+ (void)POIQueryWithName:(NSString*)name lat:(double)lat lng:(double)lng radius:(double)radius region:(NSString*)region
{
    if (BaiduMapExists) {
    
        NSString *clientPOIQuery = [NSString stringWithFormat:@"baidumap://map/place/search?query=%@&location=%.20lf, %.20lf&radius=%lf&region=%@&src=%@",name,lat,lng,radius,region,APPNAME];
        
        [self openBaiduMapClientWithURLString:clientPOIQuery];
    }
    else
    {
        NSString *browserPOIQuery = [NSString stringWithFormat:@"http://api.map.baidu.com/place/search?query=%@&location=%.20lf,%.20lf&radius =%lf&region=%@&output=html&src=%@",name,lat,lng,radius,region,APPNAME];
        
        [self openBrowserWithURLString:browserPOIQuery];
    }
    
}

#pragma mark - POI 详情页展示
/*
    uid  POI的ID
    //网页应用调起 iOS 百度地图方式举例
    <a href="baidumap://map/place/detail?uid=d3099bdd81c525dbd1f49ee6&src=yourCompanyName|you rAppName">详情检索</a>
 */
+ (void)POIDetailQueryWithUid:(NSString*)uid
{
    if (BaiduMapExists) {
        NSString *clientPOIDetailQuery = [NSString stringWithFormat:@"baidumap://map/place/detail?uid=%@&src=%@",uid,APPNAME];
        [self openBaiduMapClientWithURLString:clientPOIDetailQuery];
    }
    else
    {
        NSString *browserPOIDetailQuery = [NSString stringWithFormat:@"http://api.map.baidu.com/place/detail?uid=%@&output=html&src=%@",uid,APPNAME];
        [self openBrowserWithURLString:browserPOIDetailQuery];
    }

}
#pragma mark - 公交、地铁线路查询
/**
 
 //网页应用调起 iOS 百度地图方式举例
 <a href="baidumap://map/line?region=北京&name=518&src=yourCompanyName|yourAppName">线路 检索</a>
 
 */
+ (void)busLineQueryWithRegion:(NSString*)region name:(NSString*)name
{
    if (BaiduMapExists) {
        NSString *clientBusLineQueryString = [NSString stringWithFormat:@"baidumap://map/line?region=%@&name=%@&src=%@",region,name,APPNAME];
        [self openBaiduMapClientWithURLString:clientBusLineQueryString];
    }
    else
    {
        NSString *browserBusLineQueryString = [NSString stringWithFormat:@"http://api.map.baidu.com/line?region=%@&name=%@&output=html&src=%@",region,name,APPNAME];
        [self openBrowserWithURLString:browserBusLineQueryString];
    }
}

#pragma mark - 客户端指定导航模式下从起点到终点的路线规划
/**
    //网页应用调起 iOS 百度地图方式举例
    <a href="baidumap://map/direction?origin=34.264642646862,108.95108518068&destination=40.00762 3,116.360582&mode=driving&src=yourCompanyName|yourAppName">驾车导航</a>
 
*/
+ (void)clientNavigationRouteOrigin:(double)originLat originLng:(double)originLng destinationLat:(double)destinationLat destinationLng:(double)destinationLng model:(NSString*)model
{
    if (BaiduMapExists) {
        NSString *clientNavigationRouteString = [NSString stringWithFormat:@"baidumap://map/direction?origin=%.20lf,%.20lf&destination=%.20lf,%.20lf&mode=%@&src=%@",originLat,originLng,destinationLat,destinationLng,model,APPNAME];
        [self openBaiduMapClientWithURLString:clientNavigationRouteString];
    }

}

#pragma mark - 浏览器指定导航模式下从起点到终点的路线规划
/**
 
    http://api.map.baidu.com/direction?origin=latlng:34.264642646862,108.95108518068|name:我家&destination=大雁塔&mode=driving&region=西安&output=html&src=yourCompanyName|yourAppName
    调起百度 PC 戒 Web 地图,展示“西安市”从(lat:34.264642646862,lng:108.95108518068 )“我家”到“大雁 塔”的驾车路线。
 ￼￼￼*/
 
+ (void)browserNavigationRouteOrigin:(double)originLat originLng:(double)originLng destination:(NSString*)destination region:(NSString*)region model:(NSString*)model
{
    NSString *browserNavigationRouteString = [NSString stringWithFormat:@"http://api.map.baidu.com/direction?origin=%.20lf,%.20lf&destination=%@&mode=%@&region=%@&output=html&src=%@",originLat,originLng,destination,model,region,APPNAME];
    [self openBrowserWithURLString:browserNavigationRouteString];
}
#pragma mark - 使用浏览器打开

+ (void)openBrowserWithURLString:(NSString*)openURL
{
    NSString *utf8URIString = [openURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url = [NSURL URLWithString:utf8URIString];
    
    [[UIApplication sharedApplication]openURL:url];
    NSLog(@"url:%@",url);
}

#pragma mark - 使用百度地图客户端打开
+ (void)openBaiduMapClientWithURLString:(NSString*)openURI
{
    NSString *utf8URIString = [openURI stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url = [NSURL URLWithString:utf8URIString];

    [[UIApplication sharedApplication]openURL:url];
   
}

@end
