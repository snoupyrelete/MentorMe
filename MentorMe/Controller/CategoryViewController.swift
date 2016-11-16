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
   let categories = ["Browse All", "Groups", "🔎Search", "Favorites",  "Browse Tech", "Browse Advice", "","","","","","","","","","",""]
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return categories.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
        
        cell.categoryLabel.text = categories[indexPath.row]
        cell.layer.cornerRadius = 20
        cell.backgroundColor = UIColor.cyan
        return cell
    }

}
