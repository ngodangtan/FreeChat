//
//  File.swift
//  FreeChat
//
//  Created by Ngo Dang tan on 9/18/20.
//  Copyright © 2020 Ngo Dang Tan. All rights reserved.
//

import UIKit
class MessageCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    var message: Message? {
        didSet { configure() }
    }
    
    private let profileImageView: UIImageView = {
       let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.backgroundColor = .lightGray
        return iv
    }()
    
    private let textView:UITextView = {
       let tv = UITextView()
        tv.backgroundColor = .clear
        tv.font = .systemFont(ofSize: 16)
        tv.isScrollEnabled = false
        tv.isEditable = false
        tv.textColor = .white
 
        return tv
    }()
    
    private let bubbleContainer:UIView = {
       let view = UIView()
        view.backgroundColor = .systemPurple
        return view
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
      
        
        addSubview(profileImageView)
        profileImageView.anchor(left: leftAnchor,bottom: bottomAnchor,paddingLeft: 8, paddingBottom: -4)
        profileImageView.setDimensions(height: 32, width: 32)
        profileImageView.layer.cornerRadius = 32/2
        
        addSubview(bubbleContainer)
        bubbleContainer.layer.cornerRadius = 12
        bubbleContainer.anchor(top: topAnchor,left: profileImageView.rightAnchor,paddingLeft: 12)
        bubbleContainer.widthAnchor.constraint(lessThanOrEqualToConstant: 250).isActive = true
        
        bubbleContainer.addSubview(textView)
        textView.anchor(top: bubbleContainer.topAnchor,left: bubbleContainer.leftAnchor,bottom:  bubbleContainer.bottomAnchor,right: bubbleContainer.rightAnchor,paddingTop: 4,paddingLeft: 12,paddingBottom: 4,paddingRight: 12)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Helpers
    
    func configure(){
        guard let message = message else {return}
        let viewModel = MessageViewModel(message: message)
        
        bubbleContainer.backgroundColor = viewModel.messageBackgroundColor
        textView.textColor = viewModel.messageTextColor
        textView.text = message.text
    }
}
