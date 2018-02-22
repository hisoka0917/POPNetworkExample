//
//  Dictionary+URLQuery.swift
//  POPNetworkExample
//
//  Created by Hisoka0917 on 2018/2/22.
//  Copyright © 2018年 github. All rights reserved.
//

import Foundation

extension Dictionary {
    func urlQueryEncode() -> String {
        return self
            .map({ "\($0)=\($1)" })
            .joined(separator: "&")
            .addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
    }
}
