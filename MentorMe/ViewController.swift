//
//  ViewController.swift
//  MentorMe
//
//  Created by Dylan Robson on 11/3/16.
//  Copyright © 2016 Dylan Robson. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController
{
    var baseDatabaseRef: FIRDatabaseReference!
    var posts = [Post]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
       
        let newPost = Post(post: .offer, title: "I can help with math!", user: "Mrs. Smith", description: "I taught calculus for 12 years at the high school level.", timePosted: nil, tags: ["math", "help", "calculus"])
        
        print(newPost.toString())
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    
    }
}

