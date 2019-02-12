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

enum AutenticationError: Error {
    case server
    case badReponse(String)
    case badCredentials
}

enum AutenticationStatus {
    case none
    case error(AutenticationError)
    case success(String)
}

protocol AuthProtocol {
    func login(username:String, password:String) ->Observable<AutenticationStatus>
}
