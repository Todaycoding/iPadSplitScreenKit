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
    
    fileprivate var iPadCommonSetuped: Bool = false
    
    fileprivate var lastScreenInterfaceType: ScreenInterfaceType = .Unknown
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        _updateViewLayoutDependenciesWithCurrentSize(currentSize:view.frame.size)
    }
    
    /// 当前界面共同视图/逻辑添加此处【仅调用一次】
    /// 【原：viewDidLoad公用/调通UI/逻辑迁移至此函数】
    /// 【Example：界面的CollectionView为大小屏的通用视图，则此处添加，不需要ipadFullScreen和ipadSmallScreen函数处理】
    open func ipadCommonSetup()  {
        
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
    
    /// 每次屏幕改变均调用此函数【分屏操作，横竖屏改变，子类控制器可通过此函数获取时机】
    open func ipadInterfaceOrientationChanged(changeType:ScreenInterfaceChangeType,currentSize:CGSize) {
        
    }
}

extension iPadSplitViewController {
    
    open override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {    
        if self.isViewLoaded {
            _updateViewLayoutDependenciesWithCurrentSize(currentSize: size)
            ipadInterfaceOrientationChanged(changeType: .changedEarliest, currentSize: size)
        } else {
            ipadInterfaceOrientationChanged(changeType: .pageFristRendering, currentSize: size)
        }
    }
    fileprivate func split_privateIpadCommonSetup () {
        if !iPadCommonSetuped {
            ipadCommonSetup()
            iPadCommonSetuped = true
        }
    }
    fileprivate func _updateCurrentInterfaceOrientation()  {
        iPadSplitTool.tool.updateCurrentInterfaceOrientation()
    }
    
    fileprivate func _updateViewLayoutDependenciesWithCurrentSize(currentSize:CGSize) {
        
        iPadSplitTool.tool.updateCurrentInterfaceOrientation()
        iPadSplitTool.tool.updateCurrentInterfaceSize(currentSize)
        iPadSplitTool.tool.updateScreenInterfaceAttributes()
                
        split_privateIpadCommonSetup()
        
        if lastScreenInterfaceType == .Unknown {
            _configLastScreenType()
            if iPadSplitTool.tool.fullScreen {
                handleScreenChanged(isFullScreen: true)
            } else {
                handleScreenChanged(isFullScreen: false)
            }
            return
        }
        
        let iPadCheckFullScreen:ScreenInterfaceType = .iPadCheckFullScreen
        
        let isLastFullScreen = (lastScreenInterfaceType.rawValue < iPadCheckFullScreen.rawValue);
        
        _configLastScreenType()
        
        if (isLastFullScreen == iPadSplitTool.tool.fullScreen) {
            ipadInterfaceOrientationChanged(changeType: .changedLatter, currentSize: currentSize)
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
        ipadInterfaceOrientationChanged(changeType: .changedLatter, currentSize: currentSize)
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
