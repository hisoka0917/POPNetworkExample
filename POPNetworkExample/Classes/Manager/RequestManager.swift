//
//  RequestManager.swift
//  POPNetworkExample
//
//  Created by Hisoka0917 on 2018/2/22.
//  Copyright © 2018年 github. All rights reserved.
//

import Foundation

class RequestManager {
    static func fetch<R>(_ request: R,
                         handler: @escaping (FetchResult<R.Response.Result, ClientError>) -> Void) where R: Request {
        URLSessionClient().fetch(request) { (result, error) in
            if let result = result {
                handler(FetchResult.success(result))
            } else {
                handler(FetchResult.failure(.jsonParsingFailure))
            }
        }
    }
}
