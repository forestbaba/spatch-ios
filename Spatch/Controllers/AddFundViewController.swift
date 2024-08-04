//
//  AddFundViewController.swift
//  Spatch
//
//  Created by Adeoy3 on 15/07/2024.
//

import UIKit

class AddFundViewController: UIViewController {

    @IBOutlet weak var addFundButton: GetStartedButton!
    
    @IBOutlet weak var amountView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        addFundButton.customLabel = "Add Fund+"
        amountView.addBottomBorder(with: UIColor.systemGray6, andWidth: 2)
    }
    

}
