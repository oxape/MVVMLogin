//
//  OXPLoginViewModel.swift
//  MVVMLogin
//
//  Created by oxape on 2017/2/4.
//  Copyright © 2017年 oxape. All rights reserved.
//

import Foundation

import RxCocoa
import RxSwift
import RxSwiftUtilities

protocol LoginViewModelType {
    // 2-Way Binding
    var name: Variable<String?> { get }
    var password: Variable<String?> { get }
    //输入
    var loginButtonDidTap:PublishSubject<Void>{ get }
    //输出
    var loginActionResult: Driver<AutenticationStatus> { get }
    var activityIndicator: ActivityIndicator { get }
}

class OXPLoginViewModel:LoginViewModelType {
    //双向绑定
    var name: Variable<String?>
    var password: Variable<String?>
    //输入
    let loginButtonDidTap = PublishSubject<Void>()
    //输出
    var loginActionResult:Driver<AutenticationStatus>
    var activityIndicator:ActivityIndicator
    init(authService:AuthProtocol) {
        let nameV = Variable<String?>("")
        let passwordV = Variable<String?>("")
        let ac = ActivityIndicator()
        name = nameV
        password = passwordV
        activityIndicator = ac
        
        let usernameAndPassword = Observable.combineLatest(name.asObservable(), password.asObservable()) {
            ($0, $1)
        }
        loginActionResult = loginButtonDidTap.asObservable()
            .withLatestFrom(usernameAndPassword)
            .flatMapLatest { (username, password) in
                return authService.login(username: username!, password: password!).trackActivity(ac)
            }.asDriver(onErrorJustReturn:.error(.server))
        /*
         开始用的下面一种写法,没有上面的写法优雅
         */
        //        let observable = loginButtonDidTap.flatMapLatest {
        //            return AuthManager.sharedManager.login(name: (nameV.value)!, password: (passwordV.value)!).trackActivity(ac)
        //        }
        //        loginActionResult = observable.asDriver(onErrorJustReturn:.error(.server))
    }
}
