//
//  iPadSplitViewController.swift
//  iPadSplitScreenDemo
//
//  Created by DevDragonLi on 9/10/2020.
//

import UIKit

@objcMembers open class iPadSplitViewController: UIViewController {
    
    fileprivate var iPadfullScreenViewLoaded: Bool = false
    
    fileprivate var iPadsmallScreenViewLoaded: Bool = false
    
    fileprivate var lastScreenInterfaceType: ScreenInterfaceType = .Unknown
    
    fileprivate var kCHECKISFULLSCREENVALUE: Int = 100
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        _updateViewLayoutDependenciesWithCurrentSize(currentSize:view.frame.size)
    }
    
    /// iPad 全屏模式【仅调用一次】
    open func ipadFullScreen()  {
        assert(false, "Please implement `ipadFullScreen Function` With" + NSStringFromClass(self.classForCoder))
    }
    /// iPad 小屏模式【仅调用一次】
    open func ipadSmallScreen()  {
        assert(false, "Please implement `ipadSmallScreen Function` With" + NSStringFromClass(self.classForCoder))
    }
    
    /// 小屏幕切换到大屏幕【处理逻辑】
    open func ipadSmallToFullScreenConfigurations()  {
        
    }
    
    /// 大屏幕切换到小屏幕【处理逻辑】
    open func ipadFullToSmallScreenConfigurations()  {
        
    }
    
}

extension iPadSplitViewController {
    
    open override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {    
        if self.isViewLoaded {
            _updateViewLayoutDependenciesWithCurrentSize(currentSize: size)
        }
    }
    
    fileprivate func _updateCurrentInterfaceOrientation()  {
        iPadSplitTool.tool.updateCurrentInterfaceOrientation()
    }
    
    fileprivate func _updateViewLayoutDependenciesWithCurrentSize(currentSize:CGSize) {
        _updateCurrentInterfaceOrientation()
        iPadSplitTool.tool.currentScreenWidth = currentSize.width
        _screenWithCurrentSize(currentSize: currentSize)
    }
    
    fileprivate func _screenWithCurrentSize(currentSize:CGSize) {
        
        let fullScreenWidth = UIScreen.main.bounds.width
        let currentWidth = currentSize.width
        
        
        if iPadSplitTool.tool.interfaceOrientationLandscape {
            if currentWidth < (fullScreenWidth * 0.40 ) {
                _handleDisplayElementsWhenScreenTypeChanged(changedType: .iPadLandscapeThirdScreen)
            } else if currentWidth < (fullScreenWidth * 0.60) {
                _handleDisplayElementsWhenScreenTypeChanged(changedType: .iPadLandscapeHalfScreen)
            } else if currentWidth < (fullScreenWidth * 0.80) {
                _handleDisplayElementsWhenScreenTypeChanged(changedType: .iPadLandscapeTwoThirdScreen)
            } else {
                _handleDisplayElementsWhenScreenTypeChanged(changedType: .iPadLandscapeFullScreen)
            }
        } else {
            
            if currentWidth < (fullScreenWidth * 0.50 ) {
                _handleDisplayElementsWhenScreenTypeChanged(changedType: .iPadPortraitThirdScreen)
            } else if currentWidth < (fullScreenWidth * 0.70) {
                _handleDisplayElementsWhenScreenTypeChanged(changedType: .iPadPortraitTwoThirdScreen)
            } else {
                _handleDisplayElementsWhenScreenTypeChanged(changedType: .iPadPortraitFullScreen)
            }
        }
    }
    
    fileprivate func _handleDisplayElementsWhenScreenTypeChanged (changedType:ScreenInterfaceType) {
        
        iPadSplitTool.tool.fullScreen = (changedType.rawValue < kCHECKISFULLSCREENVALUE)
        iPadSplitTool.tool.currentScreenInterfaceType = changedType
        
        if lastScreenInterfaceType == .Unknown {
            _configLastScreenType()
            if iPadSplitTool.tool.fullScreen {
                handleScreenChanged(isFullScreen: true)
            } else {
                handleScreenChanged(isFullScreen: false)
            }
            return
        }
        
        let isLastFullScreen = (lastScreenInterfaceType.rawValue < kCHECKISFULLSCREENVALUE);
        
        _configLastScreenType()
        
        if (isLastFullScreen == iPadSplitTool.tool.fullScreen) {
            return
        }
        
        if isLastFullScreen {
            ipadFullToSmallScreenConfigurations()
            if !iPadsmallScreenViewLoaded {
                handleScreenChanged(isFullScreen: false)
            }
        } else {
            ipadSmallToFullScreenConfigurations()
            if !self.iPadfullScreenViewLoaded {
                handleScreenChanged(isFullScreen: true)
            }
        }
    }
    
    
    fileprivate func handleScreenChanged(isFullScreen: Bool) {
        
        if isFullScreen {
            ipadFullScreen()
            iPadfullScreenViewLoaded = true
        } else {
            ipadSmallScreen()
            iPadsmallScreenViewLoaded = true
        }
    }
    
    
    fileprivate func _configLastScreenType() {
        lastScreenInterfaceType = iPadSplitTool.tool.currentScreenInterfaceType
    }
    
}
