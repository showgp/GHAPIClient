//
//  Application.swift
//  GHAPIClient
//
//  Created by Rui Peng on 12/8/19.
//  Copyright © 2019 rayy.top. All rights reserved.
//

import Foundation

public struct Application: Codable {
    public let url: String?
    public let name, clientID: String?

    enum CodingKeys: String, CodingKey {
        case url, name
        case clientID = "client_id"
    }
}
