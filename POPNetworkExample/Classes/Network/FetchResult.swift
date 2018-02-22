//
//  FetchResult.swift
//  POPNetworkExample
//
//  Created by Hisoka0917 on 2018/2/22.
//  Copyright © 2018年 github. All rights reserved.
//

import Foundation

enum FetchResult<T, U> where U: Error {
    case success(T)
    case failure(U)
}
