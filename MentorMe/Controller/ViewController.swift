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
    
    let postType = PostType.offer
    var postTitle: String = ""
    var postDesc: String = ""
    var postTags: String = ""
    
    
    
    @IBOutlet weak var titleInput: UITextField!
    @IBOutlet weak var descInput: UITextField!
    @IBOutlet weak var userInput: UITextField!
    @IBOutlet weak var tagsInput: UITextField!
    
    @IBAction func titleDidInput(_ sender: AnyObject)
    {
        postTitle = titleInput.text!
        print(postTitle)
    }
    
    @IBAction func descDidInput(_ sender: AnyObject)
    {
        postDesc = descInput.text!
        print(postDesc)
    }
    
    @IBAction func tagsDidInput(_ sender: AnyObject)
    {
        postTags = tagsInput.text!
        print(postTags)
    }
    
    @IBAction func postButton(_ sender: AnyObject)
    {
        let newPost = Post(post: postType, title: postTitle, user: "drob8896", description: postDesc, category: "General", tags: postTags)
       
        let postRef = self.baseDatabaseRef.childByAutoId()
        
        postRef.setValue(newPost.toAny())

    }
    
    var baseDatabaseRef: FIRDatabaseReference!
    var posts = [Post]()
    
    override func viewDidLoad()
    {
      
        super.viewDidLoad()
        baseDatabaseRef = FIRDatabase.database().reference().child("post-items")
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    
    }
}

