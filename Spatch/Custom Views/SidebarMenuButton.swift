//
//  SidebarMenuButton.swift
//  Spatch
//
//  Created by Adeoy3 on 22/06/2024.
//

import UIKit

class SidebarMenuButton: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
            
        setup()
            
    }
        
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
            
        setup()
            
    }
    
    lazy var labelText: String = "No Text" {
        didSet {
            label.text = labelText
        }
    }
    
//    lazy var iconName: String = "chevron.forward" {
//        didSet {
//        return iconName
//        }
//    }
    
    func iconName(iconName: String?) -> String {
        return  iconName ??  "chevron.forward"
    }
    
    lazy var label: UILabel = {
        let label = UILabel()
        
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.textColor = .black
        label.text = labelText
        return label
        
    }()
    
    
    lazy var icon: UIImage = {
       let image = UIImage(systemName: iconName(iconName: "chevron.forward"))
        return image!
    }()
    
    lazy var buttonIcon : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .clear
        imageView.image = icon
        imageView.frame.size = CGSize(width: 100, height: 130)
        imageView.tintColor = .lightGray
        return imageView
    }()
    
    
    func setup(){
        addSubview(label)
        
        label.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor,right: rightAnchor, paddingTop: 0,paddingLeft: 20, paddingBottom: 0, paddingRight: 40, width: 70)
        
        addSubview(buttonIcon)
        buttonIcon.anchor(top: topAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 10, paddingBottom: 10, paddingRight: 5, width: 50, height: 50)
        
        addBottomBorder(with: .lightGray, andWidth: 1)
    }
}
