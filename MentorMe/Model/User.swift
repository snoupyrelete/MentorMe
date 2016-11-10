//
//  User.swift
//  MentorMe
//
//  Created by Dylan Robson on 11/8/16.
//  Copyright © 2016 Dylan Robson. All rights reserved.
//

import Foundation
import FirebaseAuth

struct User
{
    public let username: String
    let password: String
    let friendsList: [User]
    let mentorScore: Int
    
    
    init()
    {
        username = "UNKOWN"
        password = "PASSWORD"
        friendsList = [User]()
        mentorScore = 0

    }
    init(username: String)
    {
        self.username = username
        password = "PASSWORD"
        friendsList = [User]()
        mentorScore = 0
    }
}
