//
//  APIController.swift
//  Twitter
//
//  Created by Bogdan Sasko on 9/16/18.
//  Copyright © 2018 Bogdan Sasko. All rights reserved.
//

import Foundation
import SwiftyJSON
import TRON

class RequestErrorHandler: JSONDecodable {
    required init(json: JSON) throws {
        
    }
}

enum UrlType {
    case TwitterHome
    case TwitterHomeError
    case TwitterHomeWithError
    
    func getString() -> String {
        switch self {
        case .TwitterHome:
            return "twitter/home"
        case .TwitterHomeError:
            return "twitter/home1"
        case .TwitterHomeWithError:
            return "twitter/home_with_error"

        }
    }
}

class APIController {
    static let shared = APIController()
    let tron = TRON(baseURL: "https://api.letsbuildthatapp.com")
    
    private init() {
        // do nothing
    }
    
    func loadData(urlType: UrlType, _ completionCallback: @escaping (UsersDataSource?, RequestErrorHandler?) -> ()) {
        let request: APIRequest<UsersDataSource, RequestErrorHandler> = tron.swiftyJSON.request(urlType.getString())
        request.perform(withSuccess: { (usersDataSource) in
            completionCallback(usersDataSource, nil)
        }, failure: { (error) in
            completionCallback(nil, error.errorModel)
        })
    }
}
