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
//import GoogleSignIn

class ProfileViewController: UIViewController, FUIAuthDelegate
{
    
    //var googleUserURL: URL = URL(string: "")
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var bioLabel: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    
    @IBAction func loginButtonPressed(_ sender: AnyObject)
    {
        let authUI = FUIAuth.init(uiWith: FIRAuth.auth()!)
        //let options = FIRApp.defaultApp()?.options
        // oauth2 clientID
        //let clientId = options?.clientID
        //let googleProvider = FUIGoogleAuth(scopes: [clientId!])
        authUI?.delegate = self
        authUI?.providers = [FUIGoogleAuth()]
        let authViewController = authUI?.authViewController()
        self.present(authViewController!, animated: true, completion: nil)
    }
    
    
    func authUI(_ authUI: FUIAuth, didSignInWith user: FIRUser?, error: Error?)
    {
        //usernameLabel.text = String(describing: user)
        if let username = FIRAuth.auth()?.currentUser?.displayName
            {
                usernameLabel.text = String(username)
                //let googleUser = GIDGoogleUser()
                //googleUser.profile.imageURL(withDimension: 200)
                //userImage.image =
                
                //let imageString = String(describing: FIRAuth.auth()?.currentUser?.photoURL)
                
                //if imageString != nil  {
                //FUIGoogleAuth.signIn(<#T##FUIGoogleAuth#>)
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
    
//    func signIn(signIn: GIDSignIn!, didSignInForUser user: GIDGoogleUser!,
//                 withError error: NSError!) {
//        if (error == nil) {
//            // Perform any operations on signed in user here.
//            print("SIGNED IN W/ GIDSIGNIN")
//           //googleUserURL = user.profile.imageURL(withDimension: 200)
//            
//            // ...
//        } else {
//            print("\(error.localizedDescription)")
//        }
//    }
}
