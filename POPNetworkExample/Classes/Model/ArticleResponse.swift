//
//  ArticleResponse.swift
//  POPNetworkExample
//
//  Created by Hisoka0917 on 2018/2/22.
//  Copyright © 2018年 github. All rights reserved.
//

import Foundation

struct ArticleModel: Codable {
    var _id: String
    var createdAt: String
    var desc: String
    var publishedAt: String
    var images: [String]?
    var source: String
    var type: String
    var url: String
    var used: Bool
    var who: String?
}

struct ArticleResponseModel: Codable, JsonResponseProtocol {
    var error: Bool?
    var results: [ResultsType]?

    typealias ResultsType = ArticleModel
}

struct ArticleResponse: Parsable {
    typealias Result = ArticleResponseModel
}
