//
//  SideMenuViewController.swift
//  Spatch
//
//  Created by Adeoy3 on 21/06/2024.
//

import UIKit

protocol SideMenuViewControllerDelegate {
    func didSelectedCell(_ selectedIndex: Int)
    func handleSideMenuPanGesture(_ sender: UIPanGestureRecognizer )
}

class SideMenuViewController: UIViewController {
    
    let brandColor = UIColor(named: "brandColor")

    @IBOutlet weak var shipmentButton: SidebarMenuButton!
    
    @IBOutlet weak var walletButton: SidebarMenuButton!
    
    @IBOutlet weak var aboutButton: SidebarMenuButton!
    
    @IBOutlet weak var contactButton: SidebarMenuButton!
    
    @IBOutlet weak var logoutButton: SidebarMenuButton!
    
    @IBOutlet weak var walletIconImage: UIImageView!
    @IBOutlet weak var walletBalanceValueLabel: UILabel!
    @IBOutlet weak var walletBalanceTitleLabel: UILabel!
    @IBOutlet weak var sidemenuProfilePicture: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var viewProfileLabel: UILabel!
    var delegate: SideMenuViewControllerDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUi()
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture))
        panGestureRecognizer.delegate = self
        view.addGestureRecognizer(panGestureRecognizer)
        
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let selectedIndex = indexPath.row
////        self.delegate?.didSelectedApp(indexPath.row)
//    }
    
    func initUi(){
        userNameLabel.text = "Forest Baba"
        userNameLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        
        viewProfileLabel.text = "View Profile"
        viewProfileLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        viewProfileLabel.textColor = brandColor
        
        walletBalanceTitleLabel.text = "Wallet Balance"
        walletBalanceTitleLabel.textColor = .lightGray
        walletBalanceTitleLabel.font = UIFont.systemFont(ofSize: 14)
        
        walletBalanceValueLabel.text = "₦3.380"
        walletBalanceValueLabel.textColor = .black
        walletBalanceValueLabel.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        
        walletBalanceValueLabel.numberOfLines = 10
        
        walletIconImage.image = UIImage(systemName: "wallet.pass")
        walletIconImage.tintColor = .white
        walletIconImage.backgroundColor = .systemYellow
        walletIconImage.layer.cornerRadius = 14
        
        sidemenuProfilePicture.image = UIImage(named: "avatar")
        
        sidemenuProfilePicture.layer.cornerRadius = 20
        
        sidemenuProfilePicture.contentMode = .scaleAspectFit
        
        shipmentButton.labelText = "Shipment"
        walletButton.labelText = "Wallet"
        aboutButton.labelText = "About"
        contactButton.labelText = "Contact"
        logoutButton.labelText = "Logout"
        
        handleLogout()
    }
    
    func handleLogout() {
        logoutButton.didTap = {
            PersistenceManager.main.authToken = ""

            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "SigninController") as! SigninController
           vc.modalPresentationStyle = .fullScreen
           self.present(vc, animated: true)
        }
    }
}



extension SideMenuViewController: UIGestureRecognizerDelegate {
    // Dragging Side Menu
    @objc private func handlePanGesture(sender: UIPanGestureRecognizer) {
        delegate?.handleSideMenuPanGesture(sender)
        
    }
}
