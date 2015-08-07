//
//  BaiduMapURIEngine.h
//  BaiduMapURIDemo
//
//  Created by soarsky on 14/12/11.
//  Copyright (c) 2014年 KaiFa_3_Bu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaiduMapURIEngine : NSObject

//导航路线图 默认驾车
+ (void)navigationRoutefrom:(NSString*)from destination:(NSString*)destination where:(NSString*)region;
//指定坐标点上显示点的名称和内容信息
+ (void)showInfoWithTitle:(NSString*)title content:(NSString*)content lat:(double)lat lng:(double)lng;
//显示地址对应的坐标点
+ (void)showGeocodingWithAddress:(NSString*)address;
//标注形式显示位置和地址信息
+ (void)showGeocodingWithLat:(double)lat lng:(double)lng;
//POI(地点)搜索
+ (void)POIQueryWithName:(NSString*)name lat:(double)lat lng:(double)lng radius:(double)radius region:(NSString*)region;
//POI 详情页展示
+ (void)POIDetailQueryWithUid:(NSString*)uid;

//公交、地铁线路查询
+ (void)busLineQueryWithRegion:(NSString*)region name:(NSString*)name;
//客户端 指定导航模式下从起点到终点的路线规划
+ (void)clientNavigationRouteOrigin:(double)originLat originLng:(double)originLng destinationLat:(double)destinationLat destinationLng:(double)destinationLng model:(NSString*)model;
//浏览器 指定导航模式下从起点到终点的路线规划
+ (void)browserNavigationRouteOrigin:(double)originLat originLng:(double)originLng destination:(NSString*)destination region:(NSString*)region model:(NSString*)model;
@end
