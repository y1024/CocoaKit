//
//  MYUserManager.h
//  MiYouGe
//
//  Created by sky on 15/6/26.
//  Copyright (c) 2015年 iOSDev. All rights reserved.
//

#import "TSObject.h"

@class TSAccountInfo;

@interface TSAccountManager : TSObject

@property(nonatomic,strong)TSAccountInfo      *currentAccountInfo;
@property(nonatomic,strong)NSMutableArray     *accountMutableArray;



- (TSAccountInfo*)currentAccountInfo;





@end
