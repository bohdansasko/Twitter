//
//  TweetCell.swift
//  Twitter
//
//  Created by Bogdan Sasko on 9/15/18.
//  Copyright © 2018 Bogdan Sasko. All rights reserved.
//

import LBTAComponents

class TweetCell: DatasourceCell {
    var userImage: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        image.layer.cornerRadius = 6
        image.layer.masksToBounds = true
        return image
    }()
    
    var textView: UITextView = {
        let textView = UITextView()
        textView.text = "TEXT TEXT TEXT"
        textView.isEditable = false
        textView.backgroundColor = .clear
        return textView
    }()
    
    override var datasourceItem: Any? {
        didSet {
            guard let tweet = self.datasourceItem as? Tweet else { return }
            
            let formattedString = NSMutableAttributedString()
            
            let nameAttributes = [
                NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 14)
            ]
            let nameString = NSAttributedString(string: tweet.user.name, attributes: nameAttributes)
            formattedString.append(nameString)
            
            let usernameAttributes = [
                NSAttributedStringKey.foregroundColor : UIColor(r: 130, g: 130, b: 130),
                NSAttributedStringKey.font : UIFont.systemFont(ofSize: 15)
            ]
            let usernameString = NSAttributedString(string: " " + tweet.user.username, attributes: usernameAttributes)
            formattedString.append(usernameString)

            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 4
            let range = NSMakeRange(0, formattedString.string.count)
            formattedString.addAttribute(NSAttributedStringKey.paragraphStyle, value: paragraphStyle, range: range)
            
            let textString = NSAttributedString(string: "\n" + tweet.message, attributes: [
                NSAttributedStringKey.font : UIFont.systemFont(ofSize: 15)
                ])
            formattedString.append(textString)

            textView.attributedText = formattedString
            userImage.image = tweet.user.profileImage
        }
    }
    
    override func setupViews() {
        super.setupViews()
        
        backgroundColor = .white
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        
        addSubview(userImage)
        addSubview(textView)
        
        userImage.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 4, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        
        textView.anchor(self.topAnchor, left: userImage.rightAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 0, leftConstant: 14, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
}
