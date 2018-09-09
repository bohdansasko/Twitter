//
//  DataSource.swift
//  Twitter
//
//  Created by Bogdan Sasko on 9/9/18.
//  Copyright © 2018 Bogdan Sasko. All rights reserved.
//

import LBTAComponents

class UsersDataSource : Datasource {
    init(list: [String]) {
        super.init()
        self.objects = list
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
