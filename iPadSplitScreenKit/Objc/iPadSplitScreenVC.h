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

/**
 * 如果在界面切换前，需要做一些自定义事件！！！重写以下函数处理逻辑即可
 * Example 1：弹框由开启到关闭，此时用户切换界面大小，此处可以保存用户上次调整的开关状态
 * Example 2：不同界面存在不同的UI，需要切换期间动态处理！
 * 其他场景：
 */

/// 小屏幕切换到大屏幕【处理逻辑】
- (void)ipadSmallToFullScreenConfigurations;

/// 大屏幕切换到小屏幕【处理逻辑】
- (void)ipadFullToSmallScreenConfigurations;

@end

