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
        self.title = "Profile"
        //self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(messageButtonTapped))
    }
    
    func messageButtonTapped()
    {
        print("Message")
    }
}
