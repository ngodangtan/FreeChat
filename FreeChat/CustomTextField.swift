//
//  CustomTextField.swift
//  FreeChat
//
//  Created by Ngo Dang tan on 9/13/20.
//  Copyright © 2020 Ngo Dang Tan. All rights reserved.
//

import UIKit
class CustomTextField: UITextField {
    init(placeholder: String){
        super.init(frame: .zero)
        
        borderStyle = .none
        font = UIFont.systemFont(ofSize: 16)
        textColor = .white
        keyboardAppearance = .dark
        attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [.foregroundColor: UIColor.white])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
