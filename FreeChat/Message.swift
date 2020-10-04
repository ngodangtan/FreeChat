//
//  Message.swift
//  FreeChat
//
//  Created by Ngo Dang tan on 9/21/20.
//  Copyright © 2020 Ngo Dang Tan. All rights reserved.
//

import Firebase
import FirebaseAuth
import FirebaseStorage
struct Message {
    let text: String
    let toId: String
    let fromId: String
    var timestamp:Timestamp
    var user:User?
    
    let isFromCurrentUser: Bool
    
    var chatPartnerId: String {
        return isFromCurrentUser ? toId : fromId
    }
    
    init(dictionary: [String: Any]) {
        self.text = dictionary["text"] as? String ?? ""
        self.toId = dictionary["toId"] as? String ?? ""
        self.fromId = dictionary["fromId"] as? String ?? ""
        self.timestamp = dictionary["timestamp"] as? Timestamp ?? Timestamp(date: Date())
        self.isFromCurrentUser = fromId == Auth.auth().currentUser?.uid
        
    }
}
struct Conversation {
    let user:User
    let message: Message
}
