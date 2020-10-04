//
//  ConversationViewModel.swift
//  FreeChat
//
//  Created by Ngo Dang tan on 9/22/20.
//  Copyright © 2020 Ngo Dang Tan. All rights reserved.
//

import Foundation
struct ConversationViewModel {
    private let conversation: Conversation
    var profileImageUrl: URL? {
        return URL(string: conversation.user.profileImageUrl)
    }
    var timestamp: String{
        let date = conversation.message.timestamp.dateValue()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm a"
        return dateFormatter.string(from: date)
    }
    
    init(conversation: Conversation) {
        self.conversation = conversation
    }
}
