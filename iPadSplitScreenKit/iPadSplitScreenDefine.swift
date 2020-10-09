//
//  iPadSplitScreenDefine.swift
//  iPadSplitScreenKit
//
//  Created by admin on 9/10/2020.
//

import Foundation

public enum ScreenInterfaceType: Int {
    
    case  Unknown                     = -1 // 预置占位类型
    
    case  iPadPortraitFullScreen       = 0  // 全屏幕 竖屏【Pad】
    
    case  iPadLandscapeFullScreen      = 1  // 全屏幕 横屏【Pad】
    
    case  iPadLandscapeTwoThirdScreen  = 2  // 2/3屏幕 横屏【Pad】
    
    case  iPadLandscapeHalfScreen      = 101 // 1/2屏幕 横屏【Pad】
    
    case  iPadLandscapeThirdScreen     = 102 // 1/3屏幕 横屏【Pad】
    
    case  iPadPortraitThirdScreen      = 103 // 4/10屏幕 竖屏【Pad】
    
    case  iPadPortraitTwoThirdScreen   = 104 // 6/10屏幕 竖屏【Pad】
}
