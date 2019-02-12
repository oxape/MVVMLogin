//
//  OXPAuthService.swift
//  MVVMLogin
//
//  Created by oxape on 2017/2/4.
//  Copyright © 2017年 oxape. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

class OXPAuthService:AuthProtocol {
    static var sharedManager = OXPAuthService()
    
    fileprivate init() {}
    
    func login(username: String, password: String)->Observable<AutenticationStatus> {
        return Observable<AutenticationStatus>.create{
            observer in
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+DispatchTimeInterval.seconds(2)){
                if username == "root" && password == "123456" {
                    observer.onNext(.success(username))
                    observer.onCompleted()
                } else {
                    observer.onNext(.error(.badReponse("用户名或密码错误")))
                    observer.onCompleted()
                }
            }
            return Disposables.create();
        }
    }
}
