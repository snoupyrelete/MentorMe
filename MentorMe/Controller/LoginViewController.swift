//
//  LoginViewController.swift
//  MentorMe
//
//  Created by Dylan Robson on 11/14/16.
//  Copyright © 2016 Dylan Robson. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth
import Firebase

class LoginViewController: UIViewController
{
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBAction func loginPressed(_ sender: AnyObject)
    {
    }
    @IBAction func createAccountPressed(_ sender: AnyObject)
    {
        if self.emailField.text == "" || self.passwordField.text == ""
        {
            
        }
    }
    override func viewDidLoad()
    {
        if let user = FIRAuth.auth()?.currentUser
        {
            emailField.text = user.email
        }
        else
        {
            emailField.text = ""
        }
    }
 
}
