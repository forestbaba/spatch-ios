//
//  DashboardController.swift
//  Spatch
//
//  Created by Adeoy3 on 20/06/2024.
//

import UIKit

class DashboardController: UIViewController, SideMenuViewControllerDelegate {

    @IBOutlet weak var headerStack: UIStackView!
    @IBOutlet weak var secondView: UIStackView!
    @IBOutlet weak var firstView: UIStackView!
    @IBOutlet weak var breadCrumbsImageView: UIImageView!
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var requestLabel: UILabel!
    
    @IBOutlet weak var samedayTilesView: DispatchTypeTiles!
    @IBOutlet weak var internationalTiles: DispatchTypeTiles!
    
    
    @IBOutlet weak var interstateDispatchTiles: DispatchTypeTiles!
    //interstateDispatchTiles
    @IBOutlet weak var expressTilesView: DispatchTypeTiles!
    @IBOutlet weak var headerView: UIView!
    
    @IBOutlet weak var menuButtonView: UIImageView!
    let brandColor = UIColor(named: "brandColor")
    
    private var sideMenuShadowView: UIView!
    
    //Side menu parameters
    private var sideMenuViewController: SideMenuViewController!
    private var sideMenuRevealWidth: CGFloat = 260
    private let paddingForRotation: CGFloat = 0
    private var isExpanded: Bool = false
    private var sideMenuLeadingConstraint: NSLayoutConstraint!
    
    private var draggingIsEnabled: Bool = false
    private var panBaseLocation: CGFloat = 0.0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUi()
        
        let brandColor = UIColor(named: "brandColor")
        let brandColorDeep = UIColor(named: "brandColorDeep")

        let expressColor = UIColor(named: "express")
        let expressDeep = UIColor(named: "expressDeep")
        
        
        
        samedayTilesView.dispatchTypeImage.image = UIImage(systemName: "arrowshape.turn.up.right.fill")
        samedayTilesView.dispatchTypeImage.tintColor = .white
        samedayTilesView.gradientColors = [ brandColor!, brandColorDeep!]
        samedayTilesView.dispatchTypeLabel.text = "Same Day"
        
        expressTilesView.dispatchTypeImage.image = UIImage(systemName: "bolt.fill")
        expressTilesView.dispatchTypeImage.tintColor = .white
        expressTilesView.dispatchTypeLabel.text = "Express"
        expressTilesView.gradientColors = [ expressColor!, expressDeep!]
        
        
        internationalTiles.dispatchTypeImage.image = UIImage(systemName: "globe")
        internationalTiles.dispatchTypeImage.tintColor = .white
        internationalTiles.dispatchTypeLabel.text = "International"
        internationalTiles.gradientColors = [ UIColor(named: "international")!, UIColor(named: "internationalDeep")!]
        
        
        
        interstateDispatchTiles.dispatchTypeImage.image = UIImage(systemName: "arrow.right")
        interstateDispatchTiles.dispatchTypeImage.tintColor = .white
        interstateDispatchTiles.dispatchTypeLabel.text = "International"
        interstateDispatchTiles.gradientColors = [ UIColor(named: "interstateDeep")!, UIColor(named: "interstate")!]
        
        
        //        interstateCard.cornerRadius = 8
        //        interstateCard.shadowColor = UIColor.black
        //        interstateCard.shadowOffset = CGSize(width: 0, height: 2)
        //        interstateCard.shadowRadius = 5
        //        interstateCard.shadowOpacity = 0.5
        //        interstateCard.gradientColors = [.red, .purple]
        
        breadCrumbsImageView.addTapGestureRecognizer {
            print("Hello sir")
            self.toggleSideMenu(expanded: self.isExpanded ? false : true)
        }
        
