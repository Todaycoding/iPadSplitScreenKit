//
//  iPadSplitTool.swift
//  iPadSplitScreenKit
//
//  Created by admin on 9/10/2020.
//

import Foundation

@objcMembers open class iPadSplitTool {
    
    private init() {
        interfaceOrientationLandscape = false
        fullScreen = false
        currentScreenInterfaceType = .Unknown
    }
    
    static let `tool` = iPadSplitTool()
    
    public internal (set) var fullScreen: Bool
    
    public internal (set) var interfaceOrientationLandscape: Bool
    
    public internal (set) var currentScreenInterfaceType: ScreenInterfaceType
}

