//
//  MainViewController.swift
//  NaturalPark
//
//  Created by Computer on 14/12/17.
//  Copyright (c) 2014 Computer. All rights reserved.
//

import UIKit
import CoreData

class MainViewController : UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var userinform = [Dictionary<String, String>]()
    var globalstack = NaturalParkStack()
    var storeContext: NSManagedObjectContext!
    var cellcontrol: UIControl = UIControl()
    
    @IBOutlet weak var UserNickName: UITextField!
    @IBOutlet weak var UserAvatar: UIImageView!
    @IBOutlet weak var UserMainTableView: UITableView!
    
    // MARK: - MainViewController 全局内容
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        LoadAnything()
        
        FlushMainViewControllerContext()
        
        LoadUserNickName()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - 用户tableview override部分内容
    
    /* 固定1部分内容 */
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 8
    }
    /* 固定1部分中含有1行内容 */
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        var label = UILabel()
        label.text = ""
        return label
    }
    
    /* 设置多section之间的间隙大小 */
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 40
    }
    /* 固定5部分内容的样式，遵循模拟样式 */
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // 可用积分 : 萱草
        if (indexPath.section == 0 && indexPath.row == 0) {
            let cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "UserMainCell")
            let eachRow = self.userinform[indexPath.section] as NSDictionary
            
            cell.textLabel?.text = eachRow["title"] as? String
            cell.textLabel?.textColor = UIColor.grayColor()
            cell.textLabel?.font = UIFont(name: "Arial", size: 18.0)
            let _detailtext = eachRow["context"] as? String
            cell.detailTextLabel?.text = "\(_detailtext!)颗"
            cell.detailTextLabel?.textColor = UIColor(red: 51.0/255.0, green: 51.0/255.0, blue: 51.0/255.0, alpha: 1.0)
            cell.detailTextLabel?.font = UIFont(name: "Arial", size: 17.0)
            
            return cell
        }
        // 等级
        else if (indexPath.section == 1 && indexPath.row == 0) {
            let cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "UserMainCell")
            let eachRow = self.userinform[indexPath.section] as NSDictionary
            
            cell.textLabel?.text = eachRow["title"] as? String
            cell.textLabel?.textColor = UIColor.grayColor()
            cell.textLabel?.font = UIFont(name: "Arial", size: 18.0)
            let _detailtext = eachRow["context"] as? String
            cell.detailTextLabel?.text = "\(_detailtext!)级"
            cell.detailTextLabel?.textColor = UIColor(red: 51.0/255.0, green: 51.0/255.0, blue: 51.0/255.0, alpha: 1.0)
            cell.detailTextLabel?.font = UIFont(name: "Arial", size: 17.0)
            return cell
        }
        // 姓名
        else if (indexPath.section == 2 && indexPath.row == 0) {
            let cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "UserMainCell")
            let eachRow = self.userinform[indexPath.section] as NSDictionary
            
            cell.textLabel?.text = eachRow["title"] as? String
            cell.textLabel?.textColor = UIColor.grayColor()
            cell.textLabel?.font = UIFont(name: "Arial", size: 18.0)
            cell.detailTextLabel?.text = eachRow["context"] as? String
            cell.detailTextLabel?.textColor = UIColor(red: 51.0/255.0, green: 51.0/255.0, blue: 51.0/255.0, alpha: 1.0)
            cell.detailTextLabel?.font = UIFont(name: "Arial", size: 17.0)
            cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
            
            return cell
        }
        // 性别
        else if (indexPath.section == 3 && indexPath.row == 0) {
            let cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "UserMainCell")
            let eachRow = self.userinform[indexPath.section] as NSDictionary
            
            cell.textLabel?.text = eachRow["title"] as? String
            cell.textLabel?.textColor = UIColor.grayColor()
            cell.textLabel?.font = UIFont(name: "Arial", size: 18.0)
            cell.detailTextLabel?.text = eachRow["context"] as? String
            cell.detailTextLabel?.textColor = UIColor(red: 51.0/255.0, green: 51.0/255.0, blue: 51.0/255.0, alpha: 1.0)
            cell.detailTextLabel?.font = UIFont(name: "Arial", size: 17.0)
            cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
            return cell
        }
        // 肤质信息
        else if (indexPath.section == 4 && indexPath.row == 0) {
            let cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "UserMainCell")
            let eachRow = self.userinform[indexPath.section] as NSDictionary
            
            cell.textLabel?.text = eachRow["title"] as? String
            cell.textLabel?.textColor = UIColor.grayColor()
            cell.textLabel?.font = UIFont(name: "Arial", size: 18.0)
            cell.detailTextLabel?.text = eachRow["context"] as? String
            cell.detailTextLabel?.textColor = UIColor(red: 51.0/255.0, green: 51.0/255.0, blue: 51.0/255.0, alpha: 1.0)
            cell.detailTextLabel?.font = UIFont(name: "Arial", size: 17.0)
            cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
            return cell
        }
        // 地址
        else if (indexPath.section == 5 && indexPath.row == 0) {
            let cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "UserMainCell")
            let eachRow = self.userinform[indexPath.section] as NSDictionary
            
            cell.textLabel?.text = eachRow["title"] as? String
            cell.textLabel?.textColor = UIColor.grayColor()
            cell.textLabel?.font = UIFont(name: "Arial", size: 18.0)
            cell.detailTextLabel?.text = eachRow["context"] as? String
            cell.detailTextLabel?.textColor = UIColor(red: 51.0/255.0, green: 51.0/255.0, blue: 51.0/255.0, alpha: 1.0)
            cell.detailTextLabel?.font = UIFont(name: "Arial", size: 17.0)
            cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
            return cell
        }
        // 邮编
        else if (indexPath.section == 6 && indexPath.row == 0) {
            let cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "UserMainCell")
            let eachRow = self.userinform[indexPath.section] as NSDictionary
            
            cell.textLabel?.text = eachRow["title"] as? String
            cell.textLabel?.textColor = UIColor.grayColor()
            cell.textLabel?.font = UIFont(name: "Arial", size: 18.0)
            cell.detailTextLabel?.text = eachRow["context"] as? String
            cell.detailTextLabel?.textColor = UIColor(red: 51.0/255.0, green: 51.0/255.0, blue: 51.0/255.0, alpha: 1.0)
            cell.detailTextLabel?.font = UIFont(name: "Arial", size: 17.0)
            cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
            return cell
        }
        // 电话
        else if (indexPath.section == 7 && indexPath.row == 0) {
            let cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "UserMainCell")
            let eachRow = self.userinform[indexPath.section] as NSDictionary
            
            cell.textLabel?.text = eachRow["title"] as? String
            cell.textLabel?.textColor = UIColor.grayColor()
            cell.textLabel?.font = UIFont(name: "Arial", size: 18.0)
            cell.detailTextLabel?.text = eachRow["context"] as? String
            cell.detailTextLabel?.textColor = UIColor(red: 51.0/255.0, green: 51.0/255.0, blue: 51.0/255.0, alpha: 1.0)
            cell.detailTextLabel?.font = UIFont(name: "Arial", size: 17.0)
            cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
            return cell
        }