        sideMenuCode()
    }
    
    func didSelectedCell(_ selectedIndex: Int) {
        print("Did select cele")
    }
    
    
    func handleSideMenuPanGesture(_ sender: UIPanGestureRecognizer) {
        print("Handle cell")
    }
    
    
    
    func initUi() {
        
        breadCrumbsImageView.image = UIImage(systemName: "line.3.horizontal")
        breadCrumbsImageView.tintColor = .white
        welcomeLabel.text = "Welcome,"
        welcomeLabel.textColor = .white
        
        welcomeLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        
        nameLabel.text = "James"
        nameLabel.font = UIFont.systemFont(ofSize: 24, weight: .heavy)
        nameLabel.textColor = .white
        
        userImage.image = UIImage(named: "undraw_on_the_way_re_swjt")
        userImage.layer.cornerRadius = 50.0
        userImage.layer.masksToBounds = true
        userImage.layer.borderWidth = 2
        userImage.layer.borderColor = brandColor?.cgColor
        
        headerView.backgroundColor = brandColor
        
        headerView.clipsToBounds = true
        headerView.layer.cornerRadius = 30
        headerView.layer.maskedCorners = [
            .layerMaxXMaxYCorner,
            .layerMinXMaxYCorner]
        
        requestLabel.text = "Would you like to request?"
        requestLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        
        
        //        samedayTilesView.clipsToBounds = true
        //        samedayTilesView.layer.cornerRadius = 90
        //
        //        samedayTilesView.layer.maskedCorners = [
        //            .layerMaxXMaxYCorner,
        //            .layerMinXMaxYCorner]
    }
    
    
    func sideMenuCode(){
        
        
        self.sideMenuShadowView = UIView(frame: self.view.bounds)
        self.sideMenuShadowView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.sideMenuShadowView.backgroundColor = .black
        self.sideMenuShadowView.alpha = 0
        view.insertSubview(self.sideMenuShadowView, at: 1)
        
        
        
        // Side Menu
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        self.sideMenuViewController = storyboard.instantiateViewController(withIdentifier: "SideMenuViewController") as? SideMenuViewController
        view.insertSubview(self.sideMenuViewController!.view, at: 6)
        addChild(self.sideMenuViewController!)
        self.sideMenuViewController!.didMove(toParent: self)
        
        // Side Menu AutoLayout
        self.sideMenuViewController.view.translatesAutoresizingMaskIntoConstraints = false
        self.sideMenuLeadingConstraint = self.sideMenuViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -self.sideMenuRevealWidth - self.paddingForRotation)
        self.sideMenuLeadingConstraint.isActive = true
        
        NSLayoutConstraint.activate([
            self.sideMenuViewController.view.widthAnchor.constraint(equalToConstant: self.sideMenuRevealWidth),
            self.sideMenuViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            self.sideMenuViewController.view.topAnchor.constraint(equalTo: view.topAnchor)
        ])
        
        // Shadow Background View
        self.sideMenuShadowView = UIView(frame: self.view.bounds)
        self.sideMenuShadowView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.sideMenuShadowView.backgroundColor = .black
        self.sideMenuShadowView.alpha = 0
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(TapGestureRecognizer))
        tapGestureRecognizer.numberOfTapsRequired = 1
        tapGestureRecognizer.delegate = self
        self.sideMenuShadowView.addGestureRecognizer(tapGestureRecognizer)
        view.insertSubview(self.sideMenuShadowView, at: 1)
        
        // Side Menu Gestures
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture))
        panGestureRecognizer.delegate = self
        view.addGestureRecognizer(panGestureRecognizer)
        
        
        
        
        
        
        // Side Menu
        // let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
