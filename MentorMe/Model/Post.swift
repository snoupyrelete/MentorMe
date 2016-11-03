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
    let user: String
    let description: String
    let timePosted: Date
    
    init(post: PostType, title: String, user: String, description: String, timePosted: Date)
    {
        self.post = post
        self.title = title
        self.user = user
        self.description = description
        self.timePosted = timePosted
    }
}
