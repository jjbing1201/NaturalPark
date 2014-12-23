//
//  MainViewController.swift
//  NaturalPark
//
//  Created by Computer on 14/12/17.
//  Copyright (c) 2014 Computer. All rights reserved.
//

import UIKit

class MainViewController : UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var UserMainTableView: UITableView!
    
    // MARK: - MainViewController 全局内容
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - 用户tableview override部分内容
    
    /* 固定1部分内容 */
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    /* 固定1部分中含有5行内容 */
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        var label = UILabel()
        label.text = ""
        return label
    }
    
    /* 固定5部分内容的样式，遵循模拟样式 */
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "UserMainCell")
        return cell
    }
    

}