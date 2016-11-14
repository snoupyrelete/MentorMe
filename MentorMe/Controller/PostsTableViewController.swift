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
            observeDB(sortedBy: .offer)
        case 1:
            print("Request")
            observeDB(sortedBy: .request)
        case 2:
            print("Informational")
            observeDB(sortedBy: .informational)
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
  
        observeDB(sortedBy: .offer)
       
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
            return cell

        }
       
        
        
      //  return cell
    }
    
    func observeDB(sortedBy: PostType)
    {
        print("start of OBSERVE DB")
        
        baseDatabaseRef.observe(.value, with: { (snapshot:FIRDataSnapshot) in
            var newPosts = [Post]()
            
            print("count: \(snapshot.childrenCount)")
            
            for post in snapshot.children {
                let postObject = Post(snapshot: post as! FIRDataSnapshot)
                print("post type:::: \(postObject.post)")
                if postObject.post == sortedBy
                {
                    newPosts.append(postObject)
                }
                print("POST OBJECT FROM SNAPSHOT: \(postObject)")
            }
            
            self.posts = newPosts
            self.tableView.reloadData()
            
        }) { (error:Error) in
            print("MY CUSTOM ERROR: \(error.localizedDescription)")
        }

    }
    
    func sortPosts(sortedByPostType: String)
    {
      //  observeDB()
        var sortedPosts = [Post]()
        for post in self.posts
        {
            if String(describing: post.post) == "request"
            {
                sortedPosts.append(post)
                print("sortedPOSTS: \(sortedPosts)")
                print("post type\(post.post)")
            }
        }
        self.posts = sortedPosts
        self.tableView.reloadData()
        //return sortedPosts
    }

}
