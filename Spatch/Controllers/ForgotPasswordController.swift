//
//  LoginViewController.swift
//  Spatch
//
//  Created by Adeoy3 on 14/06/2024.
//

import UIKit

class ForgotPasswordController: UIViewController {
    
    
    @IBOutlet weak var phoneView: UIView!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var sendCodeButton: GetStartedButton!
    
    let brandColor = UIColor(named: "brandColor")
    
    
    //@IBOutlet weak var emailOrPhonenumberTextField: AuthInputFields!
    @IBOutlet weak var emailOrPhonenumberTextField: AuthInputFields!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        renderPhoneView()
        
        
        
        phoneView.addTapGestureRecognizer { [weak self] in
            self?.renderPhoneView()
        }
        
        emailView.addTapGestureRecognizer { [weak self] in
            self?.renderEmailView()
        }
        
        
        sendCodeButton.isSystemImage.1 = "arrow.forward"
        sendCodeButton.isSystemImage.0 = false
        
        sendCodeButton.customLabel = "Send Code"
        sendCodeButton.didTap = {
            print("Send code")
        }
    }
    
    
    func renderPhoneView(){
        print("Start rendering")
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
    
    
    func updateInputFieldparameters(textField: AuthInputFields, placeHolder: String, iconName: String, color: UIColor){
        textField.customPlaceHolder = placeHolder
        textField.iconName = iconName
        textField.iconColor = color
    }
    
}
