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
    @IBAction func sortSegmentClicked(_ sender: AnyObject)
    {
        let cell = tableView.visibleCells.first as! SortCell
    
        switch cell.sortSegment.selectedSegmentIndex
        {
        case 0:
            print("Offer")
            sortPosts(sortBy: .offer)
        case 1:
            print("Request")
            sortPosts(sortBy: .request)
        case 2:
            print("Informational")
            sortPosts(sortBy: .informational)
        default:
            break;
        }
    }

    
    lazy var baseDatabaseRef: FIRDatabaseReference! = FIRDatabase.database().reference().child("post-items")
    var posts = [Post]()
    var categoryFilter: String = "General"
    override func viewDidLoad()
    {
        tableView.rowHeight = UITableViewAutomaticDimension;
        tableView.estimatedRowHeight = 44.0;
        
        self.title = "FEED"
  
        observeDB()
       
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int
    {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if section == 0
        {
            return 1
        }
        else
        {
            return posts.count

        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if indexPath.section == 0
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SortCell", for: indexPath) as! SortCell
            
            return cell
        }
        else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            let post = posts[indexPath.row]
            cell.textLabel?.text = post.title
            cell.detailTextLabel?.text = post.category
            //cell.layer.frame.size.height = 100
            return cell

        }
       
        
        
      //  return cell
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
    
    func sortPosts(sortBy: PostType)
    {
        var sortedPosts = [Post]()
        for post in self.posts
        {
            if post.post == sortBy
            {
                sortedPosts.append(post)
                print("sortedPOSTS: \(sortedPosts)")
            }
        }
        self.posts = sortedPosts
        self.tableView.reloadData()
        //return sortedPosts
    }

}
