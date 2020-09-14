//
//  LoginViewModel.swift
//  FreeChat
//
//  Created by Ngo Dang tan on 9/13/20.
//  Copyright © 2020 Ngo Dang Tan. All rights reserved.
//

import Foundation

protocol AuthenticationProtocol {
    var formIsValid: Bool {get}
}

struct LoginViewModel {
    var email:String?
    var password:String?
    
    var formIsValid: Bool {
        return email?.isEmpty == false && password?.isEmpty == false
    }
}
