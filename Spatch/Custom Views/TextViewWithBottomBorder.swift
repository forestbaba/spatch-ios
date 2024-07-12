//
//  TextViewWithBottomBorder.swift
//  Spatch
//
//  Created by Adeoy3 on 01/07/2024.
//

import UIKit

class TextViewWithBottomBorder: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
            
        setup()
            
    }
        
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
            
        setup()
            
    }
    
    lazy var input: UITextField = {
        let input = UITextField()
        input.placeholder = "Pick from..."
        addBottomBorder(with: .gray, andWidth: 1)

        return input
    }()
    
    var clearIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .clear
        imageView.image = UIImage(systemName: "xmark")
        imageView.tintColor = .gray
        return imageView
    }()
    
    
    func setup() {
        addSubview(input)
        input.anchor(
            top: topAnchor,
            left: leftAnchor,
            bottom: bottomAnchor,
            right: rightAnchor,
            paddingTop: 5,
            paddingLeft: 0,
            paddingBottom: 5,
            paddingRight: 20
        )
        
        
        addSubview(clearIcon)
        clearIcon.anchor(top: topAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 5, paddingBottom: 5, paddingRight: 0)


    }

}
