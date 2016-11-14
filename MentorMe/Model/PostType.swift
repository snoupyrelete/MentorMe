//
//  PostType.swift
//  MentorMe
//
//  Created by Dylan Robson on 11/9/16.
//  Copyright © 2016 Dylan Robson. All rights reserved.
//

import Foundation

enum PostType
{
    case request
    case offer
    case informational
    case none
  
    func toString() -> String
    {
        return String(describing: PostType.self)
    }
    init(fromString: String)
    {
        switch fromString {
        case "offer": self = .offer
        case "request": self = .request
        case "informational": self = .informational
        default: self = .none
            
        }
    }
}



