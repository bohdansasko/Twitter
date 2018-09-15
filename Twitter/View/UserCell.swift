//
//  UserCell.swift
//  Twitter
//
//  Created by Bogdan Sasko on 9/12/18.
//  Copyright © 2018 Bogdan Sasko. All rights reserved.
//

import LBTAComponents

class UserCell : DatasourceCell {
    override var datasourceItem: Any? {
        didSet {
            guard let user = datasourceItem as? User else { return }
            usernameLabel.text = user.name
            hashTagLabel.text = user.username
            bioTextView.text = user.bioText
            userImage.loadImage(urlString: user.profileImageUrl)
        }
    }
    
    var usernameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    var hashTagLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(r: 130, g: 130, b: 130)
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    var bioTextView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 15)
        textView.backgroundColor = .clear
        textView.isEditable = false
        return textView
    }()
    
    var userImage: CachedImageView = {
        let image = CachedImageView(cornerRadius: 6)
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
        
        backgroundColor = .white
        
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        
        addSubview(userImage)
        addSubview(usernameLabel)
        addSubview(followBtn)
        addSubview(hashTagLabel)
        addSubview(bioTextView)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        userImage.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        
        usernameLabel.anchor(userImage.topAnchor, left: userImage.rightAnchor, bottom: nil, right: followBtn.leftAnchor, topConstant: 0, leftConstant: 4, bottomConstant: 0, rightConstant: 12, widthConstant: 0, heightConstant: 20)
        
        hashTagLabel.anchor(usernameLabel.bottomAnchor, left: usernameLabel.leftAnchor, bottom: nil, right: usernameLabel.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 20)
        
        bioTextView.anchor(hashTagLabel.bottomAnchor, left: hashTagLabel.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: -4, leftConstant: -4, bottomConstant: 0, rightConstant: 12, widthConstant: 0, heightConstant: 0)
        
        followBtn.anchor(userImage.topAnchor, left: nil, bottom: nil, right: self.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 12, widthConstant: 120, heightConstant: 34)
    }
}
