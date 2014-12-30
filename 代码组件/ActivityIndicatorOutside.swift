//
//  ActivityIndicatorOutside.swift
//  NaturalPark
//
//  Created by Computer on 14/12/26.
//  Copyright (c) 2014 Computer. All rights reserved.
//

import UIKit
import Foundation

class ActivityOutside {
    
    /* 设置活动控件在屏幕的正当中 */
    func setChryCenter(Chry: UIActivityIndicatorView, DirectView: UIViewController) -> Void {
        Chry.center = DirectView.view.center
    }
    
    /* 控件开始动作，并且让控件显示 */
    func startChry(Chry: UIActivityIndicatorView) -> Void {
        Chry.hidden = false
        Chry.startAnimating()
    }
    
    /* 控件停止动作，并且控件隐藏 */
    func stopChry(Chry: UIActivityIndicatorView) -> Void {
        Chry.stopAnimating()
        Chry.hidden = true
    }
}