//
//  ProfileViewController.swift
//  MentorMe
//
//  Created by Dylan Robson on 11/10/16.
//  Copyright © 2016 Dylan Robson. All rights reserved.
//

import Foundation
import UIKit

class ProfileViewController: UIViewController
{
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var bioLabel: UILabel!
    
    override func viewDidLoad()
    {
        let x = Profile()
        bioLabel.text = x.bio
        
    }
}
