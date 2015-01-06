//
//  AdvertismentController.swift
//  NaturalPark
//
//  Created by Computer on 14/12/23.
//  Copyright (c) 2014 Computer. All rights reserved.
//

import UIKit

class AdvertismentController: UIViewController {
    
    var fturl:NSURL?
    @IBOutlet weak var getAdvertisment: UIWebView!
    @IBOutlet weak var A_Chry: UIActivityIndicatorView!
    
    // MARK: - AdvertismentController全局内容
    override func viewDidLoad() {
        super.viewDidLoad()
        var ChryProperty = ActivityOutside()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 设置导航栏标题
        self.title="Blog";
        let replyItem=UIBarButtonItem(title:"返回", style:.Plain, target:self, action:"replyFrom");
        //  添加到到导航栏上
        self.navigationItem.leftBarButtonItem = replyItem;
        
        // 下一级展示页面
        setWebView()
        
        ChryProperty.setChryCenter(A_Chry, DirectView: self)
        ChryProperty.startChry(A_Chry)
        
        fturl = NSURL(string: Global().ADVERTISMENT_URL)
        getAdvertisment?.loadRequest(NSURLRequest(URL: fturl!))
        
        ChryProperty.stopChry(A_Chry)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setWebView() -> Void {
        getAdvertisment.scrollView.scrollsToTop = true
        getAdvertisment.scrollView.bounces = false
    }
    
    func replyFrom() {
        // 转场
        self.navigationController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
}
