//
//  DataSource.swift
//  Twitter
//
//  Created by Bogdan Sasko on 9/9/18.
//  Copyright © 2018 Bogdan Sasko. All rights reserved.
//

import LBTAComponents

class UsersDataSource : Datasource {
    var users: [User] = {
        let user1 = User(name: "Sasko Bohdan", username: "@TQ0oS", bioText: "iPhone, iPad, iOS Programming Community. Join us to learn Swift, Objective-C and build iOS apps!", profileImage: #imageLiteral(resourceName: "profile_image"))
        let user2 = User(name: "Ray Wenderlich", username: "@rayw", bioText: "The team and I are extremely excited to announce the new http://raywenderlich.com! This is the most massive change we've made to the site in the past 9 years. Includes new learning paths, curated tutorials by subject, a personalized home page, and more: ...", profileImage: #imageLiteral(resourceName: "ray_profile_image"))
        let user3 = User(name: "Test1", username: "@test1", bioText: "The team and I are extremely excited to announce the new http://raywenderlich.com! This is the most massive change we've made to the site in the past 9 years. Includes new learning paths, curated tutorials by subject, a personalized home page, and more: ...The team and I are extremely excited to announce the new http://raywenderlich.com!", profileImage: #imageLiteral(resourceName: "ray_profile_image"))
        
        return [user1, user2, user3]
    }()
    
    var tweets: [Tweet] = {
        let user1 = User(name: "Sasko Bohdan", username: "@TQ0oS", bioText: "iPhone, iPad, iOS Programming Community. Join us to learn Swift, Objective-C and build iOS apps!", profileImage: #imageLiteral(resourceName: "profile_image"))
        let user2 = User(name: "Ray Wenderlich", username: "@rayw", bioText: "The team and I are extremely excited to announce the new http://raywenderlich.com! This is the most massive change we've made to the site in the past 9 years. Includes new learning paths, curated tutorials by subject, a personalized home page, and more: ...", profileImage: #imageLiteral(resourceName: "ray_profile_image"))
        
        let tweet1 = Tweet(user: user1, message: "iPhone, iPad, iOS Programming Community. Join us to learn Swift, Objective-C and build iOS apps!")
        let tweet2 = Tweet(user: user2, message: "iPhone, iPad, iOS Programming Community. Join us to learn Swift, Objective-C and build iOS apps!")
        
        return [tweet1, tweet2]
    }()
    
    override init() {
        super.init()
        
        self.objects = users
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
