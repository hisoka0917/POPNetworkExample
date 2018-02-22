//
//  Encodable+DictionaryRepresentation.swift
//  POPNetworkExample
//
//  Created by Hisoka0917 on 2018/2/22.
//  Copyright © 2018年 github. All rights reserved.
//

import Foundation

extension Encodable {
    var data: Data? {
        return try? JSONEncoder().encode(self)
    }
    var dictionary: [String: Any]? {
        if let data = data {
            if let dict = try? JSONSerialization.jsonObject(with: data) as? [String: Any] {
                return dict
            }
            return nil
        }
        return nil
    }
}
