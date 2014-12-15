//
//  NetworkActivity.swift
//  NaturalPark
//
//  Created by Computer on 14/12/12.
//  Copyright (c) 2014 Computer. All rights reserved.
//

import UIKit

class NetworkActive {
    
    func StartActiveIndicator() -> Void {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
    }
    
    func StopActiveIndicator() -> Void {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
    }

}
