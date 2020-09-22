//
//  Message.swift
//  FreeChat
//
//  Created by Ngo Dang tan on 9/21/20.
//  Copyright © 2020 Ngo Dang Tan. All rights reserved.
//

import Firebase
import FirebaseAuth
struct Message {
    let text: String
    let toId: String
    let fromId: String
    var timestamp:Date!
    var user:User?
    
    let isFromCurrentUser: Bool
    
    init(dictionary: [String: AnyObject]) {
        self.text = dictionary["text"] as? String ?? ""
        self.toId = dictionary["toId"] as? String ?? ""
        self.fromId = dictionary["fromId"] as? String ?? ""
        if let timestamp = dictionary["timestamp"] as? Double{
            self.timestamp = Date(timeIntervalSince1970: timestamp)
        }
        self.isFromCurrentUser = fromId == Auth.auth().currentUser?.uid
        
    }
}
