//
//  Profile.swift
//  MentorMe
//
//  Created by Dylan Robson on 11/10/16.
//  Copyright © 2016 Dylan Robson. All rights reserved.
//

import Foundation

class Profile
{
    var bio: String
    var score: Int
    var username = User()
    
    init()
    {
        self.bio = "Sample Bio: LAB TECHNICIAN-- Highly skilled lab technologist with experience serving ER, Urgent Care, Pediatric ER, and Stab-Room Trauma Unit.  Processed cultures in microbiology, gram stains, urinalysis and various manual tests.PHLEMBOTOMY-- Inpatient and outpatient, pre-op and post-op, blood draws.  Recognized for exceptional skill in serving hard-to-draw patients and children.INSTRUMENT MAINTENANCE-- Skilled in troubleshooting and maintenance of technical equipment.TEACHING-- Responsible for training staff on equipment operation and procedures.QUALITY CONTROL—Maintained high quality standards with an emphasis on accuracy. Maximized performance through organization, equipment testing, and procedures development."
        self.score = username.mentorScore
    }
    
    
}
