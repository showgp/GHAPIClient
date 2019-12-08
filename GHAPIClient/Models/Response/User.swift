//
//  User.swift
//  GHAPIClient
//
//  Created by Rui Peng on 12/6/19.
//  Copyright © 2019 rayy.top. All rights reserved.
//

import Foundation

public struct User: Codable {
    public let id: Int?
    public let login: String?
    public let avatarURL: String?
    public let gravatarID: String?
    public let type: String?
    public let name: String?
    public let company: String?
    public let blog: String?
    public let location: String?
    public let email: String?
    public let numberOfPublicRepos: Int?
    public let numberOfPublicGists: Int?
    public let numberOfPrivateRepos: Int?

    enum CodingKeys: String, CodingKey {
        case id
        case login
        case avatarURL = "avatar_url"
        case gravatarID = "gravatar_id"
        case type
        case name
        case company
        case blog
        case location
        case email
        case numberOfPublicRepos = "public_repos"
        case numberOfPublicGists = "public_gists"
        case numberOfPrivateRepos = "total_private_repos"
    }
}
