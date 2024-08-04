//
//  WalletViewController.swift
//  Spatch
//
//  Created by Adeoy3 on 15/07/2024.
//

import UIKit

class WalletViewController: UIViewController {
    
    @IBOutlet weak var cardTiles: CardTiles!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    

    func setupUI(){
        cardTiles.gradientColors =  [UIColor.green, UIColor.blue]
//        cardTiles.gradientColors = [ UIColor(named: "international")!, UIColor(named: "internationalDeep")!]
    }
}
