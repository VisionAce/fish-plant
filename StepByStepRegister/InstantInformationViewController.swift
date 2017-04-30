//
//  InstantInformationViewController.swift
//  Fish-plant
//
//  Created by 褚宣德 on 2017/4/30.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit


class InstatInformation: UIViewController {
    
    @IBOutlet weak var 溫度: UILabel!
    @IBOutlet weak var 濕度: UILabel!
    @IBOutlet weak var PH值: UILabel!
    @IBOutlet weak var 水位: UILabel!
    @IBOutlet weak var 紅: UILabel!
    @IBOutlet weak var 藍: UILabel!
    @IBOutlet weak var 綠: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        
        navigationItem.title = "接收值"
        溫度.textColor = UIColor.red
     
        濕度.textColor = UIColor.red
   
        PH值.textColor = UIColor.red
     
        水位.textColor = UIColor.red
        
        
        
        let request = NSMutableURLRequest(url: NSURL(string: "http://120.101.8.52/test/WebService1.asmx/GETsensordata")! as URL)
        request.httpMethod = "POST"
        
        let postString = "arduinoID=bin"
        
        request.httpBody = postString.data(using: String.Encoding.utf8)
        
        let task = URLSession.shared.dataTask(with: request as URLRequest)
        {data, response, error in
            
            if error != nil
            {
                print("error=\(String(describing: error))")
                return
            }
            print("response = \(String(describing: response))\n\n")
            
            let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            print("responseString = \(String(describing: responseString))\n\n")
            
            let data1 = responseString?.substring(with: NSMakeRange(218, 5))
            let data2 = responseString?.substring(with: NSMakeRange(273, 5))
            let data3 = responseString?.substring(with: NSMakeRange(328, 5))
            let data4 = responseString?.substring(with: NSMakeRange(383, 5))
            let data5 = responseString?.substring(with: NSMakeRange(438, 5))
            let data6 = responseString?.substring(with: NSMakeRange(493, 5))
            let data7 = responseString?.substring(with: NSMakeRange(548, 5))
            
            
            
            self.溫度.text = data1! as String
            self.濕度.text = data2! as String
            self.PH值.text = data3! as String
            self.水位.text = data4! as String
            self.紅.text = data5! as String
            self.藍.text = data6! as String
            self.綠.text = data7! as String
            
            
            
        }
        
        task.resume()    }
    
}