//        // 消息提醒
//        else if (indexPath.section == 3 && indexPath.row == 0) {
//            let cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "UserMainCell")
//            let eachRow = self.userinform[indexPath.section] as NSDictionary
//            
//            cell.textLabel?.text = eachRow["title"] as? String
//            cell.textLabel?.textColor = UIColor.grayColor()
//            cell.textLabel?.font = UIFont(name: "Arial", size: 20.0)
//            cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
//            return cell
//        }
//        // 购买次数
//        else if (indexPath.section == 4 && indexPath.row == 0) {
//            let cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "UserMainCell")
//            let eachRow = self.userinform[indexPath.section] as NSDictionary
//            
//            cell.textLabel?.text = eachRow["title"] as? String
//            cell.textLabel?.textColor = UIColor.grayColor()
//            cell.textLabel?.font = UIFont(name: "Arial", size: 20.0)
//            cell.detailTextLabel?.text = eachRow["context"] as? String
//            cell.detailTextLabel?.font = UIFont(name: "Arial", size: 30.0)
//            cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
//            return cell
//        }
        return UITableViewCell()
    }
    
    // MARK: - 单一单元格点击事件触发
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        UserMainTableView.deselectRowAtIndexPath(indexPath, animated: true)
        // 获取单行属性
        if (indexPath.section == 0 || indexPath.section == 1) {
            
        } else {
            let sectionRow = self.userinform[indexPath.section] as NSDictionary
            let sectionTitle = sectionRow["title"] as String
            // 实例化对应页面内容
            let otherStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
            let layers:SecondTemplateViewController = otherStoryBoard.instantiateViewControllerWithIdentifier("Second") as SecondTemplateViewController
            let navi:UINavigationController = UINavigationController(rootViewController: layers)
            // 参数传递
            layers.title = sectionTitle
            
            self.presentViewController(navi, animated: true, completion: nil)
        }
    }
    
    /* 集中加载 */
    func LoadAnything() -> Void {
        self.storeContext = globalstack.context
    }
    
    // MARK: - 全局刷新调用队列(同步)
    func FlushMainViewControllerContext() -> Void {
        
        // 1. 查询本地用户名
        var localuser_op = LOCALUSER_OPERATOR()
        let (return_code:Bool, return_nickname: String) = localuser_op.selectLocalUserName(self.storeContext)
        println("return_nickname => \(return_nickname)")
        
        // 2. 根据本地用户名查询对应的内容
        var _logindata:NSDictionary = ["user_nickname": return_nickname]
        let logindata:NSString = JsonEasyControl().JsonToStringZero(_logindata)
        let tranform_data = TranformData()
        let alldata = tranform_data.getThreePart(1390013900, dataPass: logindata, interfacePass: Global().INTERFACE_TODOUSERSEARCH) as String
        let auth = tranform_data.getThreeAuth(alldata)
        let newdata = tranform_data.getNewThreePart(1390013900, dataPass: logindata, AuthPass: auth)
        
        let loginurl = "http://\(Global().SERVER_IP):\(Global().SERVER_PORT)/\(Global().INTERFACE_TODOUSERSEARCH)"
        let rlogindata = tranform_data.giveSecurity(newdata)
        
        // 返回解析
        let returnstring = EasyRequestGet(loginurl, rlogindata)
        let get_return = JsonEasyControl().StringToJson(returnstring)
        let firstlayer_code = get_return["code"] as Int
        var _point:Dictionary<String,String>;
        var _level:Dictionary<String,String>;
        var _skin:Dictionary<String,String>;
        var _nickname:Dictionary<String,String>;
//        var _buytimer:Dictionary<String,String>; // destructor 购买次数
//        var _message:Dictionary<String,String>;  // destructor 消息提醒
        var _sex:Dictionary<String,String>;
        var _address:Dictionary<String,String>;
        var _postcode:Dictionary<String,String>;
        var _telephone:Dictionary<String,String>;
        
        if (firstlayer_code == 0) {
            /* 预留一个错误解析 */
            let firstlayer_dataObject = get_return["dataObject"] as NSDictionary
            let secondlayer: AnyObject! = firstlayer_dataObject["details"] as AnyObject!
            let secondlayer_one = secondlayer[0] as String
            let secondlayer_onejson = JsonEasyControl().StringToJson(secondlayer_one) as NSDictionary
            
            // 获取所有内容 (数据分析获得)
            _point = ["title":"萱草", "context":(secondlayer_onejson["user_point"] as NSString)]
            _level = ["title":"等级", "context":(secondlayer_onejson["user_level"] as NSString)]
            _skin  = ["title":"肤质", "context":(secondlayer_onejson["user_skin"] as NSString)]
            _nickname = ["title":"姓名", "context":return_nickname]
//            _buytimer = ["title":"购买次数", "context":(secondlayer_onejson["user_buytimes"] as NSString)]
//            _message = ["title":"消息提醒", "context":(secondlayer_onejson["user_remember_switch"] as NSString)]
            // 获取所有内容 (手动编写)
            _sex = ["title":"性别", "context": "女"]
            _address = ["title":"地址", "context": "中国 上海 上海市"]
            _postcode = ["title":"邮编", "context": "200000"]
            _telephone = ["title":"电话", "context": "13800000000"]
        } else {
            _point = ["title":"萱草", "context":"未知"]
            _level = ["title":"等级", "context":"未知"]
            _skin = ["title":"肤质", "context":"未知"]
            _nickname = ["title":"姓名", "context":return_nickname]
//            _buytimer = ["title":"购买次数", "context":"未知"]
//            _message = ["title":"消息提醒","context":"0"]
            _sex = ["title":"性别", "context": "未知"]
            _address = ["title":"地址", "context": "未知"]
            _postcode = ["title":"邮编", "context": "未知"]
            _telephone = ["title":"电话", "context": "未知"]
        }
        userinform.append(_point)
        userinform.append(_level)
        userinform.append(_nickname)    // 手动编写
        userinform.append(_sex)         // 手动编写
        userinform.append(_skin)
//        userinform.append(_message)
//        userinform.append(_buytimer)
        userinform.append(_address)     // 手动编写
        userinform.append(_postcode)    // 手动编写
        userinform.append(_telephone)   // 手动编写
    }
    
    func LoadUserNickName() -> Void {
        let usernickname = userinform[2]

        if (usernickname["context"] != "None") {
            self.navigationItem.title = usernickname["context"]
        } else {
            self.navigationItem.title = "请设置用户姓名"
        }
    }

}
