//
//  Cells.swift
//  Twitter
//
//  Created by Bogdan Sasko on 9/9/18.
//  Copyright © 2018 Bogdan Sasko. All rights reserved.
//

import LBTAComponents

extension UIColor {
    static let twitterBlueColor = UIColor(r: 61, g: 167, b: 244)
}

class UserHeaderCell : DatasourceCell {
    var titleLabel : UILabel = {
        let label = UILabel()
        label.text = "WHO TO FOLLOW"
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(titleLabel)
        titleLabel.anchor(self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 0, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
}

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

class UserCell : DatasourceCell {
    override var datasourceItem: Any? {
        didSet {
            usernameLabel.text = datasourceItem as? String
        }
    }
    var usernameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    var hashTagLabel: UILabel = {
        let label = UILabel()
        label.text = "@Vinso"
        label.textColor = UIColor(r: 130, g: 130, b: 130)
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    var bioTextView: UITextView = {
        let textView = UITextView()
        textView.text = "iPhone, iPad, iOS Programming Community. Join us to learn Swift, Objective-C and build iOS apps!"
        textView.font = UIFont.systemFont(ofSize: 14)
        textView.backgroundColor = .clear
        return textView
    }()
    
    var userImage: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        image.image = #imageLiteral(resourceName: "profile_image")
        image.layer.cornerRadius = 6
        image.layer.masksToBounds = true
        return image
    }()
    
    var followBtn: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 5
        button.layer.borderColor = UIColor.twitterBlueColor.cgColor
        button.layer.borderWidth = 1.0
        button.setTitle("Follow", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.twitterBlueColor, for: .normal)
        button.setImage(#imageLiteral(resourceName: "follow"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -8, bottom: 0, right: 0)
        return button
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
        
        hashTagLabel.anchor(usernameLabel.bottomAnchor, left: usernameLabel.leftAnchor, bottom: nil, right: usernameLabel.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 20)
        
        bioTextView.anchor(hashTagLabel.bottomAnchor, left: hashTagLabel.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: -4, leftConstant: -4, bottomConstant: 0, rightConstant: 12, widthConstant: 0, heightConstant: 0)
        
        followBtn.anchor(userImage.topAnchor, left: nil, bottom: nil, right: self.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 12, widthConstant: 120, heightConstant: 34)
    }
    
}
