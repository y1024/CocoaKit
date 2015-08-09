//
//  MYTableView.h
//  CocoaKit
//
//  Created by sky on 15/6/11.
//  Copyright (c) 2015年 iOS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SRRefreshView.h"

@interface TSTableView : UITableView

{
    SRRefreshView   *_slimeView;
    
    
}

+ (instancetype)loadFromNibWithNibName:(NSString*)nibName;

- (id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style;

/**
 *  添加类似QQ的下拉刷新
 *
 *  @param target
 *  @param action
 */
- (SRRefreshView*)ts_addSRRefreshWithTarget:(id)target;

/**
 * 暂未实现
 *
 *  结束 类似QQ下拉刷新
 *
 *  @return
 */

- (void)ts_endSRRefresh;

/**
 *  添加传统的 MJ下拉刷新
 *
 *  @param target
 *  @param action
 */
- (void)ts_addMJHeaderWithTarget:(id)target action:(SEL)action;

/**
 *  需要修改内部代码
 *  增加图片
 *
 *  @param target target
 *  @param aciton action
 */
- (void)ts_addMJGifHeaderWithTarget:(id)target action:(SEL)aciton;

/**
 *  开始MJ下拉刷新
 */
- (void)ts_beginMJRefresh;

/**
 *  结束MJ刷新
 */
- (void)ts_endMJRefresh;

/**
 *  添加 传统的 MJ上提加载
 *
 *  @param target
 *  @param action
 */
- (void)ts_addMJFooterWithTarget:(id)target action:(SEL)action;

/**
 *  添加 GIF footer 上提加载 需要修改内部代码
 */
- (void)ts_addMJGifFooterWithTarget:(id)target action:(SEL)action;


/**
 *  结束 上提加载
 */
- (void)ts_endMJLoadMore;

/**
 *  结束 上提加载 无最多数据状态
 */
- (void)ts_endMJLoadNoMore;

/**
 *  重置 上提加载状态
 */
- (void)ts_resetMJFooter;

@end
