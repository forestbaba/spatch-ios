//
//  ResetPasswordController.swift
//  Spatch
//
//  Created by Adeoy3 on 18/06/2024.
//

import UIKit

class ResetPasswordController: UIViewController {
    
    
    @IBOutlet weak var codeInputField: AuthInputFields!
    @IBOutlet weak var newPasswordInputField: AuthInputFields!
    
    @IBOutlet weak var resetPasswordButton: GetStartedButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initView()

        // Do any additional setup after loading the view.
    }
    
    
    func initView() {
        codeInputField.textField.placeholder = "Code sent to your email"
        codeInputField.iconName = "barcode.viewfinder"
        codeInputField.iconColor = .gray
        
        newPasswordInputField.type = .secure
        newPasswordInputField.textField.placeholder = "Enter new password"
        newPasswordInputField.iconName = "key.fill"
        newPasswordInputField.iconColor = .gray
        
        resetPasswordButton.customLabel = "Reset Password"
//        resetPasswordButton.isSystemImage.0 = true
//        resetPasswordButton.isSystemImage.1 = "arrow.forward"
        resetPasswordButton.rightImage.image = UIImage(systemName: "arrow.forward")
        
    }

}
