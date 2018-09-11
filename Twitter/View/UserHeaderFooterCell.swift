//
//  Cells.swift
//  Twitter
//
//  Created by Bogdan Sasko on 9/9/18.
//  Copyright © 2018 Bogdan Sasko. All rights reserved.
//

import LBTAComponents

//
// @MARK: UserHeaderCell
//
class UserHeaderCell : DatasourceCell {
    var titleLabel : UILabel = {
        let label = UILabel()
        label.text = "WHO TO FOLLOW"
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        
        addSubview(titleLabel)
        titleLabel.anchor(self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 0, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
}

//
// @MARK: UserFooterCell
//
class UserFooterCell : DatasourceCell {
    var textLabel : UILabel = {
        let label = UILabel()
        label.text = "Show me more"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .twitterBlueColor
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(textLabel)
        textLabel.anchor(self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 0, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
}
