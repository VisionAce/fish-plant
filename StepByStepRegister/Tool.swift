//
//  Tool.swift
//  Fish-plant
//
//  Created by 褚宣德 on 2017/4/30.
//  Copyright © 2017年 Mac. All rights reserved.
//

import Foundation
import UIKit

class Tool {
    
    
    //到任意頁面
    func goToPage(withIdentifier id: String, currentViewController currentVC: UIViewController) {
        DispatchQueue.main.async {
            let viewController: UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: id)
            currentVC.present(viewController, animated: true, completion: nil)
        }
    }
    
    //警示彈出視窗
    func alertMsg(viewController vc: UIViewController, alertTitle title: String, alertMessage msg: String){
        let myAlert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        myAlert.addAction(okAction)
        vc.present(myAlert, animated: true, completion: nil)
        
    }
    
}
