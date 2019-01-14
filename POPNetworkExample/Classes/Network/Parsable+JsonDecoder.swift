//
//  Parsable+JsonDecoder.swift
//  POPNetworkExample
//
//  Created by Wang Kai on 2018/3/14.
//  Copyright © 2018年 github. All rights reserved.
//

import Foundation

extension Parsable {
    static func parse(data: Data) throws -> Result? {
        do {
            let responseJson = try JSONDecoder().decode(Result.self, from: data)
            return responseJson
        } catch {
            throw ClientError.jsonParsingFailure
        }
    }
}
