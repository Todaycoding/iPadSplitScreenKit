//
//  iPadSplitScreenVC.h
//  iPadSplitScreenKit
//
//  Created by DevDragonLi on 27/9/2020.

/**
 ZDBaseViewController使用说明：
 
 1.  界面控制器继承此控制器类
 2.1 viewDidLoad拆分到ipadFullScreen或者ipadSmallScreen实现【仅UI逻辑：布局，交互等】。
 2.2 viewDidLoad中逻辑代码通用不需要改动！！！【 Example viewDidLoad打点，通知等逻辑不变】
 3. 屏幕出现需要改变布局时刻【移除当前部分视图，保存当前session数据等场景,请ipadSmallToFull/ipadSmallToFull中处理。
 5. 当前屏幕旋转，改变大小，若不需要改变布局，则相关函数不会触发，悉知。
 
 
 辅助说明：
 1. 判断当前是否全屏【OC使用此宏即可】 ： ZDISFULLSCREEN
 
 */

#import <UIKit/UIKit.h>
#import "iPadSplitScreenStatusTool.h"

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

