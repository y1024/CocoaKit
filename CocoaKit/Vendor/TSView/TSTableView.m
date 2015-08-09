//
//  MYTableView.m
//  CocoaKit
//
//  Created by sky on 15/6/11.
//  Copyright (c) 2015年 iOS. All rights reserved.
//

#import "TSTableView.h"
#import "CocoaKit.h"

#import "MJRefresh.h"

@implementation TSTableView

+ (instancetype)loadFromNibWithNibName:(NSString*)nibName
{
    return [[[NSBundle mainBundle]loadNibNamed:nibName owner:nil options:nil]firstObject];
}

- (id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    
    if (self) {
        
        self.backgroundColor = [UIColor clearColor];
        
    }
    
    return self ;
    
}

- (SRRefreshView*)ts_addSRRefreshWithTarget:(id<SRRefreshDelegate>)target
{
    _slimeView = [[SRRefreshView alloc] init];
    _slimeView.delegate = target;
    _slimeView.slimeMissWhenGoingBack = YES;
    _slimeView.slime.bodyColor = [UIColor grayColor];
    _slimeView.slime.skinColor = [UIColor whiteColor];
    _slimeView.slime.lineWith = 1;
    _slimeView.slime.shadowBlur = 4;
    _slimeView.slime.shadowColor = [UIColor grayColor];
    [_slimeView update:64];
    CGRect rect = self.frame;
    self.frame = CGRectMake(rect.origin.x, rect.origin.y - 44, rect.size.width, rect.size.height);
    [self addSubview:_slimeView];
    
    return _slimeView;
}

- (void)ts_endSRRefresh
{
    
}

- (void)ts_addMJHeaderWithTarget:(id)target action:(SEL)action
{
    self.header = [MJRefreshNormalHeader headerWithRefreshingTarget:target refreshingAction:action];
    
    [self ts_beginMJRefresh];
}

- (void)ts_addMJGifHeaderWithTarget:(id)target action:(SEL)aciton
{
    self.header = [MJRefreshGifHeader headerWithRefreshingTarget:target refreshingAction:aciton];
}


- (void)ts_beginMJRefresh
{
    [self.header beginRefreshing];
}

- (void)ts_endMJRefresh
{
    [self.header endRefreshing];
}

- (void)ts_addMJFooterWithTarget:(id)target action:(SEL)_action
{
        self.footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:target refreshingAction:_action];
}

- (void)ts_addMJGifFooterWithTarget:(id)target action:(SEL)action
{
        self.footer = [MJRefreshAutoGifFooter footerWithRefreshingTarget:self refreshingAction:action];
}

- (void)ts_endMJLoadMore
{
    [self.footer endRefreshing];
}

- (void)ts_endMJLoadNoMore
{
    [self.footer noticeNoMoreData];
}

- (void)ts_resetMJFooter
{
    [self.footer resetNoMoreData];
}


@end
