//
//  LocationTextInputView.swift
//  Spatch
//
//  Created by Adeoy3 on 01/07/2024.
//

import UIKit

class LocationTextInputView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
            
        setup()
            
    }
        
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
            
        setup()
            
    }
    
    var labelText: String = "place holder" {
        didSet{
            label.text = labelText
        }
    }
    
    var image: (String) = ("arrow.right") {
        didSet {
            icon.image = UIImage(systemName: image)
            icon.tintColor = .gray
        }
    }
    
    lazy var label: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var icon: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
//        imageView.backgroundColor = .clear
        return imageView
    }()
    
    func setup(){
        
        addSubview(label)
        label.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, paddingTop: 5,paddingLeft: 20, paddingBottom: 5)
        
        addSubview(icon)
        icon.anchor(top: topAnchor,
                    bottom: bottomAnchor,
                    right: rightAnchor,
                    paddingTop: 20,
                    paddingBottom: 20,
                    paddingRight: 20,
                    width: 50, height: 50)
        
        layer.cornerRadius = 10
        layer.borderWidth = 0.5
        layer.borderColor =  UIColor(resource: .lightGray).cgColor
        
        layer.backgroundColor = UIColor(resource: .lightGray).cgColor
    }

}
