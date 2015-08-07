//
//  MYCollectionView.m
//  CocoaKit
//
//  Created by sky on 15/6/11.
//  Copyright (c) 2015年 iOS. All rights reserved.
//

#import "MYCollectionView.h"
#import "MJRefresh.h"

#import "CocoaKit.h"

@implementation MYCollectionView

- (id)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout
{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    
    if (self) {
        
        self.backgroundColor = RGB(225, 225, 225);
    }
    
    return self;
    
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
