//
//  ContactViewController.swift
//  Spatch
//
//  Created by Adeoy3 on 15/07/2024.
//

import UIKit

class ContactViewController: UIViewController {

    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var contactView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        initUI()
    }
    
    func initUI(){
        contactView.addBottomBorder(with: UIColor.systemGray5, andWidth: 2)
        
        emailView.addBottomBorder(with: UIColor.systemGray5, andWidth: 2)
    }

}
