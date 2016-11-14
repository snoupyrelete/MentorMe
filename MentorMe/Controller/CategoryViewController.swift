//
//  CategoryViewController.swift
//  MentorMe
//
//  Created by Dylan Robson on 11/11/16.
//  Copyright © 2016 Dylan Robson. All rights reserved.
//

import Foundation
import UIKit

class CategoryViewController: UICollectionViewController
{
   let categories = ["Browse All", "Search", "Favorites", "Groups", "Browse Tech"]
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
        
        cell.categoryLabel.text = categories[indexPath.row]
        cell.layer.cornerRadius = 30
        cell.backgroundColor = UIColor.darkGray
        return cell
    }

}
