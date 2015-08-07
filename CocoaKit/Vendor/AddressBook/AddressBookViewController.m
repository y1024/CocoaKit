//
//  AddressBookViewController.m
//  CocoaKit
//
//  Created by 杜晓星 on 15/4/10.
//  Copyright (c) 2015年 iOS. All rights reserved.
//

#import "AddressBookViewController.h"

#import <AddressBookUI/AddressBookUI.h>

@interface AddressBookViewController ()

@end

@implementation AddressBookViewController


- (void)dealloc
{
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self tabBarHidden];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self tabBarShow];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self buildABPeoplePickerNavigationController];
    
    
}

- (void)buildABPeoplePickerNavigationController
{
    [self setTitle:@"AddressBookViewController"];
    
    ABPeoplePickerNavigationController *abPeoplePickerNavigationController = [[ABPeoplePickerNavigationController alloc]init];
    [self presentViewController:abPeoplePickerNavigationController animated:YES completion:^{
       
        
    }];
}

@end
