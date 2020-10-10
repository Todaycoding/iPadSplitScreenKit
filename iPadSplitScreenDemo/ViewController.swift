//
//  ViewController.swift
//  iPadSplitScreenDemo
//
//  Created by DevDragonLi on 9/10/2020.
//

import UIKit
import iPadSplitScreenKit

class ViewController:iPadSplitViewController {
    
    var fullScreenButton : UIButton?
    
    var smallScreenLabel : UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "点击空白处展示OC版本"
        view.backgroundColor = .darkGray
        currentScreenType()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let vc = OCViewController.init()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    func currentScreenType() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 10.0) {
            if iPadSplitTool.tool.fullScreen {
                print("当前是全屏显示")
            } else {
                print("当前为小屏幕")
            }
        }
    }
    
    
    override func ipadFullScreen() {
        fullScreenButton = UIButton.init(type: .custom)
        fullScreenButton?.backgroundColor = .brown
        fullScreenButton?.setTitle("大屏幕模式", for:.normal)
        fullScreenButton?.frame = CGRect.init(x: 100, y: 100, width: 100, height: 68)
        view.addSubview(fullScreenButton!)
        print("大屏幕模式UI初始化完毕")
    }
    
    override func ipadSmallScreen() {
        smallScreenLabel = UILabel.init()
        smallScreenLabel?.text = "小屏幕模式"
        smallScreenLabel?.textColor = .green
        smallScreenLabel?.frame = CGRect.init(x: 100, y: 100, width: 100, height: 68)
        view.addSubview(smallScreenLabel!)
        print("小屏幕模式UI初始化完毕")
    }
    
    override func ipadSmallToFullScreenConfigurations() {
        fullScreenButton?.isHidden = false
        smallScreenLabel?.isHidden = true
        print("小屏幕模式->大屏幕模式")
    }
    
    override func ipadFullToSmallScreenConfigurations() {
        fullScreenButton?.isHidden = true
        smallScreenLabel?.isHidden = false
        print("大屏幕模式->小屏幕模式")
    }
}

