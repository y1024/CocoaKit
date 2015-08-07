//
//  BaseViewController.m
//  CocoaKit
//
//  Created by 杜晓星 on 15/4/10.
//  Copyright (c) 2015年 iOS. All rights reserved.
//

#import "BaseViewController.h"





@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)dealloc
{
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self customizeInterface];
}


- (void)customizeInterface {
    UINavigationBar *navigationBarAppearance = [UINavigationBar appearance];
    
    
    UIImage *backgroundImage = nil;
    NSDictionary *textAttributes = nil;
    
    if (NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_6_1) {
        backgroundImage = [UIImage imageNamed:@"navigationbar_background_tall"];
        
        textAttributes = @{
                           NSFontAttributeName: [UIFont boldSystemFontOfSize:18],
                           NSForegroundColorAttributeName: [UIColor blackColor],
                           };
    } else {
#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_7_0
        backgroundImage = [UIImage imageNamed:@"navigationbar_background"];
        
        textAttributes = @{
                           UITextAttributeFont: [UIFont boldSystemFontOfSize:18],
                           UITextAttributeTextColor: [UIColor blackColor],
                           UITextAttributeTextShadowColor: [UIColor clearColor],
                           UITextAttributeTextShadowOffset: [NSValue valueWithUIOffset:UIOffsetZero],
                           };
#endif
    }
    
    [navigationBarAppearance setBackgroundImage:backgroundImage
                                  forBarMetrics:UIBarMetricsDefault];
    [navigationBarAppearance setTitleTextAttributes:textAttributes];
}



- (void)setIndex:(NSInteger)index selectedBackgroundImage:(NSString*)selectedImage unSelectedBackgroundImage:(NSString*)unSelectedBackgroundImage
{
    RDVTabBarItem  *item = [[[self rdv_tabBarController]tabBar]items][index];
    
    [item setBackgroundSelectedImage:NoCache(selectedImage) withUnselectedImage:NoCache(unSelectedBackgroundImage)];
}

- (void)setIndex:(NSInteger)index SelectedImage:(NSString*)selectedImage unSelectedImage:(NSString*)unSelectedImage
{
   RDVTabBarItem  *item = [[[self rdv_tabBarController]tabBar]items][index];
    
    [item setFinishedSelectedImage:NoCache(selectedImage) withFinishedUnselectedImage:NoCache(unSelectedImage)];
}

- (void)tabBarHidden
{
    [[self rdv_tabBarController]setTabBarHidden:YES animated:YES];
}

- (void)tabBarShow
{
    [[self rdv_tabBarController]setTabBarHidden:NO animated:YES];
}

- (CGFloat)tabBarHeight
{
    return [self rdv_tabBarController].tabBar.minimumContentHeight;
}

- (void)setBadgeValue:(NSInteger)_badgeValue
{
    [[self rdv_tabBarItem]setBadgeValue:[NSString stringWithFormat:@"%ld",(long)_badgeValue]];

    
}
- (NSUInteger)supportedInterfaceOrientations {
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        return UIInterfaceOrientationMaskAll;
    } else {
        return UIInterfaceOrientationMaskPortrait;
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        return YES;
    }
    return toInterfaceOrientation == UIInterfaceOrientationPortrait;
}

@end
