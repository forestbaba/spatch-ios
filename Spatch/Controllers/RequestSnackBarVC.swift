//
//  RequestSnackBarVC.swift
//  Spatch
//
//  Created by Timothy Obeisun on 7/12/24.
//

import UIKit

class RequestSnackBarVC: BottomPopupViewController {

    override var popupHeight: CGFloat { return CGFloat(400) }
    
    override var popupTopCornerRadius: CGFloat { return CGFloat(25) }
    
    override var popupPresentDuration: Double { return 0.2 }
    
    override var popupDismissDuration: Double { return 0.2 }
    
    override var popupShouldDismissInteractivelty: Bool { return true }
    
    override var popupDimmingViewAlpha: CGFloat { return 0.5 }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
