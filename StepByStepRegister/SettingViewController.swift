//
//  SettingViewController.swift
//  Fish-plant
//
//  Created by 褚宣德 on 2017/5/1.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit
class SettingViewController:UIViewController{
        @IBOutlet weak var logoutB: UIButton!
    override func viewDidLoad(){
    

    }
    
    @IBAction func logoutA(_ sender: Any) {
        
                tool.goToPage(withIdentifier: "LogInViewControllerID", currentViewController: self)
        
    }

}
