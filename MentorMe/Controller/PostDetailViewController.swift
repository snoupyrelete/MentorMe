//
//  PostDetailViewController.swift
//  MentorMe
//
//  Created by Dylan Robson on 11/15/16.
//  Copyright © 2016 Dylan Robson. All rights reserved.
//

import Foundation
import UIKit

class PostDetailViewController: UIViewController
{
    //var post = Post(post: .none, title: "", user: "", description: "")
    var post = Post(post: .none, title: "", user: "", description: "", category: "", tags: "")
    @IBOutlet weak var descriptionText: UILabel!
    @IBOutlet weak var titleText: UILabel!
    
    override func viewDidLoad()
    {
        descriptionText.text = post.description
        
        
        titleText.text = " \(post.title)\n \(post.date)\n \(post.post) in \(post.category), as: \(post.tags)"
    }
}
