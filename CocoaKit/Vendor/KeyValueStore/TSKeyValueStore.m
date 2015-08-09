//
//  KeyValueStore.m
//  CocoaKit
//
//  Created by 杜晓星 on 15/3/31.
//  Copyright (c) 2015年 iOS. All rights reserved.
//

#import "TSKeyValueStore.h"


#import "MJExtension.h"


#import "CocoaKit.h"

static TSKeyValueStore      *_keyValueStore = nil ;

static YTKKeyValueStore     *_ytkKeyValueStore = nil ;

@implementation TSKeyValueStore

- (void)dealloc
{
    NSLog(@"%s",__FUNCTION__);
    
    [_ytkKeyValueStore close];
    _ytkKeyValueStore = nil ;
}



- (instancetype)init
{
    
    if (_keyValueStore) {
        
        return _keyValueStore ;
    }
    else
    {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            
            _keyValueStore = [super init];
            
            
            if (!_ytkKeyValueStore) {
                
                NSLog(@"_ytkKeyValueStore");
                
                NSString *DBFileName = [NSString stringWithFormat:@"%@-%@_.sqlite",APPName(),APPBuildVersion()];
                
                _ytkKeyValueStore = [[YTKKeyValueStore alloc]initDBWithName:DBFileName];
            }
        });
    }
    return _keyValueStore ;
    
}

+ (instancetype)shareKeyValueStore
{
    if (_keyValueStore) {
        
        return _keyValueStore;
    }
    
    
    _keyValueStore = [[super allocWithZone:nil]init];
    
    return _keyValueStore ;
}

#pragma mark + allocWithZone
+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    return [self shareKeyValueStore];
}
#pragma mark - copyWithZone
- (instancetype)copyWithZone:(NSZone*)zone
{
    return self ;
}


- (void)createTableWithName:(NSString *)tableName
{
    [_ytkKeyValueStore createTableWithName:tableName];
}



- (void)clearTable:(NSString *)tableName
{
    [_ytkKeyValueStore clearTable:tableName];
}

- (void)close
{
    [_ytkKeyValueStore close];
}

///************************ Put&Get methods *****************************************
- (void)putObject:(id)object withId:(NSString *)objectId intoTable:(NSString *)tableName
{
    [_ytkKeyValueStore putObject:object withId:objectId intoTable:tableName];
    
}

- (id)getObjectById:(NSString *)objectId fromTable:(NSString *)tableName
{
   return  [_ytkKeyValueStore getObjectById:objectId fromTable:tableName];
}

- (YTKKeyValueItem *)getYTKKeyValueItemById:(NSString *)objectId fromTable:(NSString *)tableName
{
    return [_ytkKeyValueStore getYTKKeyValueItemById:objectId fromTable:tableName];
}

- (void)putString:(NSString *)string withId:(NSString *)stringId intoTable:(NSString *)tableName
{
    [_ytkKeyValueStore putString:string withId:stringId intoTable:tableName];
}

- (NSString *)getStringById:(NSString *)stringId fromTable:(NSString *)tableName
{
    return [_ytkKeyValueStore getStringById:stringId fromTable:tableName];
}

- (void)putNumber:(NSNumber *)number withId:(NSString *)numberId intoTable:(NSString *)tableName
{
    [_ytkKeyValueStore putNumber:number withId:numberId intoTable:tableName];
}

- (NSNumber *)getNumberById:(NSString *)numberId fromTable:(NSString *)tableName
{
    return [_ytkKeyValueStore getNumberById:numberId fromTable:tableName];
}

- (NSArray *)getAllItemsFromTable:(NSString *)tableName
{
    return [_ytkKeyValueStore getAllItemsFromTable:tableName];
}

- (void)deleteObjectById:(NSString *)objectId fromTable:(NSString *)tableName
{
    [_ytkKeyValueStore deleteObjectById:objectId fromTable:tableName];
}

- (void)deleteObjectsByIdArray:(NSArray *)objectIdArray fromTable:(NSString *)tableName
{
    [_ytkKeyValueStore deleteObjectsByIdArray:objectIdArray fromTable:tableName];
}

- (void)deleteObjectsByIdPrefix:(NSString *)objectIdPrefix fromTable:(NSString *)tableName
{
    [_ytkKeyValueStore deleteObjectsByIdPrefix:objectIdPrefix fromTable:tableName];
}



@end
