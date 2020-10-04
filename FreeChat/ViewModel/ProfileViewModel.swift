//
//  ProfileViewModel.swift
//  FreeChat
//
//  Created by Ngo Dang tan on 9/23/20.
//  Copyright © 2020 Ngo Dang Tan. All rights reserved.
//

import Foundation

enum ProfileViewModel: Int, CaseIterable {
    case accountInfo
    case settings

    
    var description:String {
        switch self{
        case .accountInfo: return "Account Info"
        case .settings: return "Settings"
   
        }
    }
    
    var iconImageName: String {
        switch self{
        case .accountInfo: return "person.circle"
        case .settings: return "gear"
     
        }
    }
}
