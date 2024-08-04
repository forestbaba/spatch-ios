//
//  GetStartedButton.swift
//  Spatch
//
//  Created by Adeoy3 on 12/06/2024.
//

import UIKit

class GetStartedButton: UIView {
    
    var didTap : (() -> ()) = {}
    
    let brandColor = UIColor(named: "brandColor")

 var customLabel : String = "" {
        didSet {
            buttonLabel.text = customLabel
        }
    }
    
    var isSystemImage : (Bool, String) = (false, "") {
        didSet {
            if isSystemImage.0 {
                rightImage.image = UIImage(systemName:  isSystemImage.1)
            } else {
                rightImage.image = UIImage(named: isSystemImage.1)
            }
        }
    }
    
    lazy var rightImage: UIImageView = {
        let imageView = UIImageView()
//        let image = UIImage(systemName: "arrow.forward")
//        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .clear
        return imageView
    }()
    
    lazy var buttonLabel: UILabel = {
        let label = UILabel()
        label.textColor = brandColor
        label.font = .systemFont(ofSize: 30, weight: .heavy)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUp()

    }
    
    func setUp() {
        backgroundColor = .white
        layer.borderWidth = 1
        layer.borderColor = brandColor?.cgColor
        addBottomBorder(with: brandColor, andWidth: 5)
        addLeftBorder(with: brandColor, andWidth: 2)
        addRightBorder(with: brandColor, andWidth: 2)
        addTopBorder(with: brandColor, andWidth: 2)
        setupConsteaint()
        setUpDidTap()
    }
    
    func setupConsteaint() {
        addSubview(rightImage)
        //option + enter
        rightImage.anchor(top: topAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingBottom: 0, paddingRight:20, width: 50)
        
        addSubview(buttonLabel)
        
        buttonLabel.center(inView: self)
    }
    
    func setUpDidTap () {
        addTapGestureRecognizer { [weak self] in
            self?.didTap()
        }
    }
}
