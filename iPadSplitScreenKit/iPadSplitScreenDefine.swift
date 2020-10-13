//
//  iPadSplitScreenDefine.swift
//  iPadSplitScreenKit
//
//  Created by DevDragonLi on 9/10/2020.
//

import Foundation

public enum ScreenInterfaceType: Int {
    
    case  Unknown                      = -1 // 预置占位类型
    
    case  iPadPortraitFullScreen       = 0  // 全屏幕 竖屏【Pad】
    
    case  iPadLandscapeFullScreen      = 1  // 全屏幕 横屏【Pad】
    
    case  iPadLandscapeTwoThirdScreen  = 2  // 约 2/3屏幕 横屏【Pad】
    
    case  iPadCheckFullScreen          = 100 // 基准类型
    
    case  iPadLandscapeHalfScreen      = 101 // 约 1/2屏幕 横屏【Pad】
    
    case  iPadLandscapeThirdScreen     = 102 // 约 1/3屏幕 横屏【Pad】
    
    case  iPadPortraitThirdScreen      = 103 // 约 4/10屏幕 竖屏【Pad】
    
    case  iPadPortraitTwoThirdScreen   = 104 // 约 6/10屏幕 竖屏【Pad】
}

public enum ScreenInterfaceChangeType: Int {
    
    case  Unknown                      = -1 // 预置占位类型
    
    case  changedEarliest              =  0 //  屏幕改变即第一时间调用【时机最先】
    
    case  changing                     =  1 // 屏幕改变中调用
    
    case  ChangedLatter                =  2 //组件内部处理完成后调用【已完成布局】
}

