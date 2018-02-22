//
//  Request.swift
//  POPNetworkExample
//
//  Created by Hisoka0917 on 2018/2/22.
//  Copyright © 2018年 github. All rights reserved.
//

import Foundation

enum HTTPMethod: String {
    case GET
    case POST
}

enum ContentType: String {
    case Json = "application/json"
    case Form = "application/x-www-form-urlencoded"
    case None
}

protocol Parsable {
    associatedtype Result: Decodable
    static func parse(data: Data) throws -> Result?
}

protocol Request {
    var path: String { get }
    var method: HTTPMethod { get }
    var contentType: ContentType { get }
    var query: Query? { get set }
    var headerFields: [String: Any] { get }
    var httpBody: Data? { get }

    associatedtype Response: Parsable
    associatedtype Query: Encodable
}
