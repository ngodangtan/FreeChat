//
//  LoginController.swift
//  FreeChat
//
//  Created by Ngo Dang tan on 9/3/20.
//  Copyright © 2020 Ngo Dang Tan. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
protocol AuthenticationControllerProtocol  {
    func checkFormStatus()
}
class LoginController: UIViewController {
    
    // MARK: - Properties
    private var viewModel = LoginViewModel()
    
    private let iconImage: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(systemName: "bubble.right")
        iv.tintColor = .white
        return iv
    }()
    private lazy var emailContainerView: UIView = {
       
       return InputContainerView(image: #imageLiteral(resourceName: "ic_mail_outline_white_2x"), textField: emailTextFeild)
    }()
    private lazy var passwordContainerView: InputContainerView = {
        return InputContainerView(image: #imageLiteral(resourceName: "ic_lock_outline_white_2x"), textField: passwordTextFeild)

    }()
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log In", for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        button.setTitleColor(.white, for: .normal)
        button.setHeight(height: 50)
        button.isEnabled = false
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        return button
    }()
    
    private let emailTextFeild = CustomTextField(placeholder: "Email")
    
    private let passwordTextFeild: CustomTextField = {
        let tf = CustomTextField(placeholder: "Password")
        tf.isSecureTextEntry = true
        return tf
    }()
    
    private let dontHaveAccountButton: UIButton = {
        let button = UIButton(type: .system)
        let attributedTitle = NSMutableAttributedString(string: "Don't have an account? ", attributes: [.font: UIFont.systemFont(ofSize: 16),.foregroundColor: UIColor.white])
        
        attributedTitle.append(NSAttributedString(string: "Sign Up", attributes: [.font: UIFont.boldSystemFont(ofSize: 16),.foregroundColor:UIColor.white]))
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.addTarget(self, action: #selector(handleShowSignUp), for: .touchUpInside)
        return button
    }()
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Selectors
    @objc func handleLogin(){
        guard let email = emailTextFeild.text else {return}
        guard let password = passwordTextFeild.text else {return}
        
        AuthService.shared.logUserIn(withEmail: email, password: password) { result, error in
            if let error = error{
                print("DEBUG: Failed to login with error \(error.localizedDescription)")
                return
            }
            
            self.dismiss(animated: true, completion: nil)
            
        }
        

        
    }
    
    @objc func handleShowSignUp(){
        let controller = RegistrationController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc func textDidChange(sender: UITextField){
        if sender == emailTextFeild {
            viewModel.email = sender.text
        }else {
            viewModel.password = sender.text
        }
        
        checkFormStatus()
    }
    
    // MARK: - Helpers
  
    
    func configureUI(){
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
        configureGradientLayer()
        
        view.addSubview(iconImage)
        iconImage.centerX(inView: view)
        iconImage.anchor(top: view.safeAreaLayoutGuide.topAnchor,paddingTop: 32)
        iconImage.setDimensions(height: 120, width: 120)
        
        let stack = UIStackView(arrangedSubviews: [emailContainerView,passwordContainerView,loginButton])
        stack.axis = .vertical
        stack.spacing = 16
        
        view.addSubview(stack)
        stack.anchor(top:iconImage.bottomAnchor,left: view.leftAnchor,right: view.rightAnchor,paddingTop: 32,paddingLeft: 32,paddingRight: 32)
        
        view.addSubview(dontHaveAccountButton)
        dontHaveAccountButton.anchor(left:view.leftAnchor,bottom: view.safeAreaLayoutGuide.bottomAnchor,right: view.rightAnchor,paddingLeft: 32,paddingRight: 32)
        
        emailTextFeild.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        passwordTextFeild.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    }
    
 
    
    
    
}
extension LoginController:AuthenticationControllerProtocol{
    func checkFormStatus(){
        if viewModel.formIsValid{
            loginButton.isEnabled = true
            loginButton.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        }else{
            loginButton.isEnabled = false
            loginButton.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        }
    }
}
