//
//  AccountInfo.h
//  MiYouGe
//
//  Created by sky on 15/6/26.
//  Copyright (c) 2015年 iOSDev. All rights reserved.
//

#import "JSObject.h"

@interface JSAccountInfo : JSObject

@property(nonatomic,assign)NSInteger        role; ///角色

@property(nonatomic,strong)NSString         *userID;
@property(nonatomic,strong)NSString         *userPwd;
@property(nonatomic,strong)NSString         *name;

@property(nonatomic,strong)NSString         *loginDateString;
@property(nonatomic,strong)NSString         *logOutDate;

@property(nonatomic,assign)BOOL             remeberPwd;
@property(nonatomic,assign)BOOL             autoLogin;
@property(nonatomic,assign)NSInteger        loginCount;// 登陆次数

@end
