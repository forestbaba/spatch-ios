//
//  AuthInputFields.swift
//  Spatch
//
//  Created by Adeoy3 on 14/06/2024.
//

import UIKit

enum TextFieldType {
    case normal
    case secure
}

class AuthInputFields: UIView {
    
    var customPlaceHolder : String = "" {
        didSet {
            textField.placeholder = customPlaceHolder
        }
    }
    
    var iconName : String = "" {
        didSet {
            textFieldIcon.image = UIImage(systemName: iconName)
        }
    }
    
    var iconColor : UIColor = .gray {
        didSet {
            textFieldIcon.tintColor = iconColor
        }
    }
    
    var type: TextFieldType = .normal {
        didSet {
            textField.isSecureTextEntry = type == .secure
        }
    }
    
    lazy var textField: UITextField = {
        let inputField = UITextField()
        inputField.textColor = .black
        return inputField
    }()
    
    lazy var textFieldIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .clear
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUp()
        
    }
    
    func setUp(){
        backgroundColor = .white
        layer.cornerRadius = 13
        layer.borderWidth = 1
        layer.borderColor = UIColor(named: "darkGray")?.cgColor
        
        
        setupConsteaint()
    }
    
    func setupConsteaint() {
        
        addSubview(textField)
        addSubview(textFieldIcon)
        
        textField.anchor(
            top: topAnchor,
            left: leftAnchor,
            bottom: bottomAnchor,
            right: rightAnchor,
            paddingTop: 0,
            paddingLeft: 70,
            paddingBottom: 0,
            paddingRight: 20
        )
        
        textFieldIcon.anchor(
            top: topAnchor,
            left: leftAnchor,
            bottom: bottomAnchor,
            paddingTop: 0, paddingLeft: 20,
            paddingBottom: 0,
            paddingRight:0, width: 20, height: 20)
        
    }
    
}
