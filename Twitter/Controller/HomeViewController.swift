//
//  HomeViewController.swift
//  Twitter
//
//  Created by Bogdan Sasko on 9/9/18.
//  Copyright © 2018 Bogdan Sasko. All rights reserved.
//

import LBTAComponents


class HomeViewController: DatasourceController {
    private var messageErrorLabel: UILabel = {
        let label = UILabel()
        label.text = "Something went wrong. We can't recognize what happens. Please, try again a little bit later..."
        label.isHidden = true
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(messageErrorLabel)
        messageErrorLabel.anchor(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 20, bottomConstant: 0, rightConstant: 20, widthConstant: 0, heightConstant: 0)
        
        self.collectionView?.backgroundColor = UIColor(r: 232, g: 236, b: 241)
        setupNavigationBar()
        
        loadData()
    }
    
    private func loadData() {
        APIController.shared.loadData(urlType: .TwitterHome) {
            (incomingusersDataSource, error) in
            if let _ = error {
                self.messageErrorLabel.isHidden = false
                print("We got an error.")
                return
            }
            
            if let datasource = incomingusersDataSource {
                self.datasource = datasource
            }
        }
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        collectionViewLayout.invalidateLayout()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.section {
        case 0:
            guard let user = self.datasource?.item(indexPath) as? User else { return CGSize(width: self.view.frame.width, height: 100)}
            let estimatedTextHeight = getEstimatedTextHeight(user.bioText) + 66
            return CGSize(width: self.view.frame.width, height: estimatedTextHeight)
        case 1:
            guard let tweet = self.datasource?.item(indexPath) as? Tweet else { return CGSize(width: self.view.frame.width, height: 100)}
            let estimatedTextHeight = getEstimatedTextHeight(tweet.message) + 74
            return CGSize(width: self.view.frame.width, height: estimatedTextHeight)
        default:
            return CGSize.zero
        }
    }
    
    private func getEstimatedTextHeight(_ text: String) -> CGFloat {
        let maxStringSize = CGSize(width: self.view.frame.width - 12 - 50 - 12 - 4, height: 1000)
        let attributes = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 15)]
        let estimatedTextSize = NSString(string: text).boundingRect(with: maxStringSize, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
        return estimatedTextSize.size.height
    }
}

extension HomeViewController {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        switch section {
        case 0: return CGSize(width: self.view.frame.width, height: 50)
        case 1: return CGSize.zero
        default: return CGSize.zero
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        switch section {
        case 0: return CGSize(width: self.view.frame.width, height: 64)
        case 1: return CGSize.zero
        default: return CGSize.zero
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