//        self.sideMenuViewController = storyboard.instantiateViewController(withIdentifier: "SideMenuViewController") as? SideMenuViewController
//        sideMenuViewController.delegate = self
//        view.insertSubview(self.sideMenuViewController!.view, at: 2)
//        addChild(self.sideMenuViewController!)
//        self.sideMenuViewController!.didMove(toParent: self)
        
    }
    
    
    func animateShadow(alpha: CGFloat) {
        UIView.animate(withDuration: 0.5) {
            self.sideMenuShadowView.alpha = alpha
        }
    }
    
    func animateSideMenu(targetPosition: CGFloat, completion: @escaping (Bool) -> ()) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0, options: .layoutSubviews, animations: {
            self.sideMenuLeadingConstraint.constant = targetPosition
            //            self.mainControllerLeadingConstraint.constant = targetPosition + self.sideMenuRevealWidth
            //            self.mainControllerTrailingConstriant.constant = targetPosition + self.sideMenuRevealWidth
            
            self.view.layoutIfNeeded()
            
        }, completion: completion)
    }
    
    func toggleSideMenu(expanded: Bool) {
        if expanded {
            self.animateSideMenu(targetPosition: 0) { _ in
                self.isExpanded = true
            }
            self.animateShadow(alpha: 0.6)
        }
        else {
            self.animateSideMenu(targetPosition: (-self.sideMenuRevealWidth - self.paddingForRotation)) { _ in
                self.isExpanded = false
            }
            self.animateShadow(alpha: 0)
        }
    }
    
    
    // Dragging Side Menu
    @objc private func handleHomePagePanGesture(sender: UIPanGestureRecognizer) {
        handlePanGesture(sender: sender)
    }
    
    // Dragging Side Menu
    @objc private func handlePanGesture(sender: UIPanGestureRecognizer) {
        
        let position: CGFloat = sender.translation(in: self.view).x
        let velocity: CGFloat = sender.velocity(in: self.view).x
        
        switch sender.state {
        case .began:
            
            // cancel if the menu is expanded and drag is from left to right
            if velocity > 0, self.isExpanded {
                sender.state = .cancelled
            }
            
            // Enable dragging if menu is not expanded and drag is from left to right
            if velocity > 0, !self.isExpanded {
                self.draggingIsEnabled = true
            }
            // Enable dragging if menu is expanded and drag is from right to left
            else if velocity < 0, self.isExpanded {
                self.draggingIsEnabled = true
            }
            
            if self.draggingIsEnabled {
                // If swipe is fast, Expand/Collapse the side menu with animation instead of dragging
                let velocityThreshold: CGFloat = 550
                if abs(velocity) > velocityThreshold {
                    self.toggleSideMenu(expanded: self.isExpanded ? false : true)
                    self.draggingIsEnabled = false
                    return
                }
                self.panBaseLocation = 0.0
                if self.isExpanded {
                    self.panBaseLocation = self.sideMenuRevealWidth
                }
            }
            
        case .changed:
            // Animate side menu along with dragging action
            if self.draggingIsEnabled {
                let xLocation: CGFloat = self.panBaseLocation + position
                let percentage = (xLocation * 150 / self.sideMenuRevealWidth) / self.sideMenuRevealWidth
                
                let alpha = percentage >= 0.6 ? 0.6 : percentage
                self.sideMenuShadowView.alpha = alpha
                
                // Move side menu while dragging
                if xLocation <= self.sideMenuRevealWidth {
                    self.sideMenuLeadingConstraint.constant = xLocation - self.sideMenuRevealWidth
                    //                    self.mainControllerLeadingConstraint.constant = xLocation
                    //                    self.mainControllerTrailingConstriant.constant = xLocation
                }
            }
        case .ended:
            self.draggingIsEnabled = false
            // If the side menu is half Open/Close, then Expand/Collapse with animation
            let movedMoreThanHalf = self.sideMenuLeadingConstraint.constant > -(self.sideMenuRevealWidth * 0.5)
            self.toggleSideMenu(expanded: movedMoreThanHalf)
            
        default:
            break
        }
    }
}


extension DashboardController: UIGestureRecognizerDelegate {
    @objc func TapGestureRecognizer(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            if self.isExpanded {
                self.toggleSideMenu(expanded: false)
            }
        }
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if (touch.view?.isDescendant(of: self.sideMenuViewController.view))! {
            return false
        }
        return true
    }
}

//extension DashboardController: SideMenuViewControllerDelegate {
//    func didSelectedCell(_ selectedIndex: Int) {
//        print("cell selected at ", selectedIndex)
//    }
//}

//extension DashboardController: SideMenuViewControllerDelegate {
//    func handleSideMenuPanGesture(_ sender: UIPanGestureRecognizer) {
//        handlePanGesture(sender)
//    }
//
//}
