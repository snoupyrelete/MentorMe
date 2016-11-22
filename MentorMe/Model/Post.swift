//
//  Post.swift
//  MentorMe
//
//  Created by Dylan Robson on 11/3/16.
//  Copyright © 2016 Dylan Robson. All rights reserved.
//

import Foundation
import FirebaseDatabase

class Post
{

    let post: PostType
    let title: String
    let description: String?
    let user: String
    let date: Date
    let category: String
    let tags: String?
    
   // let key:String!
    //let itemRef:FIRDatabaseReference?

    
    init(post: PostType, title: String, user: String, description: String?, category: String = "General", tags: String? = "")
    {
        
        self.post = post
        self.title = title
        self.description = description
        self.user = user
        self.date = Date()
        self.category = category
        self.tags = tags
        
    }
    
    init (snapshot:FIRDataSnapshot)
    {
        //key = snapshot.key
        //itemRef = snapshot.ref
        let postDict = snapshot.value as? [String : AnyObject] ?? [:]
        
        
       // self.post = postDict["post"]
        //let x = PostType(fromString: (postDict["post"] as! NSString))
        let aa = postDict["postType"] as! String
        print("string descin dict post: \(aa)")
        
        self.post = PostType(fromString: postDict["postType"] as! String)
        self.title = postDict["title"] as! String
        self.description = postDict["description"] as? String
        self.user = postDict["user"] as! String
        //self.date = postDict["date"] as! Date
        self.date = Date()
        self.category = postDict["category"] as! String
        self.tags = postDict["tags"] as? String
    }
    //tags not being downloaded properly possibly due to it being as a snapshot?

    
    func toString() -> String
    {
        let postDesc = "The post is of \(self.post) type, titled: \(self.title), with the description: \(self.description), posted by the user: \(self.user), on the date/time: \(self.date). It is in the category: \(self.category) and tagged as: \(self.tags)"
        return postDesc
    }
    
    func toAny() -> NSDictionary
    {
        let tagsList = getSeperatedTags()
      
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yy h:mm a Z"
        let formattedDate = dateFormatter.string(from: self.date)
        
        return ["postType":String(describing: self.post),"title":self.title, "description":self.description!, "user": self.user, "date": formattedDate,"category":self.category, "tags": tagsList] as NSDictionary
    }
    
    func getSeperatedTags() -> NSArray
    {
        var seperatedTags: [String]
        
        let currentTags = self.tags?.replacingOccurrences(of: " ", with: "")
        seperatedTags = currentTags!.characters.split(separator: ",")
            .map(String.init)
        return seperatedTags as NSArray
        
    }

}
