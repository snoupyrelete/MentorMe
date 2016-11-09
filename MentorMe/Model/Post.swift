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
    let tags: [String?]
   
    init(post: PostType, title: String, user: String, description: String?, tags: [String?])
    {
        
        self.post = post
        self.title = title
        self.description = description
        self.user = user
        self.date = Date()
        self.tags = tags
    }
    
    func toString() -> String
    {
        let postDesc = "The post is of \(self.post) type, titled: \(self.title), with the description: \(self.description), posted by the user: \(self.user), on the date/time: \(self.date). It is tagged as: \(self.tags)"
        return postDesc
    }
    
    func toAny() -> NSDictionary
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yy h:mm a Z"
        let formattedDate = dateFormatter.string(from: self.date)
        
        return ["title":self.title, "description":self.description!, "user": self.user, "date": formattedDate] as NSDictionary
    }
}
