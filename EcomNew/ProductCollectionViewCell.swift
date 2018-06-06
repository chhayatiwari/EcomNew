//
//  ProductCollectionViewCell.swift
//  EcomNew
//
//  Created by Chhaya Tiwari on 6/4/18.
//  Copyright © 2018 ChhayaTiwari. All rights reserved.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleView: UILabel!
    
    var longPressHandler:((UILongPressGestureRecognizer,Animals)->())!
    
    var animal:Animals? {
        didSet{
            addLongPressGesture()
            // Set the name and image
            titleView?.text = animal?.name
            imageView?.image = UIImage(named: (animal?.imageName)!)
        }
    }
    
    func addLongPressGesture(){
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(actionLongPressGesture(_:)
            ))
        longPressGesture.minimumPressDuration = 0.3
        longPressGesture.numberOfTouchesRequired = 1
        longPressGesture.allowableMovement = 10
        addGestureRecognizer(longPressGesture)
    }
    
    @objc func actionLongPressGesture(_ sender:UILongPressGestureRecognizer){
        if longPressHandler != nil{
            longPressHandler(sender,animal!)
        }
    }
}
