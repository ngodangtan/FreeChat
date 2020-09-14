//
//  RegistrationViewModel.swift
//  FreeChat
//
//  Created by Ngo Dang tan on 9/14/20.
//  Copyright © 2020 Ngo Dang Tan. All rights reserved.
//

import Foundation
struct RegistrationViewModel:AuthenticationProtocol {
    var email:String?
    var password:String?
    var fullname:String?
    var username:String?
    
    var formIsValid: Bool {
        return email?.isEmpty == false && password?.isEmpty == false
            && fullname?.isEmpty == false && username?.isEmpty == false
    }
}
