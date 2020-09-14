//
//  RegistrationController.swift
//  FreeChat
//
//  Created by Ngo Dang tan on 9/3/20.
//  Copyright © 2020 Ngo Dang Tan. All rights reserved.
//

import UIKit
class RegistrationController: UIViewController {
    
    // MARK: - Properties
    private var viewModel = RegistrationViewModel()
    
    private let plusPhotoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "plus_photo"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(handleSelectPhoto), for: .touchUpInside)
        button.imageView?.clipsToBounds = true
        button.clipsToBounds = true
        return button
    }()
    private lazy var emailContainerView: UIView = {
        
        return InputContainerView(image: #imageLiteral(resourceName: "ic_mail_outline_white_2x"), textField: emailTextFeild)
    }()
    
    private lazy var fullnameContainerView: UIView = {
        
        return InputContainerView(image: #imageLiteral(resourceName: "ic_person_outline_white_2x"), textField: fullnameTextFeild)
    }()
    
    private lazy var usernameContainerView: UIView = {
        
        return InputContainerView(image: #imageLiteral(resourceName: "ic_person_outline_white_2x"), textField: usernameTextFeild)
    }()
    
    private lazy var passwordContainerView: InputContainerView = {
        return InputContainerView(image: #imageLiteral(resourceName: "ic_lock_outline_white_2x"), textField: passwordTextFeild)
        
    }()
    
    private let emailTextFeild = CustomTextField(placeholder: "Email")
    private let fullnameTextFeild = CustomTextField(placeholder: "Full Name")
    private let usernameTextFeild = CustomTextField(placeholder: "Username")
    
    private let passwordTextFeild: CustomTextField = {
        let tf = CustomTextField(placeholder: "Password")
        tf.isSecureTextEntry = true
        return tf
    }()
    private let signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign Up", for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        button.setTitleColor(.white, for: .normal)
        button.setHeight(height: 50)
        button.isEnabled = false
        return button
    }()
    
    private let alreadyHaveAccountButton: UIButton = {
         let button = UIButton(type: .system)
         let attributedTitle = NSMutableAttributedString(string: "Already have an account? ", attributes: [.font: UIFont.systemFont(ofSize: 16),.foregroundColor: UIColor.white])
         
         attributedTitle.append(NSAttributedString(string: "Log In", attributes: [.font: UIFont.boldSystemFont(ofSize: 16),.foregroundColor:UIColor.white]))
         button.setAttributedTitle(attributedTitle, for: .normal)
         button.addTarget(self, action: #selector(handleShowLogin), for: .touchUpInside)
         return button
     }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureNotificationObservers()
    }
    
    // MARK: - Selectors
    @objc func textDidChange(sender: UITextField){
        if sender == emailTextFeild{
            viewModel.email = sender.text
        }else if sender == passwordTextFeild{
            viewModel.password = sender.text
        }else if sender == fullnameTextFeild{
            viewModel.fullname = sender.text
        }else if sender == usernameTextFeild{
            viewModel.username = sender.text
        }
        checkFormStatus()
    }
    @objc func handleSelectPhoto(){
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
    @objc func handleShowLogin(){
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Helpers
  
    func configureUI(){
        configureGradientLayer()
        
        view.addSubview(plusPhotoButton)
        plusPhotoButton.centerX(inView: view)
        plusPhotoButton.anchor(top: view.safeAreaLayoutGuide.topAnchor,paddingTop: 32)
        plusPhotoButton.setDimensions(height: 200, width: 200)
        
        let stack = UIStackView(arrangedSubviews: [emailContainerView,passwordContainerView,fullnameContainerView,usernameContainerView,signUpButton])
        stack.axis = .vertical
        stack.spacing = 16
        
        view.addSubview(stack)
        stack.anchor(top:plusPhotoButton.bottomAnchor,left: view.leftAnchor,right: view.rightAnchor,paddingTop: 32,paddingLeft: 32,paddingRight: 32)
        
        view.addSubview(alreadyHaveAccountButton)
        alreadyHaveAccountButton.anchor(left:view.leftAnchor,bottom: view.safeAreaLayoutGuide.bottomAnchor,right: view.rightAnchor,paddingLeft: 32,paddingRight: 32)
    }
    func configureNotificationObservers(){
        emailTextFeild.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        passwordTextFeild.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        fullnameTextFeild.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        usernameTextFeild.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    }

}
    //MARK: - UIImagePickerControllerDelegate
extension RegistrationController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let image = info[.originalImage] as? UIImage
        plusPhotoButton.setImage(image?.withRenderingMode(.alwaysOriginal), for: .normal)
        plusPhotoButton.layer.borderColor = UIColor.white.cgColor
        plusPhotoButton.layer.borderWidth = 3.0
        plusPhotoButton.layer.cornerRadius = 200/2
  
        
        dismiss(animated: true, completion: nil)
        
    }
}
extension RegistrationController:AuthenticationControllerProtocol{
    func checkFormStatus(){
        if viewModel.formIsValid{
            signUpButton.isEnabled = true
            signUpButton.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        }else{
            signUpButton.isEnabled = false
            signUpButton.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        }
    }
}
