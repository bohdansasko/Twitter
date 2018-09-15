//
//  User.swift
//  Twitter
//
//  Created by Bogdan Sasko on 9/12/18.
//  Copyright © 2018 Bogdan Sasko. All rights reserved.
//

import UIKit
import TRON
import SwiftyJSON

struct User: JSONDecodable  {
    let name: String
    let username: String
    let bioText: String
    let profileImageUrl: String
    
    init(json: JSON) throws {
        name = json["name"].stringValue
        username = json["username"].stringValue
        bioText = json["bio"].stringValue
        profileImageUrl = json["profileImageUrl"].stringValue
    }
}
