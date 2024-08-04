//
//  ShipmentDetailsController.swift
//  Spatch
//
//  Created by Adeoy3 on 12/07/2024.
//

import UIKit

class ShipmentDetailsController: UIViewController {

    @IBOutlet weak var getStartedButton: GetStartedButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        getStartedButton.customLabel = "Cancel Job"
        getStartedButton.didTap = {
            print("Cancel job")
        }
        

    }

}
