//
//  ViewController.swift
//  NaturalPark
//
//  Created by Junjie Zhao. 2014/12/11

import UIKit
import CoreData

class LoginViewController: UIViewController {
    
    // 全局保存内容
    var storeContext: NSManagedObjectContext!
    var localuserstore: [LOCALUSER]!

    // 外部实例
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var passWord: UITextField!
    @IBOutlet weak var enSureButton: UIButton!
    @IBOutlet weak var forgetButton: UIButton!
    
    @IBAction func hideKeyboardForUserName(sender: UITextField) {
        userName.resignFirstResponder()
    }
    
    @IBAction func hideKeyboardForPassWord(sender: AnyObject) {
        passWord.resignFirstResponder()
    }
    
    //MARK: - 实例动作
    @IBAction func enSure(sender: UIButton) -> Void {
        
        var alert: UIAlertView
        
        // 第一部分： 确认是否存在用户输入
        if userName.text == "" && passWord.text == "" {
            alert = AlertOutSide().AllEmpty()
            alert.show()
            return
        } else {
            // 客户端本地检查用户输入
            var check_username = LoginDependRule().RuleCheckUsername(userName.text)
            var check_password = LoginDependRule().RuleCheckPassword(passWord.text)
            if !check_username {
                alert = AlertOutSide().EachEmpty(1)
                alert.show()
                userName.text = ""
                return
            }
            if !check_password {
                alert = AlertOutSide().EachEmpty(0)
                alert.show()
                passWord.text = ""
                return
            }
        }
        
        // 第二部分：直接进行网络连接请求 用户登录
        // 上传解析
        var _logindata:NSDictionary = ["user_name": userName.text, "user_pass":passWord.text]
        let logindata:NSString = JsonEasyControl().JsonToStringZero(_logindata)
        let tranform_data = TranformData()
        let alldata = tranform_data.getThreePart(1390013900, dataPass: logindata, interfacePass: Global().INTERFACE_TODOUSER) as String
        let auth = tranform_data.getThreeAuth(alldata)
        let newdata = tranform_data.getNewThreePart(1390013900, dataPass: logindata, AuthPass: auth)
        
        let loginurl = "http://\(Global().SERVER_IP):\(Global().SERVER_PORT)/\(Global().INTERFACE_TODOUSER)"
        let rlogindata = tranform_data.giveSecurity(newdata)
        
        // 返回解析
        let returnstring = EasyRequestPost(loginurl, rlogindata)
        let get_return = JsonEasyControl().StringToJson(returnstring)
        let return_code = get_return["code"] as Int
        if (return_code == 0) {
            // 用户名密码替换或者保存
            var localuser_op = LOCALUSER_OPERATOR()
            var (select_sure:Bool, name:String, pass:String) = localuser_op.selectLocalUser(storeContext)
            if (select_sure == true) {
                var update_sure:Bool = localuser_op.updateLocalUser(storeContext, name: userName.text, pass: passWord.text, nickname: "None")
                if (update_sure == false) {
                    alert = AlertOutSide().RequestUpdateFailed()
                    alert.show()
                }
            } else {
                var insert_sure:Bool = localuser_op.insertLocalUser(storeContext, name: userName.text, pass: passWord.text, nickname: "None")
                if (insert_sure == false) {
                    alert = AlertOutSide().RequestInsertFailed()
                    alert.show()
                }
            }
        } else {
            alert = AlertOutSide().RequestLoginFailed()
            alert.show()
            return
        }
        
        // transport
        self.performSegueWithIdentifier("tranformToMain", sender: sender)
        
        return
    }
    
    @IBAction func forget(sender: UIButton) {
        // 通过 modal segue 来直接进行转场
        userName.text = ""
        passWord.text = ""
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
    
    //MARK: - 转场
    @IBAction func backfromForget(segue: UIStoryboard) {
        
    }
}
