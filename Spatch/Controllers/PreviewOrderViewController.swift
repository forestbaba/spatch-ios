//
//  PreviewOrderViewController.swift
//  Spatch
//
//  Created by Adeoy3 on 08/07/2024.
//

import UIKit

class PreviewOrderViewController: UIViewController {
    
    @IBOutlet weak var dispatchTypeCollectionView: UICollectionView!
    
    let brandColor = UIColor(named: "brandColor")
    var dispatchTypes: [DispatchType] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupDispatchType()
    }
    
    func setupDispatchType() {
        dispatchTypes = [
            .init(name: "Van"),
            .init(name: "Bike"),
            .init(name: "Bus")
        ]
    }
}

extension PreviewOrderViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dispatchTypes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dispatchTypeCell", for: indexPath) as! DispatchTypeCellCollectionViewCell
        
        cell.setup(dispatchType: dispatchTypes[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "RequestSnackBarVC") as! RequestSnackBarVC
//        let vc = RequestSnackBarVC()
        self.present(vc, animated: true)
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
