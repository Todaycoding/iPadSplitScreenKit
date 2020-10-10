//
//  iPadSplitScreenVC.h
//  iPadSplitScreenKit
//
//  Created by DevDragonLi on 27/9/2020.

#import <UIKit/UIKit.h>
#import <iPadSplitScreenKit/iPadSplitScreenStatusTool.h>

@interface iPadSplitScreenVC : UIViewController

#pragma mark ---iPad adapter Main function

/// iPad 全屏模式【仅调用一次】
- (void)ipadFullScreen;

/// iPad 小屏模式【仅调用一次】
- (void)ipadSmallScreen;

/// 小屏幕切换到大屏幕【处理逻辑】
- (void)ipadSmallToFullScreenConfigurations;

/// 大屏幕切换到小屏幕【处理逻辑】
- (void)ipadFullToSmallScreenConfigurations;

@end

