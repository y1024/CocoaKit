//
//  MYUserManager.h
//  MiYouGe
//
//  Created by sky on 15/6/26.
//  Copyright (c) 2015年 iOSDev. All rights reserved.
//

#import "TSObject.h"

@class JSAccountInfo;

@interface JSAccountManager : TSObject

@property(nonatomic,strong)JSAccountInfo      *currentAccountInfo;
@property(nonatomic,strong)NSMutableArray     *accountMutableArray;



- (JSAccountInfo*)currentAccountInfo;





@end
