//
//  Post.swift
//  MentorMe
//
//  Created by Dylan Robson on 11/3/16.
//  Copyright © 2016 Dylan Robson. All rights reserved.
//

import Foundation

class Post
{

    let post: PostType
    let title: String
    let description: String?
    let user: String
    let date: Date
    let category: String
    let tags: String?
    
    init(post: PostType, title: String, user: String, description: String?, category: String, tags: String?)
    {
        
        self.post = post
        self.title = title
        self.description = description
        self.user = user
        self.date = Date()
        self.category = category
        self.tags = tags
        
    }
    
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
