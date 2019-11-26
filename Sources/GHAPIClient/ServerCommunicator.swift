//
//  ServerCommunicator.swift
//  DAModule
//
//  Created by Rui Peng on 11/26/19.
//  Copyright © 2019 rayy.top. All rights reserved.
//

import Foundation
import Alamofire

public protocol IAPIClient {
    var orgsClient: IOrgsAPIClient { get }
}

class ServerCommunicator: IAPIClient {
    /// 用于数据情况的客户端
    private static let _client: Session = {
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = ServerConfig.timeoutIntervalForRequest
        config.timeoutIntervalForResource = ServerConfig.timeoutIntervalForResource
        config.httpAdditionalHeaders = ["Accept": "application/vnd.github.v3+json"]
        let manager = Session(configuration: config)
        return manager
    }()
    
    public var orgsClient: IOrgsAPIClient { _orgsClient }
    private let _orgsClient: IOrgsAPIClient = { OrgsAPIClient(client: ServerCommunicator._client) }()
}
