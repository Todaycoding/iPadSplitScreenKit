//
//  iPadSplitTool.swift
//  iPadSplitScreenKit
//
//  Created by DevDragonLi on 9/10/2020.
//

import Foundation

@objcMembers open class iPadSplitTool {
    
    public static let `tool` = iPadSplitTool()
    
    public internal (set) var fullScreen: Bool
    
    public internal (set) var interfaceOrientationLandscape: Bool
    
    public internal (set) var currentScreenWidth: CGFloat
    
    public internal (set) var currentScreenHeight: CGFloat
    
    public internal (set) var currentScreenInterfaceType: ScreenInterfaceType
    
    public static var SplitScreenChangeNotification : String {
        "kSplitScreenChangeNotification"
    }
    
    private init() {
        interfaceOrientationLandscape = false
        fullScreen = false
        currentScreenWidth = 0.0
        currentScreenHeight = 0.0
        currentScreenInterfaceType = .Unknown
    }
    
    internal func updateCurrentInterfaceOrientation()  {
//        interfaceOrientationLandscape = UIApplication.shared.statusBarOrientation.isLandscape
        let fullWidth = UIScreen.main.bounds.width
        let fullHeight = UIScreen.main.bounds.height
        interfaceOrientationLandscape = fullWidth > fullHeight;
    }
    
    
    internal func updateCurrentInterfaceSize(_ currentsize:CGSize)  {
        if currentsize.equalTo(CGSize.zero) {
            return;
        }
        self.currentScreenWidth = currentsize.width;
        self.currentScreenHeight = currentsize.height;
    }
    
    internal func updateScreenInterfaceAttributes()  {
        
        let fullScreenWidth = UIScreen.main.bounds.width
        if interfaceOrientationLandscape {
            if currentScreenWidth < (fullScreenWidth * 0.40 ) {
              currentScreenInterfaceType = .iPadLandscapeThirdScreen
            } else if currentScreenWidth < (fullScreenWidth * 0.60) {
                currentScreenInterfaceType = .iPadLandscapeHalfScreen
            } else if currentScreenWidth < (fullScreenWidth * 0.80) {
                currentScreenInterfaceType = .iPadLandscapeTwoThirdScreen
            } else {
                currentScreenInterfaceType = .iPadLandscapeFullScreen
            }
        } else {
            if currentScreenWidth < (fullScreenWidth * 0.50 ) {
                currentScreenInterfaceType = .iPadPortraitThirdScreen
            } else if currentScreenWidth < (fullScreenWidth * 0.70) {
                currentScreenInterfaceType = .iPadPortraitTwoThirdScreen
            } else {
                currentScreenInterfaceType = .iPadPortraitFullScreen
            }
        }
        let iPadCheckFullScreen:ScreenInterfaceType = .iPadCheckFullScreen
        fullScreen = (currentScreenInterfaceType.rawValue < iPadCheckFullScreen.rawValue);
    }
    
}

