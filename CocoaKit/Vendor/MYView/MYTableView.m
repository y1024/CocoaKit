//
//  MYTableView.m
//  CocoaKit
//
//  Created by sky on 15/6/11.
//  Copyright (c) 2015年 iOS. All rights reserved.
//

#import "MYTableView.h"
#import "CocoaKit.h"

#import "MJRefresh.h"

@implementation MYTableView

- (id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    
    if (self) {
        
        self.backgroundColor = [UIColor clearColor];
        
    }
    
    return self ;
    
}

- (SRRefreshView*)addSRRefreshWithTarget:(id<SRRefreshDelegate>)target
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

- (void)endSRRefresh
{
    
}

- (void)addMJHeaderWithTarget:(id)target action:(SEL)action
{
    [self addLegendHeaderWithRefreshingTarget:target refreshingAction:action];
    
    [self.header beginRefreshing];
}

- (void)addMJGifHeaderWithTarget:(id)target action:(SEL)aciton
{
    [self addGifHeaderWithRefreshingTarget:target refreshingAction:aciton];
}

- (void)endMJRefresh
{
    [self.header endRefreshing];
}

- (void)addMJFooterWithTarget:(id)target action:(SEL)_action
{
    [self addLegendFooterWithRefreshingTarget:target refreshingAction:_action];
}

- (void)addMJGifFooterWithTarget:(id)target action:(SEL)action
{
    [self addGifFooterWithRefreshingTarget:target refreshingAction:action];
}

- (void)endMJLoadMore
{
    [self.footer endRefreshing];
}

- (void)endMJLoadNoMore
{
    [self.footer noticeNoMoreData];
}

- (void)resetMJFooter
{
    [self.footer resetNoMoreData];
}


@end
