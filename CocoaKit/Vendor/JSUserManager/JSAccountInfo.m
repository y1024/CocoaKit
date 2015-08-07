//
//  AccountInfo.m
//  MiYouGe
//
//  Created by sky on 15/6/26.
//  Copyright (c) 2015年 iOSDev. All rights reserved.
//

#import "JSAccountInfo.h"



@implementation JSAccountInfo

- (void)dealloc
{
    self.name = nil;
    self.userID = nil;
    self.loginDateString = nil;
    self.logOutDate = nil;
    self.userPwd = nil;
}

- (void)setAutoLogin:(BOOL)autoLogin
{
    _autoLogin = autoLogin;
}


@end
