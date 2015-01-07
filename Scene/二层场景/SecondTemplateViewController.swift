//
//  SecondTemplateViewController.swift
//  NaturalPark
//
//  Created by Computer on 15/1/7.
//  Copyright (c) 2015 Computer. All rights reserved.
//
import UIKit
import Foundation
import QuartzCore

class SecondTemplateViewController : UIViewController {
    
    @IBOutlet weak var TextViewField: UITextView!
    @IBOutlet weak var leftbarbutton: UIBarButtonItem!
    @IBOutlet weak var upload: UIButton!
    
    @IBAction func UploadReturn(sender: UIButton) {
        let alert = AlertOutSide().RequestUploadPage()
        alert.show()
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func LeftButtonReturn(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        TextViewField.layer.borderColor = UIColor.grayColor().CGColor
//        TextViewField.layer.borderWidth = 1
//        TextViewField.layer.cornerRadius = CGFloat(10.0)
        TextViewField.scrollEnabled = false
        TextViewField.textContainerInset = UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 0)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}