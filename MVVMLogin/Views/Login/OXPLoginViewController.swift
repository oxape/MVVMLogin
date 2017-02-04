//
//  ViewController.swift
//  MVVMLogin
//
//  Created by oxape on 2017/2/4.
//  Copyright © 2017年 oxape. All rights reserved.
//

import UIKit
import SnapKit

class OXPLoginViewController: OXPBaseViewController {

    let userTipLabel = UILabel()
    let userTextFiled = UITextField()
    let passwordTipLabel = UILabel()
    let passwordTextFiled = UITextField()
    let loginButton = UIButton()
    let activityView = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func createViews() {
        let superView = self.view!
        superView.backgroundColor = UIColor.white;
        
        let containerView = UIView()
        superView.addSubview(containerView)
        containerView.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.center.equalTo(superView)
            ConstraintMaker.left.equalTo(superView).offset(24)
        }
        
        userTipLabel.font = UIFont.systemFont(ofSize: 16)
        userTipLabel.textColor = UIColor.black
        containerView.addSubview(userTipLabel)
        userTipLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(containerView)
            ConstraintMaker.left.equalTo(containerView).offset(8)
        }
        userTipLabel.setContentHuggingPriority(300, for: UILayoutConstraintAxis.horizontal)
        userTipLabel.setContentCompressionResistancePriority(800, for: UILayoutConstraintAxis.horizontal)
        userTextFiled.font = UIFont.systemFont(ofSize: 16)
        userTextFiled.textColor = UIColor.black
        userTextFiled.backgroundColor = UIColor.lightGray
        containerView.addSubview(userTextFiled)
        userTextFiled.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(userTipLabel)
            ConstraintMaker.left.equalTo(userTipLabel.snp.right).offset(8)
            ConstraintMaker.right.equalTo(containerView)
        }
        
        passwordTipLabel.font = UIFont.systemFont(ofSize: 16)
        passwordTipLabel.textColor = UIColor.black
        containerView.addSubview(passwordTipLabel)
        passwordTipLabel.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.greaterThanOrEqualTo(userTipLabel.snp.bottom).offset(8)
            ConstraintMaker.top.greaterThanOrEqualTo(userTextFiled.snp.bottom).offset(8)
            ConstraintMaker.left.equalTo(containerView).offset(8)
            ConstraintMaker.width.equalTo(userTipLabel)
        }
        passwordTipLabel.setContentHuggingPriority(300, for: UILayoutConstraintAxis.horizontal)
        passwordTipLabel.setContentCompressionResistancePriority(800, for: UILayoutConstraintAxis.horizontal)
        passwordTextFiled.font = UIFont.systemFont(ofSize: 16)
        passwordTextFiled.textColor = UIColor.black
        passwordTextFiled.backgroundColor = UIColor.lightGray
        containerView.addSubview(passwordTextFiled)
        passwordTextFiled.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(passwordTipLabel)
            ConstraintMaker.left.equalTo(passwordTipLabel.snp.right).offset(8)
            ConstraintMaker.right.equalTo(containerView)
        }
        
        loginButton.setTitleColor(UIColor.black, for: UIControlState.normal)
        containerView.addSubview(loginButton)
        loginButton.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.greaterThanOrEqualTo(passwordTipLabel.snp.bottom).offset(24)
            ConstraintMaker.top.greaterThanOrEqualTo(passwordTextFiled.snp.bottom).offset(24)
            ConstraintMaker.centerX.equalToSuperview()
        }
        containerView.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.bottom.greaterThanOrEqualTo(loginButton)
        }
        
        containerView.addSubview(activityView)
        activityView.startAnimating()
        activityView.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.centerX.equalTo(loginButton)
            ConstraintMaker.top.equalTo(loginButton.snp.bottom).offset(16)
        }
        
        userTipLabel.text = "用户名"
        passwordTipLabel.text = "密码"
        userTextFiled.placeholder = "请输入用户名"
        passwordTextFiled.placeholder = "请输入密码"
        passwordTextFiled.isSecureTextEntry = true
        loginButton.setTitle("登录", for: UIControlState.normal)
    }

}

