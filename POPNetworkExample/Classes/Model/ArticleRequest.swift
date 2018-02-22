//
//  ArticleRequest.swift
//  POPNetworkExample
//
//  Created by Hisoka0917 on 2018/2/22.
//  Copyright © 2018年 github. All rights reserved.
//

import Foundation

struct ArticleRequest: Request {
    var path: String = "api/data/iOS/20/2"
    var method: HTTPMethod = .GET
    var contentType: ContentType = .None
    var query: Query?
    typealias Response = ArticleResponse
    typealias Query = String
}
