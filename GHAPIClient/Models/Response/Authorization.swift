//
//  Authorization.swift
//  GHAPIClient
//
//  Created by Rui Peng on 12/8/19.
//  Copyright © 2019 rayy.top. All rights reserved.
//

import Foundation
import Foundation

public struct Authorization: Codable {
    public let id: Int?
    public let url: String?
    public let app: Application?
    public let createdAt, updatedAt: String?
    public let scopes: [String]?

    enum CodingKeys: String, CodingKey {
        case id, url, app
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case scopes
    }
}
