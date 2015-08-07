//
//  Person.h
//  JavaScriptCore
//
//  Created by 杜晓星 on 15/4/2.
//  Copyright (c) 2015年 iOS. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <JavaScriptCore/JavaScriptCore.h>

// in Person.h -----------------
@class Person;

@protocol PersonJSExports <JSExport>
@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *lastName;
@property NSInteger ageToday;

- (NSString *)getFullName;

// create and return a new Person instance with `firstName` and `lastName`
+ (instancetype)createWithFirstName:(NSString *)firstName lastName:(NSString *)lastName;
@end

@interface Person : NSObject <PersonJSExports>
@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *lastName;
@property NSInteger ageToday;
@end
