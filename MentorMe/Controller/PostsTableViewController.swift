//
//  PostsTableViewController.swift
//  MentorMe
//
//  Created by Dylan Robson on 11/9/16.
//  Copyright © 2016 Dylan Robson. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase

class PostsTableViewController: UITableViewController
{
    @IBAction func filterButtonPressed(_ sender: AnyObject)
    {
 
    }
    lazy var baseDatabaseRef: FIRDatabaseReference! = FIRDatabase.database().reference().child("post-items")
    var posts = [Post]()
    var categoryFilter: String = "General"
    
    override func viewDidLoad()
    {
        self.title = "FEED"
        observeDB()
       
    }
    override func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return posts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let post = posts[indexPath.row]
        
        cell.textLabel?.text = post.title
        cell.detailTextLabel?.text = post.category
        
        return cell
    }
    
    func observeDB()
    {
        print("start of OBSERVE DB")
        
        baseDatabaseRef.observe(.value, with: { (snapshot:FIRDataSnapshot) in
            var newPosts = [Post]()
            
            print("count: \(snapshot.childrenCount)")
            
            for post in snapshot.children {
                let postObject = Post(snapshot: post as! FIRDataSnapshot)
                newPosts.append(postObject)
                print("POST OBJECT FROM SNAPSHOT: \(postObject)")
            }
            
            self.posts = newPosts
            
            self.tableView.reloadData()
            
        }) { (error:Error) in
            print("MY CUSTOM ERROR: \(error.localizedDescription)")
        }

    }

}
