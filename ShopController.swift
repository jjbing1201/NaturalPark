//
//  ShopController.swift
//  NaturalPark
//
//  Created by Computer on 14/12/23.
//  Copyright (c) 2014 Computer. All rights reserved.
//

import UIKit

class ShopController: UIViewController {
    
    @IBOutlet weak var Chry: UIActivityIndicatorView!
    @IBOutlet weak var Shopwv: UIWebView!
    
    // MARK: - ShopController全局内容
    override func viewDidLoad() {
        super.viewDidLoad()
        var ChryProperty = ActivityOutside()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 设置导航栏标题
        self.title="NaturalPark";
        let replyItem=UIBarButtonItem(title:"返回", style:.Plain, target:self, action:"replyFrom");
        //  添加到到导航栏上
        self.navigationItem.leftBarButtonItem = replyItem;
        
        // 下一级展示页面
        setWebView()
        ChryProperty.setChryCenter(Chry, DirectView: self)
        ChryProperty.startChry(Chry)
        
        let fturl = NSURL(string: Global().SHOP_URL)
        Shopwv?.loadRequest(NSURLRequest(URL: fturl!))
        
        ChryProperty.stopChry(Chry)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setWebView() -> Void {
        Shopwv.scrollView.scrollsToTop = true
        Shopwv.scrollView.bounces = false
    }
    
    func replyFrom() {
        // 转场
        self.navigationController?.dismissViewControllerAnimated(true, completion: nil)
    }
}