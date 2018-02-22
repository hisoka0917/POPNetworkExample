//
//  Request+Params.swift
//  POPNetworkExample
//
//  Created by Hisoka0917 on 2018/2/22.
//  Copyright © 2018年 github. All rights reserved.
//

import Foundation

extension Request {
    var queryPath: String {
        switch self.method {
        case .GET:
            if let query = query.dictionary {
                return path.appending("?\(query.urlQueryEncode())")
            } else {
                return path
            }
        default:
            return path
        }
    }

    var httpBody: Data? {
        switch self.method {
        case .POST:
            switch self.contentType {
            case .Json:
                return self.query?.data
            case .Form:
                if let params = self.query.dictionary {
                    let bodyString = params.urlQueryEncode()
                    return bodyString.data(using: .utf8)!
                } else {
                    return Data()
                }
            default:
                return Data()
            }
        default:
            return Data()
        }
    }
}
