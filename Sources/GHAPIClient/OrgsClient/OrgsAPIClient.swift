//
//  File.swift
//  
//
//  Created by Rui Peng on 11/26/19.
//

import Foundation
import Alamofire
import PromiseKit

class OrgsAPIClient: IOrgsAPIClient {
  
    private var _client: Session
    
    init(client: Session) {
        _client = client
    }

    func getOctoKitRepos() -> Promise<IOrgsInfo> {
        let path = apiURLOf(path: APIPath.octoRepos)
        return Promise { [weak self] seal in
            self?._client.request(path).responseData(completionHandler: { resp in
                guard let data = resp.data else { seal.resolve(.rejected(APIError.noData)); return }
            })
        }
    }
    
    func getOctoKitRepos(completion: @escaping (Result<IOrgsInfo>) -> Void) {
        let path = apiURLOf(path: APIPath.octoRepos)
        _client.request(path).responseData(completionHandler: { resp in
            guard let data = resp.data else { completion(.rejected(APIError.noData)); return }
            do {
                let info = try JSONDecoder().decode([OrgsInfoJSON].self, from: data)
                let result = OrgsInfo(
                    id: info.first?.id ?? -1,
                    name: info.first?.name ?? "",
                    createdAt: info.first?.createdAt,
                    updatedAt: info.first?.updatedAt,
                    pushedAt: info.first?.pushedAt
                )
                completion(.fulfilled(result))
            } catch {
                completion(.rejected(error))
            }
        })
    }
}
