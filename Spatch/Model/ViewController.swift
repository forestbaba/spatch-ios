//
//  ViewController.swift
//  Spatch
//
//  Created by Adeoy3 on 11/06/2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var getStartedButton: GetStartedButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getStartedButton.isSystemImage.1 = "undraw_on_the_way_re_swjt"
        getStartedButton.isSystemImage.0 = false
        
        getStartedButton.customLabel = "Obeisun"
        getStartedButton.didTap = {
            print("Seun mama")
        }
    }


}

