//
//  DispatchTypeCellCollectionViewCell.swift
//  Spatch
//
//  Created by Adeoy3 on 10/07/2024.
//

import UIKit

struct DispatchType {
    let name: String
}

class DispatchTypeCellCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var vehicleTypeImageview: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var cardTiles: UIView!
    
    @IBOutlet weak var tagContainer: UIView!
    
    func setup(dispatchType: DispatchType) {
        cardTiles.layer.cornerRadius = 10
        
        tagContainer.roundCorners(corners: [.topLeft, .topRight], radius: 10)
        
        priceLabel.text = dispatchType.name
        vehicleTypeImageview.image = UIImage(systemName: "bicycle")
    }
}
