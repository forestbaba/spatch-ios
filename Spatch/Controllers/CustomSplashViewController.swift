//
//  CustomSplashViewController.swift
//  Spatch
//
//  Created by Adeoy3 on 17/07/2024.
//

import UIKit
import Combine

class CustomSplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("Loaded......")
         checkUserSession()
    }
   
    func checkUserSession(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        if PersistenceManager.main.authToken.isEmpty {
             let vc = storyboard.instantiateViewController(withIdentifier: "SigninController") as! SigninController
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        } else {
             let vc = storyboard.instantiateViewController(withIdentifier: "DashboardController") as! DashboardController
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }
    }
}
