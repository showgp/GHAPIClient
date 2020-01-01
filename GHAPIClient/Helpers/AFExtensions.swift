//
//  AFExtensions.swift
//  GHAPIClient
//
//  Created by Rui Peng on 12/10/19.
//  Copyright © 2019 rayy.top. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift

extension AFDataResponse {
    func toSingleEvent() -> SingleEvent<Success> {
        switch result {
        case let .success(value):
            return .success(value)
        case let .failure(error):
            return .error(error)
        }
    }
}

extension DataRequest {
    var gRx: Reactive<DataRequest> { return Reactive(self) }
    
    func toSingle<T>(subscribe: @escaping (@escaping (SingleEvent<T>) -> Void) -> Void) -> Single<T> {
        return Single.create { event in
            let disposable = Disposables.create()
            subscribe(event)
            return disposable
        }
    }
}

extension DataRequest {
//    func decodable<T: Decodable>() -> Single<T> {
//        return toSingle { [weak self] event in
//            self?.responseDecodable { event($0.toSingleEvent()) }
//        }
//    }
//
//    func string() -> Single<String> {
//        return toSingle { [weak self] event in
//            self?.responseString { event($0.toSingleEvent()) }
//        }
//    }
//
//    func data() -> Single<Data> {
//        return toSingle { [weak self] event in
//            self?.responseData { event($0.toSingleEvent()) }
//        }
//    }
//
//    func json() -> Single<Any> {
//        return toSingle { [weak self] event in
//            self?.responseJSON { event($0.toSingleEvent()) }
//        }
//    }
}

extension Reactive where Base == DataRequest {
    func decodable<T: Decodable>() -> Single<T> {
        return base.toSingle { [weak base] event in
            base?.responseDecodable { event($0.toSingleEvent()) }
        }
    }
    
    func string() -> Single<String> {
        return base.toSingle { [weak base] event in
            base?.responseString { event($0.toSingleEvent()) }
        }
    }
    
    func data() -> Single<Data> {
        return base.toSingle { [weak base] event in
            base?.responseData { event($0.toSingleEvent()) }
        }
    }
    
    func json() -> Single<Any> {
        return base.toSingle { [weak base] event in
            base?.responseJSON { event($0.toSingleEvent()) }
        }
    }
}
