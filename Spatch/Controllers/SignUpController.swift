//
//  SignUpController.swift
//  Spatch
//
//  Created by Adeoy3 on 19/06/2024.
//

import UIKit

class SignUpController: UIViewController {
    
    @IBOutlet weak var signUpLabel: UILabel!
    
    @IBOutlet weak var signUpDescriptionLabel: UILabel!
    
    @IBOutlet weak var firstNameInputField: AuthInputFields!
    @IBOutlet weak var lastnameInputField: AuthInputFields!
    @IBOutlet weak var phoneNumberInputField: AuthInputFields!
    @IBOutlet weak var emailInputField: AuthInputFields!
    @IBOutlet weak var passwordInputField: AuthInputFields!
    @IBOutlet weak var referralCodeInputField: AuthInputFields!
    
    @IBOutlet weak var signUpButton: GetStartedButton!
    
    @IBOutlet weak var alreadyHaveAccountLabel: UILabel!
    @IBOutlet weak var signInButton: UILabel!
    
    let brandColor = UIColor(named: "brandColor")

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUi()

        // Do any additional setup after loading the view.
    }
    

    func initUi() {
        signUpLabel.text = "Sign up"
        let font = UIFont.systemFont(ofSize: 30, weight: .heavy)

        signUpLabel.font = font;
        signUpLabel.textColor = .black
        
        signUpDescriptionLabel.text = "please provide the details below to sign up"
        signUpDescriptionLabel.textAlignment = .left
        signUpDescriptionLabel.textColor = .gray
        signUpDescriptionLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        
        
        //InputFields
        
        firstNameInputField.customPlaceHolder = "FirstName"
        firstNameInputField.iconName = "person.circle"
        firstNameInputField.iconColor = .gray
        
        lastnameInputField.customPlaceHolder = "Last Name"
        lastnameInputField.iconName = "person.fill"
        lastnameInputField.iconColor = .gray

        
        phoneNumberInputField.customPlaceHolder = "Phone number"
        phoneNumberInputField.iconName = "phone"
        phoneNumberInputField.iconColor = .gray
        
        
        emailInputField.customPlaceHolder = "Email"
        emailInputField.iconName = "envelope"
        emailInputField.iconColor = .gray
        
        passwordInputField.customPlaceHolder = "Enter password"
        passwordInputField.iconName = "lock"
        passwordInputField.iconColor = .gray
        
        referralCodeInputField.customPlaceHolder = "Referral code (Optional)"
        referralCodeInputField.iconName = "person"
        referralCodeInputField.iconColor = .gray
        
        signUpButton.customLabel = "Sign up"
        signUpButton.isSystemImage.0 = true
        signUpButton.isSystemImage.1 = "arrow.forward"
        signUpButton.rightImage.tintColor = brandColor
        
        alreadyHaveAccountLabel.text = "Already have an account?"
        alreadyHaveAccountLabel.textColor = .black
        
        signInButton.text = "Sign In"
        signInButton.textColor = brandColor
    }

}
