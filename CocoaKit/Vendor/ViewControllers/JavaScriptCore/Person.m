//
//  Person.m
//  JavaScriptCore
//
//  Created by 杜晓星 on 15/4/2.
//  Copyright (c) 2015年 iOS. All rights reserved.
//

#import "Person.h"


// in Person.m -----------------
@implementation Person
- (NSString *)getFullName {
    return [NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName];
}

+ (instancetype) createWithFirstName:(NSString *)firstName lastName:(NSString *)lastName {
    Person *person = [[Person alloc] init];
    person.firstName = firstName;
    person.lastName = lastName;
    return person;
}
@end

