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
    case general
    
}

func toString() -> String
{
    return String(describing: PostType.self)
}
