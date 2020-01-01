//
//  GHAPIClient.swift
//  GHAPIClient
//
//  Created by Rui Peng on 12/6/19.
//  Copyright © 2019 rayy.top. All rights reserved.
//

import Alamofire

public protocol IGHAPIClient {
    var session: Session { get }
    var authorization: IAuthorizationsClient { get }
}

public class GHAPIClient: IGHAPIClient {
    public var session: Session
    
    public var authorization: IAuthorizationsClient

    public init(_ sessionConfig: URLSessionConfiguration? = nil) {
        if let sessionConfig = sessionConfig {
            let config = sessionConfig
            config.headers.add(.accept(gitHubV3Header))
            session = Session(configuration: config)
        } else {
            session = Session.default
        }
        authorization = AuthorizationsClient(connection: APIConnection(session: session))
    }
}
