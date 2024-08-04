//
//  RequestSnackBarVC.swift
//  Spatch
//
//  Created by Timothy Obeisun on 7/12/24.
//

import UIKit

class RequestSnackBarVC: BottomPopupViewController {

    @IBOutlet weak var separatorView: UIView!
    @IBOutlet weak var paymentMethodView: UIView!
    @IBOutlet weak var samedayView: UIView!
    @IBOutlet weak var samedayLabel: UILabel!
    @IBOutlet weak var requestButton: GetStartedButton!
    override var popupHeight: CGFloat { return CGFloat(500) }
    let brandColor = UIColor(named: "brandColor")

    override var popupTopCornerRadius: CGFloat { return CGFloat(25) }
    
    override var popupPresentDuration: Double { return 0.2 }
    
    override var popupDismissDuration: Double { return 0.2 }
    
    override var popupShouldDismissInteractivelty: Bool { return true }
    
    override var popupDimmingViewAlpha: CGFloat { return 0.5 }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        requestButton.isSystemImage.1 = "arrow.right"
        requestButton.isSystemImage.0 = true
        requestButton.tintColor = brandColor
        
        requestButton.customLabel = "Request"
        requestButton.didTap = {
            print("Request for job")
        }
        
        samedayLabel.setMargins(10)
        samedayView.layer.cornerRadius = 7
        paymentMethodView.layer.cornerRadius = 7
        separatorView.layer.cornerRadius = 5
    }
}
