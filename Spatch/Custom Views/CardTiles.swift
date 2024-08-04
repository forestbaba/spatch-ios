//
//  DispatchTypeTiles.swift
//  Spatch
//
//  Created by Adeoy3 on 20/06/2024.
//

import UIKit

class CardTiles: UIView {
    
    var shadowView : UIView = UIView()


    let brandColor = UIColor(named: "brandColor")
    let brandColorDeep = UIColor(named: "brandColorDeep")
    
    var gradientLayer : CAGradientLayer = CAGradientLayer()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
    appendImgeAndTextToView()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        appendImgeAndTextToView()
        
    }
    
    lazy var dispatchTypeImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .clear
        return imageView
    }()
    
    lazy var dispatchTypeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    var gradientColors : [UIColor] = [UIColor.white] {
        didSet {
            var cgColors : [CGColor] = []
            //get cgColor from each
            for color in gradientColors {
                cgColors.append(color.cgColor)
            }
            gradientLayer.colors = cgColors
        }
    }
    
    func appendImgeAndTextToView(){
        self.layer.cornerRadius = 70

        self.layer.maskedCorners = [
            .layerMaxXMaxYCorner,
            .layerMinXMaxYCorner]
        
        gradientLayer.frame = layer.bounds
        gradientLayer.colors = gradientColors

        self.layer.insertSublayer(gradientLayer, at: 0)
        

        self.clipsToBounds = true
                self.layer.cornerRadius = 10
        
                self.layer.maskedCorners = [
                    .layerMaxXMaxYCorner,
                    .layerMinXMaxYCorner,
                    .layerMaxXMinYCorner,
                    .layerMinXMinYCorner
                    ]
        
        setupConsteaint()
    }
    
    
    func setupConsteaint() {
        
        addSubview(dispatchTypeImage)
        dispatchTypeImage.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, paddingTop: 0,paddingLeft: 20, paddingBottom: 20, width: 70)
        
        addSubview(dispatchTypeLabel)
        
        dispatchTypeLabel.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, paddingTop: 100,paddingLeft: 20, paddingBottom: 20)
    }

}
