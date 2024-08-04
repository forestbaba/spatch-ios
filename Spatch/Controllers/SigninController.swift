//
//  SigninController.swift
//  Spatch
//
//  Created by Adeoy3 on 15/06/2024.
//

import UIKit
import Combine

class SigninController: UIViewController {
    
    @IBOutlet weak var phoneView: UIView!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var passwordRequiredErrorLabel: UILabel!
    @IBOutlet weak var emailOrPhonenumberTextField: AuthInputFields!
    
    @IBOutlet weak var passwordTextField: AuthInputFields!
    
    @IBOutlet weak var forgotPasswordLabel: UILabel!
    
    @IBOutlet weak var signInButton: GetStartedButton!
    
    let brandColor = UIColor(named: "brandColor")
    var viewModel : LoginViewModel
    var cancellable = Set<AnyCancellable>()
    
    var spinner = UIActivityIndicatorView(style: .large)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        subscribeToPublishers()
        signInButtonAction()
        renderPhoneView()
        passwordRequiredErrorLabel.isHidden = true
        
        
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
        
        spinner.translatesAutoresizingMaskIntoConstraints = false
       
        
        signInButton.addSubview(spinner)
        spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
                spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//        signInButton.didTap = {
//            print("Let's go in")
//        }
    }
    
    required init?(coder: NSCoder) {
        self.viewModel = LoginViewModel(client: AuthClient())
        super.init(coder: coder)
    }
    
    func signInButtonAction() {
        signInButton.didTap = { [weak self] in
            guard let self else { return }
            spinner.startAnimating()
            validateFields()
            let email = emailOrPhonenumberTextField.textField.text ?? ""
            let password = passwordTextField.textField.text ?? ""
            
            viewModel.login(email: email, password: password, fcm: "jhdkjjdghj")
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
    
    func validateFields(){
        if !passwordTextField.textField.hasText || !emailOrPhonenumberTextField.textField.hasText{
            passwordRequiredErrorLabel.isHidden = false
            passwordRequiredErrorLabel.text = "Phone number/email field are required"
            spinner.stopAnimating()
        }
       // forgotPasswordLabel.isHidden = true
    }
}



extension SigninController {
    
    private func subscribeToPublishers(){
        viewModel.data
            .receive(on: DispatchQueue.main)
            .sink { response in
                print("API RESPONSE: ", response)
                guard let response else { return }
                PersistenceManager.main.authToken = response.token
                                
                if !response.token.isEmpty {
                        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        let vc = storyboard.instantiateViewController(withIdentifier: "DashboardController") as! DashboardController
                        vc.modalPresentationStyle = .fullScreen
                        self.present(vc, animated: true)
//                    self.navigationController?.pushViewController(vc, animated: true)
                }
            }
            .store(in: &cancellable)
        
        viewModel.loginError
            .receive(on: DispatchQueue.main)
            .sink { [weak self] erroRes in
                print("Error RESPONSE: ", erroRes)
                guard let self else {return}
                if !erroRes.isEmpty {
                    spinner.stopAnimating()
                    let alert = UIAlertController(title: "Login Error", message: erroRes.first, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in}))
                    self.present(alert, animated: true, completion: nil)
                }
               
            }
            .store(in: &cancellable)
    }
}
