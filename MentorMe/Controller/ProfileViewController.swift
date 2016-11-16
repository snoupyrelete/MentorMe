//
//  ProfileViewController.swift
//  MentorMe
//
//  Created by Dylan Robson on 11/10/16.
//  Copyright © 2016 Dylan Robson. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuthUI
import FirebaseGoogleAuthUI
import FirebaseFacebookAuthUI

class ProfileViewController: UIViewController, FIRAuthUIDelegate
{
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var bioLabel: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    
    @IBAction func loginButtonPressed(_ sender: AnyObject)
    {
        let authUI = FIRAuthUI.init(auth: FIRAuth.auth()!)
        let options = FIRApp.defaultApp()?.options
        let clientId = options?.clientID
        authUI?.delegate = self
        authUI?.providers = [FIRGoogleAuthUI(clientID: clientId!)]
        let authViewController = authUI?.authViewController();
        self.present(authViewController!, animated: true, completion: nil)
    }
    
    
    func authUI(_ authUI: FIRAuthUI, didSignInWith user: FIRUser?, error: Error?)
    {
        //usernameLabel.text = String(describing: user)
        if let username = FIRAuth.auth()?.currentUser?.displayName
            {
                usernameLabel.text = String(username)
            }
    }

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
