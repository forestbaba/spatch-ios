//
//  WhoIsSendingViewController.swift
//  Spatch
//
//  Created by Adeoy3 on 25/06/2024.
//

import UIKit

class WhoIsSendingViewController: UIViewController {
    
    let radioButtonsStack = RadioButtonsStack()

    @IBOutlet weak var proceedButton: GetStartedButton!
    @IBOutlet weak var headerTitle: UILabel!

    let brandColor = UIColor(named: "brandColor")


    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupRadioButtonsStack()
        initUi()

    }
    
    func initUi(){
        
        let whoText: String = "Who is\nSending"

        headerTitle.text = whoText
        headerTitle.font = UIFont.systemFont(ofSize: 38, weight: .medium)
        
        proceedButton.isSystemImage.1 = "arrow.forward"
        proceedButton.isSystemImage.0 = true
        proceedButton.rightImage.tintColor = brandColor
        
        proceedButton.customLabel = "Proceed"
    }
    

    private func setupRadioButtonsStack() {
        view.addSubview(radioButtonsStack)
        radioButtonsStack.translatesAutoresizingMaskIntoConstraints = false
        


        // Set constraints
        NSLayoutConstraint.activate([
//            radioButtonsStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            radioButtonsStack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            radioButtonsStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            radioButtonsStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            
            radioButtonsStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 150),
            radioButtonsStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            radioButtonsStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            radioButtonsStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])

        
        let options = [
                  DispatchTypeOptions(id: 1, title: "I am the sender", iconName: "arrow.right"),
                  DispatchTypeOptions(id: 2, title: "I am the receiver", iconName: "arrow.left"),
                  DispatchTypeOptions(id: 3, title: "Booking for someone", iconName: "shippingbox")
              ]
        radioButtonsStack.set(options)

        radioButtonsStack.radioViews.forEach { radioView in
            radioView.radioButton.addTarget(self, action: #selector(radioButtonSelected(_:)), for: .valueChanged)
        }
    }

    @objc private func radioButtonSelected(_ sender: RadioButton) {
        if let selectedIndex = radioButtonsStack.selectedIndex {
            print("Selected index: \(selectedIndex)")
        }
    }

   
}
