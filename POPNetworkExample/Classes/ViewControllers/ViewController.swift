//
//  ViewController.swift
//  POPNetworkExample
//
//  Created by Hisoka0917 on 2018/2/22.
//  Copyright © 2018年 github. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        RequestManager.fetch(ArticleRequest()) { (result) in
            switch result {
            case .success(let model):
                if let error = model.error {
                    if !error {
                        if let articles = model.results {
                            print(articles)
                        } else {
                            print("Empty content")
                        }
                    } else {
                        print("Server internal error")
                    }
                } else {
                    print("Parse error")
                }
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
