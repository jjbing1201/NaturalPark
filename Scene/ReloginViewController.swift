//
//  ReLoginViewController.swift
//  NaturalPark
//
//  Created by Junjie Zhao. 2014/12/11

import UIKit
import CoreData

class ReLoginViewController: UIViewController {
    
    // 全局保存内容
    var storeContext: NSManagedObjectContext!
    var localuserstore: [LOCALUSER]!
    
    // 外部实例
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var passWord: UITextField!
    @IBOutlet weak var enSureButton: UIButton!
    @IBOutlet weak var forgetButton: UIButton!
    
    //MARK: - 实例动作
    @IBAction func enSure(sender: UIButton) -> Void {
        var alert: UIAlertController
        // 第一部分： 确认是否存在用户输入
        if userName.text == "" && passWord.text == "" {
            alert = AlertOutSide().AllEmpty()
            self.presentViewController(alert, animated: true, completion: nil)
            return
        } else {
            // 客户端本地检查用户输入
            var check_username = LoginDependRule().RuleCheckUsername(userName.text)
            var check_password = LoginDependRule().RuleCheckPassword(passWord.text)
            if !check_username {
                alert = AlertOutSide().EachEmpty(1)
                self.presentViewController(alert, animated: true, completion: nil)
                userName.text = ""
                return
            }
            if !check_password {
                alert = AlertOutSide().EachEmpty(0)
                self.presentViewController(alert, animated: true, completion: nil)
                passWord.text = ""
                return
            }
        }
        
        // 第二部分：直接进行网络连接请求 用户登录
        var InternetConnect:Bool?
        InternetConnect = true
        if (InternetConnect == true) {
            // 用户名密码替换或者保存
            var localuser_op = LOCALUSER_OPERATOR()
            var (select_sure:Bool, name:String, pass:String) = localuser_op.selectLocalUser(storeContext)
            if (select_sure == true) {
                var update_sure:Bool = localuser_op.updateLocalUser(storeContext, name: userName.text, pass: passWord.text)
                if (update_sure == false) {
                    alert = AlertOutSide().RequestUpdateFailed()
                    self.presentViewController(alert, animated: true, completion: nil)
                }
            } else {
                var insert_sure:Bool = localuser_op.insertLocalUser(storeContext, name: userName.text, pass: passWord.text)
                if (insert_sure == false) {
                    alert = AlertOutSide().RequestInsertFailed()
                    self.presentViewController(alert, animated: true, completion: nil)
                }
            }
        } else {
            // 告知用户网路请求失败
            alert = AlertOutSide().RequestLoginFailed()
            self.presentViewController(alert, animated: true, completion: nil)
        }
        
        return
    }
    
    // MARK: - LoginViewController全局内容
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 默认填写内容, 但是如果点击了忘记密码以后，会删除所有用户名和密码的内容
        DefaultInputUsernameAndPasswordIfNeed()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - 默认填写内容
    func DefaultInputUsernameAndPasswordIfNeed() {
        
        var localuser_op = LOCALUSER_OPERATOR()
        var (select_sure, name, pass) = localuser_op.selectLocalUser(storeContext) as (Bool, String, String)
        if (select_sure == true) {
            userName.text = name
            passWord.text = pass
        }
    }
    
}
