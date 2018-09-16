//
//  TweetCell.swift
//  Twitter
//
//  Created by Bogdan Sasko on 9/15/18.
//  Copyright © 2018 Bogdan Sasko. All rights reserved.
//

import LBTAComponents

class TweetCell: DatasourceCell {
    var userImage: CachedImageView = {
        let image = CachedImageView(cornerRadius: 6, emptyImage: nil)
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
            userImage.loadImage(urlString: tweet.user.profileImageUrl)
        }
    }
    
    override func setupViews() {
        super.setupViews()
        
        backgroundColor = .white
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        
        addSubview(userImage)
        addSubview(textView)
        
        userImage.anchor(self.topAnchor, left: layoutMarginsGuide.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        
        textView.anchor(self.topAnchor, left: userImage.rightAnchor, bottom: self.bottomAnchor, right: layoutMarginsGuide.rightAnchor, topConstant: 0, leftConstant: 4, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        controlsView()
    }
    
    private func controlsView() {
        let sendMessageViewContainer = getControlContainer(image: #imageLiteral(resourceName: "send_message"))
        let likeViewContainer = getControlContainer(image: #imageLiteral(resourceName: "like"))
        let retweetViewContainer = getControlContainer(image: #imageLiteral(resourceName: "retweet"))
        let replyViewContainer = getControlContainer(image: #imageLiteral(resourceName: "reply"))

        let buttonsStackView = UIStackView(arrangedSubviews: [replyViewContainer, retweetViewContainer, likeViewContainer, sendMessageViewContainer])
        addSubview(buttonsStackView)
        buttonsStackView.axis = .horizontal
        buttonsStackView.distribution = .fillEqually
        
        buttonsStackView.anchor(nil, left: textView.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 4, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 20)
    }
    
    private func getControlContainer(image: UIImage) -> UIView {
        let viewContainer = UIView()
        
        let button = UIButton(type: .system)
        viewContainer.addSubview(button)
        button.setImage(image.withRenderingMode(.alwaysOriginal), for: .normal)
        button.anchor(viewContainer.topAnchor, left: viewContainer.leftAnchor, bottom: viewContainer.bottomAnchor, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        
        return viewContainer
    }
}









