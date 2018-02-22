//
//  URLSessionClient.swift
//  POPNetworkExample
//
//  Created by Hisoka0917 on 2018/2/22.
//  Copyright © 2018年 github. All rights reserved.
//

import Foundation

struct URLSessionClient: Client {
    let host = "http://gank.io/"

    func fetch<R>(_ req: R, handler: @escaping (R.Response.Result?, ClientError?) -> Void) where R: Request {
        let queryPath = req.queryPath
        let url = URL(string: self.host.appending(queryPath))!
        var request = URLRequest(url: url)
        request.httpMethod = req.method.rawValue

        // HTTPBody
        if req.method == .POST {
            request.setValue(req.contentType.rawValue, forHTTPHeaderField: "Content-Type")
            request.httpBody = req.httpBody
        }

        // HeaderFields
        for (key, value) in req.headerFields {
            if let value = value as? String {
                request.setValue(value, forHTTPHeaderField: key)
            } else {
                request.setValue(String(describing: value), forHTTPHeaderField: key)
            }
        }

        let task = URLSession.shared.dataTask(with: request) { (data, response, _) in
            guard let httpResponse = response as? HTTPURLResponse else {
                handler(nil, .requestFailed)
                return
            }
            if httpResponse.statusCode == 200 {
                DispatchQueue.main.async {
                    if let data = data {
                        do {
                            let res = try R.Response.parse(data: data)
                            handler(res, nil)
                        } catch {
                            handler(nil, .jsonConversionFailure)
                        }
                    } else {
                        handler(nil, .invalidData)
                    }
                }
            } else {
                handler(nil, .responseUnsuccessful)
            }
        }
        task.resume()
    }

}
