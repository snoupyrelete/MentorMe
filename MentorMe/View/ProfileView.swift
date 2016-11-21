//
//  ProfileView.swift
//  MentorMe
//
//  Created by Dylan Robson on 11/16/16.
//  Copyright © 2016 Dylan Robson. All rights reserved.
//

import Foundation
import UIKit

class ProfileView: UIView
{
    @IBOutlet var view: UIView!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var bio: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        Bundle.main.loadNibNamed("ProfileView", owner: self, options: nil)?[0] as! UIView
        self.addSubview(view)
        view.frame = self.bounds
        name.text = "xib"
    }
}
