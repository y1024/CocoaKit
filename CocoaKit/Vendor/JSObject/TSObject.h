//
//  MYObject.h
//  CocoaKit
//
//  Created by sky on 15/6/11.
//  Copyright (c) 2015年 iOS. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface TSObject : NSObject<NSCoding>

- (BOOL)saveToFile:(NSString *)path;
+ (id)loadFromFile:(NSString *)path;

- (id)initWithCoder:(NSCoder *)aDecoder;

@end
