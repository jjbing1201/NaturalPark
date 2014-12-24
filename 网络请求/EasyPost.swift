//
//  EasyPost.swift
//  NaturalPark
//
//  Created by Computer on 14/12/12.
//  Copyright (c) 2014 Computer. All rights reserved.
//

import UIKit

func EasyRequestPost(urlString : String , postString : String) -> String {
    
    // 初始化参数和请求内容
    var error : NSError?
    var response : NSURLResponse?
    var strRet : NSString? = nil
    var request: NSMutableURLRequest? = NSMutableURLRequest()
    
    // 开启网络请求
    NetworkActive().StartActiveIndicator()
    
    //字符串转换NSData
    var postData = postString.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion : true) as NSData?
    
    // 设置URL
    var url = NSURL(string: urlString)

    // 设置HTTP方法
    request!.URL = url!
    request!.HTTPMethod = "POST"
    request!.HTTPBody = postData!;
    //设置参数
    //request!.setValue("text/html", forHTTPHeaderField : "Content-Type")
    
    var returnData = NSURLConnection.sendSynchronousRequest(request!, returningResponse : &response, error: &error) as NSData?
    
    strRet = NSString(data: returnData!, encoding:NSUTF8StringEncoding)
    
    // 关闭网络请求
    NetworkActive().StopActiveIndicator()
    
    return strRet!
}
