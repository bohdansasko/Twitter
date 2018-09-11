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
        let user3 = User(name: "Test1", username: "@test1", bioText: "The team and I are extremely excited to announce the new http://raywenderlich.com! This is the most massive change we've made to the site in the past 9 years. Includes new learning paths, curated tutorials by subject, a personalized home page, and more: ...The team and I are extremely excited to announce the new http://raywenderlich.com! This is the most massive change we've made to the site in the past 9 years. Includes new learning paths, curated tutorials by subject, a personalized home page, and more: ...", profileImage: #imageLiteral(resourceName: "ray_profile_image"))
        
        return [user1, user2, user3]
    }()
    
    override init() {
        super.init()
        
        self.objects = users
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self]
    }
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [UserHeaderCell.self]
    }
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [UserFooterCell.self]
    }
}
