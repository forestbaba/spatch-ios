//
//  SenderNameAndPhoneView.swift
//  Spatch
//
//  Created by Adeoy3 on 05/07/2024.
//

import UIKit

class SenderNameAndPhoneView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
            
        setup()
            
    }
        
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
            
        setup()
            
    }
    
    lazy var title: UILabel  = {
        
        let label = UILabel()
        label.text = "Sender Phone"
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        return label
        
    }()
    
    lazy var errorlabel: UILabel  = {
        
        let label = UILabel()
        label.text = "Sender Phone is required"
        label.textColor = .red
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        return label
        
    }()
    
    lazy var inputField: UITextField = {
        
        let textInput = UITextField()
        textInput.placeholder = "Sender name"
        return textInput
        
    }()
    
    lazy var iconImage: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .clear
        imageView.image = UIImage(systemName: "person")
        imageView.tintColor = .systemGray6
        return imageView
    }()
    
    
    
    let stackView: UIStackView = {
        let brandColor = UIColor(named: "brandColor")
        let brandLightgrey = UIColor(named: "lightGray")

        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.distribution = .fill
        view.axis = .horizontal
        view.spacing = 16
        view.backgroundColor = brandLightgrey
        view.layer.cornerRadius = 10
        
        return view
    }()
    
    func setup(){
        addSubview(title)
        
        title.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 5, paddingLeft: 5, paddingRight: 10)
        
        
        stackView.addArrangedSubview(inputField)
        stackView.addSubview(iconImage)
        
        addSubview(stackView)
        
        stackView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 45, paddingLeft: 5, paddingBottom: 10, paddingRight: 5, height: 150)
        
//
        addSubview(errorlabel)
         errorlabel.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 60, paddingLeft: 5, paddingBottom: 10, paddingRight: 5)
    }
}
