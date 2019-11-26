//
//  File.swift
//  
//
//  Created by Rui Peng on 11/26/19.
//

import Foundation
import Alamofire

class OrgsAPIClient: IOrgsAPIClient {
    
    private var _client: Session
    
    init(client: Session) {
        _client = client
    }
    
    func getOctoKitRepos() {
        let path = apiURLOf(path: APIPath.octoRepos)
        _client.request(path).responseJSON(completionHandler: { resp in
            print(resp)
        })
    }
}
