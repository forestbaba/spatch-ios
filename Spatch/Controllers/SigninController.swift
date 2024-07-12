//
//  SigninController.swift
//  Spatch
//
//  Created by Adeoy3 on 15/06/2024.
//

import UIKit

class SigninController: UIViewController {
    
    @IBOutlet weak var phoneView: UIView!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var emailOrPhonenumberTextField: AuthInputFields!
    
    @IBOutlet weak var passwordTextField: AuthInputFields!
    
    @IBOutlet weak var forgotPasswordLabel: UILabel!
    
    @IBOutlet weak var signInButton: GetStartedButton!
    
    let brandColor = UIColor(named: "brandColor")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        renderPhoneView()
        
        
        phoneView.addTapGestureRecognizer { [weak self] in
            self?.renderPhoneView()
        }
        
        emailView.addTapGestureRecognizer { [weak self] in
            self?.renderEmailView()
        }
        
        passwordTextField.type = .secure
        passwordTextField.iconName = "key"
        passwordTextField.iconColor = .gray
        
        forgotPasswordLabel.addTapGestureRecognizer {
            print("Tap tap")
        }
        
        signInButton.isSystemImage.1 = "arrow.forward"
        signInButton.isSystemImage.0 = false
        
        signInButton.customLabel = "Sign in"
        signInButton.didTap = {
            print("Let's go in")
        }
    }
    
    func updateTabView(
        label: UILabel, backgroundColor: UIColor,
        labelColor: UIColor,
        baseView: UIView,
        labelText: String
    ) {
        label.textColor = labelColor
        label.text = labelText
        baseView.backgroundColor = backgroundColor
        baseView.layer.cornerRadius = 20
        baseView.clipsToBounds = true
        
        
    }
    
    func renderPhoneView(){
        updateTabView(
            label: phoneLabel,
            backgroundColor: brandColor!,
            labelColor: .white, baseView: phoneView,
            labelText: "Phone")
        
        updateTabView(
            label: emailLabel,
            backgroundColor: .white,
            labelColor: .black,
            baseView: emailView,
            labelText: "Email"
        )
        
        updateInputFieldparameters(textField: emailOrPhonenumberTextField, placeHolder: "Phone", iconName: "phone" , color: .gray)
        
    }
    
    func renderEmailView(){
        updateTabView(
            label: emailLabel,
            backgroundColor: brandColor!,
            labelColor: .white,
            baseView: emailView,
            labelText: "Email")
        
        updateTabView(
            label: phoneLabel,
            backgroundColor: .white,
            labelColor: .black,
            baseView: phoneView,
            labelText: "Phone"
        )
        
        updateInputFieldparameters(textField: emailOrPhonenumberTextField, placeHolder: "Email", iconName: "envelope" , color: .gray)
    }
    
    func updateInputFieldparameters(textField: AuthInputFields, placeHolder: String, iconName: String, color: UIColor){
        textField.customPlaceHolder = placeHolder
        textField.iconName = iconName
        textField.iconColor = color
    }
}
