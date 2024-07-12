//
//  PickupScreenViewController.swift
//  Spatch
//
//  Created by Adeoy3 on 01/07/2024.
//

import UIKit

class PickupScreenViewController: UIViewController {
    @IBOutlet weak var pickupAddressDescLabel: UILabel!
    @IBOutlet weak var pickupLocationImageView: UIImageView!
    
    @IBOutlet weak var dottedView: UIView!
    @IBOutlet weak var senderNameView: SenderNameAndPhoneView!
    @IBOutlet weak var contactDividerView: UIView!
    @IBOutlet weak var nearestLandmarkStackview: UIStackView!
    @IBOutlet weak var nearestLandmarkIcon: UIImageView!
    @IBOutlet weak var nearestLandmarkInputField: UITextField!
    @IBOutlet weak var recentAddressDividerView: UIView!
    @IBOutlet weak var arrowRightImageView: UIImageView!
    @IBOutlet weak var recentAddressLabel: UILabel!
    @IBOutlet weak var locationIconImageview: UIImageView!
    @IBOutlet weak var recentAddressView: UIView!
    @IBOutlet weak var pickfromDividerView: UIView!
    @IBOutlet weak var addressInputField: UITextField!
    @IBOutlet weak var pickupFromImageView: UIImageView!
    @IBOutlet weak var dropoffDividerView: UIView!
    @IBOutlet weak var dropoffAddressView: LocationTextInputView!
    @IBOutlet weak var dropoffAddressDesclabel: UILabel!
    @IBOutlet weak var dropOffLocationImageView: UIImageView!
    @IBOutlet weak var pickupDividerView: UIView!
    @IBOutlet weak var pickupAddressView: LocationTextInputView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUi()

        // Do any additional setup after loading the view.
    }
    
    
    func initUi(){
        pickupAddressDescLabel.text = "Select Pickup Area"
        pickupAddressDescLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        
        pickupLocationImageView.image = UIImage(systemName: "scope")
        pickupLocationImageView.tintColor = .gray
        
        pickupAddressView.image =  "chevron.down"
        pickupAddressView.labelText = "Lagos"
        
        dropOffLocationImageView.image = UIImage(systemName: "scope")
        dropOffLocationImageView.tintColor = .gray
        
        dropoffAddressDesclabel.text = "Select Pickup Area"
        dropoffAddressDesclabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        
        dropoffAddressView.image =  "chevron.down"
        dropoffAddressView.labelText = "Choose Option"
        
        pickupDividerView.backgroundColor = .lightGray
        dropoffDividerView.backgroundColor = .lightGray
        pickfromDividerView.backgroundColor = .lightGray
        recentAddressDividerView.backgroundColor = .lightGray
        contactDividerView.backgroundColor = .lightGray
        
        pickupFromImageView.image = UIImage(systemName: "arrow.up.circle")
        pickupFromImageView.image?.withTintColor(UIColor.yellow)
        pickupFromImageView.backgroundColor = .systemYellow
        pickupFromImageView.layer.cornerRadius = 15
        
        addressInputField.backgroundColor = .lightGray
        addressInputField.textColor = .gray
        
        addressInputField.translatesAutoresizingMaskIntoConstraints = false
        
        locationIconImageview.image = UIImage(systemName: "location.north.fill")
        locationIconImageview.tintColor = .gray
        
        recentAddressLabel.text = "Recent Address"
        recentAddressLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        
        arrowRightImageView.image = UIImage(systemName:  "chevron.right")
        arrowRightImageView.tintColor = .gray
        
        nearestLandmarkInputField.borderStyle = .none
        nearestLandmarkIcon.image = UIImage(systemName: "location.north.circle")
        nearestLandmarkIcon.tintColor = .gray
        
        nearestLandmarkStackview.backgroundColor = .systemGray6
    }
    

}
