//
//  Tweet.swift
//  Twitter
//
//  Created by Bogdan Sasko on 9/15/18.
//  Copyright © 2018 Bogdan Sasko. All rights reserved.
//

import Foundation
import UIKit.UIImage
import TRON
import SwiftyJSON

struct Tweet: JSONDecodable {
    let user: User
    let message: String
    
    init(json: JSON) throws {
        self.user = try User(json: json["user"])
        self.message = json["message"].stringValue
    }
}
