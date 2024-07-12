//
//  AuthTabButton.swift
//  Spatch
//
//  Created by Adeoy3 on 14/06/2024.
//

import UIKit

class AuthTabButton: UIView {
    
    let brandColor = UIColor(named: "brandColor")
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUp()

    }
    
    
    func createButton(withTitle title: String, withColor color: UIColor) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.backgroundColor = color
        button.setTitleColor(color == .clear ? .black : .white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
        button.frame.size = CGSize(width: 10, height: 30)
        button.layer.cornerRadius = 16

        return button
    }
 
    
    func setUp(){
        backgroundColor = .systemGray6
        layer.cornerRadius = 18
        
        setupConsteaint()
    }
    
    func setupConsteaint() {
        let emailButton = createButton(withTitle: "Email", withColor: UIColor(named: "brandColor") ?? UIColor.clear)
        let phoneButton = createButton(withTitle: "Phone", withColor: UIColor.clear)

        addSubview(emailButton)
        addSubview(phoneButton)
        //option + enter
        emailButton.anchor(top: topAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingBottom: 0, paddingRight:0, width: 120)    
        
        phoneButton.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, paddingTop: 0, paddingBottom: 0, paddingRight:0, width: 120)
    }
}
