//
//  JavaScriptCoreViewController.m
//  CocoaKit
//
//  Created by 杜晓星 on 15/4/10.
//  Copyright (c) 2015年 iOS. All rights reserved.
//

#import "JavaScriptCoreViewController.h"

#import <JavaScriptCore/JavaScriptCore.h>

#import "Person.h"

@interface JavaScriptCoreViewController ()

@end

@implementation JavaScriptCoreViewController


- (void)dealloc
{
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self tabBarShow];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self tabBarHidden];
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self jsCode];
    
}

- (void)jsCode
{
    
    [self setTitle:@"JavaScriptCoreViewController"];
    
    JSContext *context = [[JSContext alloc] init];
    [context evaluateScript:@"var num = 5 + 5"];
    [context evaluateScript:@"var names = ['Grace', 'Ada', 'Margaret']"];
    [context evaluateScript:@"var triple = function(value) { return value * 3 }"];
    JSValue *tripleNum = [context evaluateScript:@"triple(num)"];
    
    NSLog(@"Tripled: %d", [tripleNum toInt32]);
    
    JSValue *names = context[@"names"];
    JSValue *initialName = names[0];
    NSLog(@"The first name: %@", [initialName toString]);
    // The first name: Grace
    
    JSValue *tripleFunction = context[@"triple"];
    JSValue *result = [tripleFunction callWithArguments:@[@5] ];
    NSLog(@"Five tripled: %d", [result toInt32]);
    
    context.exceptionHandler = ^(JSContext *context, JSValue *exception) {
        NSLog(@"JS Error: %@", exception);
    };
    
    [context evaluateScript:@"function multiply(value1, value2) { return value1 * value2 "];
    
    context[@"simplifyString"] = ^(NSString *input) {
        NSMutableString *mutableString = [input mutableCopy];
        CFStringTransform((__bridge CFMutableStringRef)mutableString, NULL, kCFStringTransformToLatin, NO);
        CFStringTransform((__bridge CFMutableStringRef)mutableString, NULL, kCFStringTransformStripCombiningMarks, NO);
        return mutableString;
    };
    
    NSLog(@"%@", [context evaluateScript:@"simplifyString('안녕하새요!')"]);
    
    // export Person class
    context[@"Person"] = [Person class];
    
    // load Mustache.js
    NSString *mustacheJSString = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"mustache" ofType:@"js"] encoding:NSUTF8StringEncoding error:nil];
    [context evaluateScript:mustacheJSString];
    
    NSString *loadPersion = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"loadPeopleFromJSON" ofType:@"js"] encoding:NSUTF8StringEncoding error:nil];
    [context evaluateScript:loadPersion];
    
    // get JSON string
    NSString *peopleJSON = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"PeopleJSON" ofType:@"json"] encoding:NSUTF8StringEncoding error:nil];
    
    // get load function
    JSValue *load = context[@"loadPeopleFromJSON"];
    // call with JSON and convert to an NSArray
    JSValue *loadResult = [load callWithArguments:@[peopleJSON]];
    NSArray *people = [loadResult toArray];
    
    // get rendering function and create template
    JSValue *mustacheRender = context[@"Mustache"][@"render"];
    NSString *template = @"{{getFullName}}, born {{birthYear}}";
    
    // loop through people and render Person object as string
    for (Person *person in people) {
        NSLog(@"%@", [mustacheRender callWithArguments:@[template, person]]);
    }
    
    // Output:
    // Grace Hopper, born 1906
    // Ada Lovelace, born 1815
    // Margaret Hamilton, born 1936

}


@end
