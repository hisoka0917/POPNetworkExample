//
//  JsonResponse.swift
//  POPNetworkExample
//
//  Created by Wang Kai on 2018/3/14.
//  Copyright © 2018年 github. All rights reserved.
//

import Foundation

protocol JsonResponseProtocol: Decodable {
    var error: Bool? { get set }
    var results: [ResultsType]? { get set }

    associatedtype ResultsType: Decodable
}
