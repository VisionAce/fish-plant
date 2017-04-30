//
//  FansViewcontroller.swift
//  Fish-plant
//
//  Created by 褚宣德 on 2017/4/30.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit

class FansViewcontroller:UIViewController{
    
    @IBOutlet var fanswebview: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fanswebview.loadRequest(URLRequest(url: URL(string: "https://www.facebook.com/%E9%AD%9A%E8%8F%9C%E5%85%B1%E7%94%9F%E6%B8%AC%E8%A9%A6%E7%94%A8%E8%A8%8E%E8%AB%96%E5%8D%80-796317383855978/")!))
    }
    
}

