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
    enum PostType
    {
        case request
        case offer
    }
    
    let post: PostType
    let title: String
    let description: String?
    let user: String
    let timePosted: Date?
    let tags: [String?]
    
    init(post: PostType, title: String, user: String, description: String?, timePosted: Date?, tags: [String?])
    {
        self.post = post
        self.title = title
        self.description = description
        self.user = user
        self.timePosted = timePosted
        self.tags = tags
    }
    
    func toString() -> String
    {
        
        let postDesc = "The post is of \(self.post) type, titled: \(self.title), with the description: \(self.description), posted by the user: \(self.user), on the date/time: \(self.timePosted). It is tagged as: \(self.tags)"
        return postDesc
    }
}
