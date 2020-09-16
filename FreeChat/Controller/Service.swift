//
//  Service.swift
//  FreeChat
//
//  Created by Ngo Dang tan on 9/16/20.
//  Copyright © 2020 Ngo Dang Tan. All rights reserved.
//

import Foundation
import FirebaseFirestore
struct Service {
    static func fetchUsers(){
        Firestore.firestore().collection("users").getDocuments { snapshot, error in
            snapshot?.documents.forEach({ document in
                print(document.data())
            })
        }
    }
}
