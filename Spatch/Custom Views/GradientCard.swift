//
//  GradientCard.swift
//  Spatch
//
//  Created by Adeoy3 on 21/06/2024.
//

import UIKit

class GradientCard: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
            
        setup()
            
    }
        
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
            
        setup()
            
    }

    var shadowView : UIView = UIView()
        var cardView : UIView = UIView()
        var gradientLayer : CAGradientLayer = CAGradientLayer()

    
    var shadowOpacity : Float = 0.0 {
        didSet {
           shadowView.layer.shadowOpacity = shadowOpacity
        }
    }
        
    var shadowRadius : CGFloat = 0.0 {
        didSet {
            shadowView.layer.shadowRadius = shadowRadius
        }
    }
        
    var shadowColor : UIColor? {
        didSet {
            shadowView.layer.shadowColor = shadowColor?.cgColor
        }
    }
        
    var shadowOffset : CGSize = .zero {
        didSet {
            shadowView.layer.shadowOffset = shadowOffset
        }
    }
        
    var cornerRadius : CGFloat = 0.0 {
        didSet {
            cardView.layer.cornerRadius = cornerRadius
            shadowView.layer.cornerRadius = cornerRadius
        }
    }
        
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
    
    func setup() {
        addSubview(shadowView)
//        shadowView.translatesAutoresizingMaskIntoConstraints = false
//        shadowView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
//        shadowView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
//        shadowView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
//        shadowView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
//        shadowView.backgroundColor = UIColor.white
        
        shadowView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, paddingTop: 0,paddingLeft: 20, paddingBottom: 20, width: 70)
            
        addSubview(cardView)
//        cardView.translatesAutoresizingMaskIntoConstraints = false
//        cardView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
//        cardView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
//        cardView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
//        cardView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
//        cardView.backgroundColor = UIColor.white
        
        
        cardView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, paddingTop: 100,paddingLeft: 20, paddingBottom: 20)
            
//        self.sendSubviewToBack(cardView)
//        self.sendSubviewToBack(shadowView)
            
//        cardView.clipsToBounds = true
//        cardView.layer.insertSublayer(gradientLayer, at: 0)
//            
//        self.backgroundColor = UIColor.clear
    }
        
//    override func draw(_ rect: CGRect) {
//        super.draw(rect)
//        gradientLayer.frame = cardView.bounds
//        gradientLayer.startPoint = CGPoint(x: 1.0, y: 1.0)
//        gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.0)
//        gradientLayer.locations = [0, 1]
//    }
}
