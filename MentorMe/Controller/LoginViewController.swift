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
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBAction func loginPressed(_ sender: AnyObject)
    {
        if self.emailField.text == "" || self.passwordField.text == ""
        {
            let alertController = UIAlertController(title: "Oops!", message: "Please enter email and password", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
        }
        else
        {
            FIRAuth.auth()?.signIn(withEmail: self.emailField.text!, password: self.passwordField.text!, completion: { (user, error) in
                if error == nil
                {
                    self.usernameLabel.text = user!.displayName
                    self.passwordField.text = ""
                    self.emailField.text = ""
                }
                else
                {
                    let alertController = UIAlertController(title: "Oops!", message: error?.localizedDescription, preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
                }
            })
        }
    }
    @IBAction func createAccountPressed(_ sender: AnyObject)
    {
        if self.emailField.text == "" || self.passwordField.text == ""
        {
            let alertController = UIAlertController(title: "Oops!", message: "Please enter email and password", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
        }
        else
        {
            FIRAuth.auth()?.createUser(withEmail: self.emailField.text!, password: self.passwordField.text!, completion: { (user, error) in
                if error == nil
                {
                    self.usernameLabel.text = user!.displayName
                    self.passwordField.text = ""
                    self.emailField.text = ""
                }
                else
                {
                    let alertController = UIAlertController(title: "Oops!", message: error?.localizedDescription, preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
 
                }
            })
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
