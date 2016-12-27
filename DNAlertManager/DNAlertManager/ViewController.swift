//
//  ViewController.swift
//  DNAlertManager
//
//  Created by mainone on 16/12/27.
//  Copyright © 2016年 wjn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func AlertClick(_ sender: UIButton) {
        DNAlertManager().showAlert(self, title: "提示", message: "我只是一个提示框", button: "知道了")
    }
    
    @IBAction func AlertAndHandlerClick(_ sender: UIButton) {
        let params = Parameters(title: "提示",
                                message: "我貌似有个回调",
                                cancelButton: "取消",
                                destructiveButtons: ["第一个", "第二个"],
                                otherButtons: ["确定"],
                                arrowDirection: .up,
                                popoverStyle: .barButton)
        
        DNAlertManager().showAlertWithHandler(self, parameters: params) { (index) in
            print("index: \(index)")
        }
        
    }
    
    @IBAction func AlertAndTextFieldClick(_ sender: UIButton) {
        let params = Parameters(
            title: "提示",
            message: "输入用户名密码",
            cancelButton: "取消",
            otherButtons: ["确定"],
            inputFields: [InputField(placeholder: "username", secure: false),
                          InputField(placeholder: "password", secure: true)]
        )
        
        let alert = DNAlertManager()
        alert.showAlertWithHandler(self, parameters: params) { (index) in
            guard index == 1 else {
                return
            }
            
            guard let textFields = alert.textFields else {
                return
            }
            // username
            let name: UITextField = textFields[0] as! UITextField
            if name.hasText {
                print(name.text!)
            }
            // password
            let pass: UITextField = textFields[1] as! UITextField
            if pass.hasText {
                print(pass.text!)
            }
        }
    }
    
    @IBAction func ActionSheetClick(_ sender: UIButton) {
        let params = Parameters(
            title: "提示",
            message: "你可以点击下面的按钮试试",
            cancelButton: "取消",
            destructiveButtons: ["我是一"],
            otherButtons: ["二", "三"],
            sender: sender,
            arrowDirection: .up
        )
        
        DNAlertManager().showActionSheet(self, parameters: params) { buttonIndex in
            switch buttonIndex {
            case 0:
                print("取消: \(buttonIndex)")
            default:
                print("Action: \(buttonIndex)")
            }
        }
    }
    
    @IBAction func MenuClick(_ sender: UIButton) {
        let params = Parameters(
            cancelButton: "取消",
            otherButtons: ["Menu1", "Menu2", "Menu3", "Menu4", "Menu5"],
            disabledButtons: ["Menu1", "Menu4"],
            sender: sender,
            arrowDirection: .down,
            popoverStyle: .barButton
        )
        
        DNAlertManager().showActionSheet(self, parameters: params) { buttonIndex in
            switch buttonIndex {
            case 0:
                print("Cancel: \(buttonIndex)")
            default:
                print("Menu: \(buttonIndex)")
            }
        }
    }

}

