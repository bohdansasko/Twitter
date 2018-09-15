//
//  DataSource.swift
//  Twitter
//
//  Created by Bogdan Sasko on 9/9/18.
//  Copyright © 2018 Bogdan Sasko. All rights reserved.
//

import LBTAComponents
import SwiftyJSON
import TRON

extension Collection where Iterator.Element == JSON {
    func decode<T: JSONDecodable>() throws -> [T] {
        return try map({try T(json: $0)})
    }
}
class UsersDataSource : Datasource, JSONDecodable {
    var users: [User] = []
    var tweets: [Tweet] = []
    
    required init(json: JSON) throws {
        guard let usersJSONArray = json["users"].array, let tweets = json["tweets"].array else {
            throw NSError(domain: "com.letsbuildthatapp", code: 1, userInfo: [NSLocalizedDescriptionKey: "Fail to parse json"])
        }
        self.users = try usersJSONArray.decode()
        self.tweets = try tweets.decode()
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self, TweetCell.self]
    }
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [UserHeaderCell.self]
    }
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [UserFooterCell.self]
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        switch section {
        case 0: return users.count
        case 1: return tweets.count
        default: return 0
        }
    }
    
    override func numberOfSections() -> Int {
        return 2
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        switch indexPath.section {
        case 0: return users[indexPath.item]
        case 1: return tweets[indexPath.item]
        default: return nil
        }
    }
}
