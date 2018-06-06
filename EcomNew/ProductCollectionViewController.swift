//
//  ProductCollectionViewController.swift
//  EcomNew
//
//  Created by Chhaya Tiwari on 6/4/18.
//  Copyright © 2018 ChhayaTiwari. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class ProductCollectionViewController: UICollectionViewController, UISearchBarDelegate {
    
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    var filteredData = Animals.allAnimals
    var allAnimal: [Animals]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allAnimal = filteredData
        // Uncomment the following line to preserve selection between presentations
        self.clearsSelectionOnViewWillAppear = false
        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        let space:CGFloat = 3.0
        let dimension = (view.frame.size.width - (2 * space)) / 2.0
        
        flowLayout.minimumInteritemSpacing = space
        flowLayout.minimumLineSpacing = space
        flowLayout.itemSize = CGSize(width: dimension, height: dimension)
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        
        return allAnimal.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Shopping", for: indexPath) as! ProductCollectionViewCell
    
        let animal = self.allAnimal[(indexPath as NSIndexPath).row]
        // Set the name and image
        cell.animal = animal
        cell.longPressHandler = { (sender,animal) in
            self.longPressGesture(sender,animal: animal)
        }
    
        return cell
    }
    
    func longPressGesture(_ sender: UILongPressGestureRecognizer,animal:Animals) {
        switch sender.state {
        case .ended:
            break
        case .began:
            let touchPoint = sender.location(in: self.collectionView)
            let index = collectionView?.indexPathForItem(at: touchPoint)
            showOptionToCopyPaste((index?.row)!)
            break
        default:
            break
        }
    }
    
    func showOptionToCopyPaste(_ index :Int){
        let actionSheet = UIAlertController(title: "Choose option", message: "Proceed to delete", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { (action:UIAlertAction) in
            
            self.allAnimal.remove(at: index)
            self.collectionView?.reloadData()
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel) { (action :UIAlertAction) in
            actionSheet.dismiss(animated: true, completion: {
                
            })
        })
        self.present(actionSheet, animated: true, completion: nil)
                
    }

    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if (kind == UICollectionElementKindSectionHeader) {
            let headerView:UICollectionReusableView =  collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "CollectionViewHeader", for: indexPath)
            
            return headerView
        }
        
        return UICollectionReusableView()
    }
    
    //MARK: - SEARCH

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if(!(searchBar.text?.isEmpty)!){
            //reload your data source if necessary
            self.collectionView?.reloadData()
        }
         searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if(searchText.isEmpty){
            //reload your data source if necessary
            self.collectionView?.reloadData()
        }
       else {
            allAnimal = searchText.isEmpty ? filteredData : filteredData.filter({(data: Animals) -> Bool in
                // If dataItem matches the searchText, return true to include it
               let dataString = data.name
                return dataString.range(of: searchText, options: .caseInsensitive) != nil
            })
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        return true
    }

}
