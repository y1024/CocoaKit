//
//  MainViewController.m
//  CocoaKit
//
//  Created by 杜晓星 on 15/3/31.
//  Copyright (c) 2015年 iOS. All rights reserved.
//

#import "MainViewController.h"

#import "QRViewController.h"

#import "JavaScriptCoreViewController.h"

#import "AddressBookViewController.h"

#import "TSObject.h"

#import "TSTableView.h"

#import "BlurViewController.h"

#import "UIScrollView+TwitterCover.h"

#import "WebNativeDemoViewController.h"

#import "MYHUD.h"


@interface MainViewController ()<UITableViewDataSource,UITableViewDelegate>

{
    NSArray         *_dataSourceArray;
    TSTableView    *_tableView ;
    SRRefreshView   *_slimeView;
}

@end

@implementation MainViewController

#warning [_slimeView removeFromSuperview]
- (void)dealloc
{
    [_slimeView removeFromSuperview];
    _slimeView = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self tabBarHidden];
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
            [self setEdgesForExtendedLayout:UIRectEdgeNone];
        }
        if ([self respondsToSelector:@selector(setAutomaticallyAdjustsScrollViewInsets:)]) {
            [self setAutomaticallyAdjustsScrollViewInsets:NO];
        }
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self buildSubViews];
}

- (void)buildSubViews
{
    
    [self setTitle:@"MainViewController"];
    
    
    _tableView = [[TSTableView alloc]initWithFrame:CGRectMake(0,0, ScreenWidth(), ScreenHeight() - [self tabBarHeight]) style:UITableViewStylePlain];

    
    [self.view addSubview:_tableView];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    _slimeView =   [_tableView ts_addSRRefreshWithTarget:self];

    [_tableView ts_addMJFooterWithTarget:self action:@selector(mjLoadMore)];
    
    _dataSourceArray = @[@"QRViewController",@"JavaScriptCoreViewController",@"AddressBookViewController",@"MYObject",@"BlurViewController",@"WebNativeDemoViewController"];
}

#warning 必须实现
#pragma mark - scrollView delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [_slimeView scrollViewDidScroll];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [_slimeView scrollViewDidEndDraging];
}

#pragma mark - slimeRefresh delegate

- (void)slimeRefreshStartRefresh:(SRRefreshView *)refreshView
{
    [_slimeView performSelector:@selector(endRefresh)
                     withObject:nil afterDelay:3
                        inModes:[NSArray arrayWithObject:NSRunLoopCommonModes]];
}


- (void)mjRefresh
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [_tableView ts_endMJRefresh];
        
    });
}
- (void)mjLoadMore
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [_tableView ts_endMJLoadNoMore];
    });
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataSourceArray count];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = _dataSourceArray[indexPath.row];

    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.row) {
        case 0:
        {
            QRViewController *viewController = [[QRViewController alloc]init];
            
            [self.navigationController pushViewController:viewController animated:YES];

        }
            break;
            
        case 1:
        {
            JavaScriptCoreViewController *viewController = [[JavaScriptCoreViewController alloc]init];
            
            [self.navigationController pushViewController:viewController animated:YES];
            
        }
            break;
            
            case 2:
        {
            AddressBookViewController *bookVC = [[AddressBookViewController alloc]init];
            [self.navigationController pushViewController:bookVC animated:YES];
        }
            break;
            
        case 3:
        {
            [MYHUD showMBPhUDWithLoadingState];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                
                [MYHUD hideMBPHub];
            });
            
        }
            break;
        case 4:
        {
            
            [MYHUD showMBPHudWithTextOnly:@"加载中"];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                
                BlurViewController *blurVC = [[BlurViewController alloc]init];
                [self.navigationController pushViewController:blurVC animated:YES];
                blurVC = nil;
                
            });
            

            
        }
            break;
            case 5:
        {
            WebNativeDemoViewController *webNativeVC = [[WebNativeDemoViewController alloc]init];
            [self.navigationController pushViewController:webNativeVC animated:YES];
            webNativeVC = nil;
        }
            
        default:
            break;
    }
}



@end
