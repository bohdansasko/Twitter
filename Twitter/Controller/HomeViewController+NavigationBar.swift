//
//  HomeViewController+NavigationBar.swift
//  Twitter
//
//  Created by Bogdan Sasko on 9/15/18.
//  Copyright © 2018 Bogdan Sasko. All rights reserved.
//

import UIKit

extension HomeViewController {
    func setupNavigationBar() {
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.isTranslucent = false
        
        setupLeftNavigationBarItems()
        setupTitleNavigationBar()
        setupRightNavigationBarItems()
    }
    
    private func setupLeftNavigationBarItems() {
        let titleView = UIImageView(image: #imageLiteral(resourceName: "title_icon"))
        titleView.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        titleView.contentMode = .scaleAspectFit
        navigationItem.titleView = titleView
    }
    
    private func setupTitleNavigationBar() {
        let followButton = UIButton(type: .system)
        followButton.setImage(#imageLiteral(resourceName: "follow").withRenderingMode(.alwaysOriginal), for: .normal)
        followButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: followButton)
    }
    
    private func setupRightNavigationBarItems() {
        let searchButton = UIButton(type: .system)
        searchButton.setImage(#imageLiteral(resourceName: "search").withRenderingMode(.alwaysOriginal), for: .normal)
        searchButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        let searchBarButtonItem = UIBarButtonItem(customView: searchButton)
        
        let composeButton = UIButton(type: .system)
        composeButton.setImage(#imageLiteral(resourceName: "compose").withRenderingMode(.alwaysOriginal), for: .normal)
        composeButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        let composeBarButtonItem = UIBarButtonItem(customView: composeButton)
        
        navigationItem.rightBarButtonItems = [composeBarButtonItem, searchBarButtonItem]
    }
}
