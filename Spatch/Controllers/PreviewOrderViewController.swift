//
//  PreviewOrderViewController.swift
//  Spatch
//
//  Created by Adeoy3 on 08/07/2024.
//

import UIKit

class PreviewOrderViewController: UIViewController {

    @IBOutlet weak var dispatchTypeCollectionView: UICollectionView!
    
    var dispatchType: [String] = ["Bike", "Van", "Bus"]
    let brandColor = UIColor(named: "brandColor")

    override func viewDidLoad() {
        super.viewDidLoad()
        
       
    }
    


//    override func viewDidAppear(_ animated: Bool) {
//            super.viewDidAppear(animated)
//        
//        for _ in 0...2 {
//                   if let dayView = Bundle.main.loadNibNamed("DispatchType", owner: nil, options: nil)!.first as? DispatchType {
//                       dayView.price.text = "Up To 5KG"
//                       dayView.title.text = "Bike"
//                       dayView.backgroundColor = .darkGray
//                       horizontalStackView.addArrangedSubview(dayView)
//                   }
//               }
//           
//        }


}

extension PreviewOrderViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dispatchType.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dispatchTypeCell", for: indexPath) as! DispatchTypeCellCollectionViewCell
        
        cell.priceLabel.text = dispatchType[indexPath.row]
        cell.vehicleTypeImageview.image = UIImage(systemName: "bicycle")
        cell.cardTiles.layer.cornerRadius = 15
        
        cell.cardTiles.layer.maskedCorners = [
            .layerMaxXMaxYCorner,
            .layerMinXMaxYCorner,
            .layerMaxXMinYCorner
        ]
        
        cell.cardTiles.backgroundColor = brandColor
        
//        view.addSubview(cell.weightDescLabel)
        cell.weightDescLabel.layer.cornerRadius = 20
        cell.weightDescLabel.layer.maskedCorners = [
            .layerMaxXMaxYCorner,
            .layerMinXMaxYCorner,
            .layerMaxXMinYCorner
        ]
        cell.weightDescLabel.setMargins(10)
        
        return cell
    }
    
    
}


extension UILabel {
    func setMargins(_ margin: CGFloat = 10) {
        
        if let textString = self.text {
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.firstLineHeadIndent = margin
            paragraphStyle.headIndent = margin
            paragraphStyle.tailIndent = -margin
            let attributedString = NSMutableAttributedString(string: textString)
            attributedString.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: attributedString.length))
            attributedText = attributedString
        }
    }
}
