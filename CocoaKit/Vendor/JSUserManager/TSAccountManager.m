//
//  MYUserManager.m
//  MiYouGe
//
//  Created by sky on 15/6/26.
//  Copyright (c) 2015年 iOSDev. All rights reserved.
//

#import "TSAccountManager.h"
#import "TSAccountInfo.h"

#import "MJExtension.h"
#import "CocoaKit.h"
#import "TSKeyValueStoreHeaders.h"


@implementation TSAccountManager



- (void)dealloc
{
    self.currentAccountInfo = nil;
    self.accountMutableArray = nil;
}


- (TSAccountInfo*)currentAccountInfo
{
    TSAccountInfo *current = nil;
    NSInteger arrayCount = _accountMutableArray.count;
    if (!nullArray(_accountMutableArray)) {
        current  = nil;
    }
    else
    {
        if (arrayCount == 1 ) {
             current = _accountMutableArray[0];
        }
        else{
            NSInteger i ,j;

            for (j = 0 ; j < arrayCount; j++) {
                for (i = 0; i < arrayCount -1 - j; i++) {
                    TSAccountInfo *curretInfo = _accountMutableArray[i];
                    TSAccountInfo *nextInfo = _accountMutableArray[i + 1];
                    NSComparisonResult result = [[NSDate fromString:curretInfo.loginDateString] compare:[NSDate fromString:nextInfo.loginDateString]];
                    if (result == NSOrderedAscending) {
                        [_accountMutableArray exchangeObjectAtIndex:i withObjectAtIndex:i+1];
                    }
                }
            }
            
            current = _accountMutableArray[0];
            
        }
    }
    
    return current;
}

#pragma mark - init

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.accountMutableArray = [NSMutableArray array];
        NSArray *allAccountJSONString = [[TSKeyValueStore shareKeyValueStore]getAllItemsFromTable:JS_AccountDBName];
        [allAccountJSONString enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            YTKKeyValueItem *item = obj;
            
            TSAccountInfo *info = [TSAccountInfo objectWithKeyValues:item.itemObject];
            [_accountMutableArray addObject:info];
        }];
        
    }
    return self ;
}




@end
