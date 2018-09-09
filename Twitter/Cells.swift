//
//  Cells.swift
//  Twitter
//
//  Created by Bogdan Sasko on 9/9/18.
//  Copyright © 2018 Bogdan Sasko. All rights reserved.
//

import LBTAComponents

class UserHeaderCell : DatasourceCell {
    override func setupViews() {
        super.setupViews()
        backgroundColor = .blue
    }
}

class UserFooterCell : DatasourceCell {
    override func setupViews() {
        super.setupViews()
        backgroundColor = .red
    }
}

class UserCell : DatasourceCell {
    override var datasourceItem: Any? {
        didSet {
            usernameLabel.text = datasourceItem as? String
        }
    }
    var usernameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.backgroundColor = .green
        return label
    }()
    
    var followBtn: UIButton = {
        let button = UIButton()
        button.backgroundColor = .cyan
        return button
    }()
    
    var hashTagLabel: UILabel = {
        let label = UILabel()
        label.text = "@Vinso"
        label.backgroundColor = .purple
        return label
    }()
    
    var bioTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .yellow
        return textView
    }()
    
    var userImage: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        image.backgroundColor = .red
        return image
    }()
    
    override func setupViews() {
        super.setupViews()

        addSubview(userImage)
        addSubview(usernameLabel)
        addSubview(followBtn)
        addSubview(hashTagLabel)
        addSubview(bioTextView)
        
        userImage.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        
        usernameLabel.anchor(userImage.topAnchor, left: userImage.rightAnchor, bottom: nil, right: followBtn.leftAnchor, topConstant: 0, leftConstant: 4, bottomConstant: 0, rightConstant: 12, widthConstant: 0, heightConstant: 20)
        
        hashTagLabel.anchor(usernameLabel.bottomAnchor, left: usernameLabel.leftAnchor, bottom: nil, right: usernameLabel.rightAnchor, topConstant: 8 , leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 20)
        
        bioTextView.anchor(hashTagLabel.bottomAnchor, left: hashTagLabel.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 12, widthConstant: 0, heightConstant: 0)
        
        followBtn.anchor(userImage.topAnchor, left: nil, bottom: nil, right: self.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 12, widthConstant: 120, heightConstant: 34)
    }
    
}
