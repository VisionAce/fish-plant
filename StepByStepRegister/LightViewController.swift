//
//  LightViewController.swift
//  Fish-plant
//
//  Created by 褚宣德 on 2017/4/30.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit



class LightViewController: UIViewController {
    
    @IBOutlet weak var redlight: UILabel!
    
    @IBOutlet weak var bluelight: UILabel!
    
    @IBOutlet weak var greenlight: UILabel!
    
    @IBOutlet weak var motor1: UISwitch!
    @IBOutlet weak var motor: UILabel!
    
    
    
    @IBAction func redlight_slider(_ sender: UISlider) {
        redlight.text = String(Int(sender.value))
        
        
        if let redlightvalue = redlight.text{
            print("redlight=\(redlightvalue)")
            
        }
        
        
    }
    
    
    
    @IBAction func bluelight_slider(_ sender: UISlider) {
        bluelight.text = String(Int(sender.value))
        if let bluelightvalue = bluelight.text{
            print("bluelight=\(bluelightvalue)")
        }
        
    }
    
    
    @IBAction func greenlight_slider(_ sender: UISlider) {
        greenlight.text = String(Int(sender.value))
        
        if let greenlightvalue = greenlight.text{
            print("greenlight=\(greenlightvalue)")
            
        }
        
        
        
    }
    @IBAction func motorvalue(_ sender: UISwitch) {
        
        if motor1.isOn == true{
            motor.text="1"
        } else{
            motor.text="0"
            print("模式\(String(describing: motor.text))")
        }
    }
    

    
    @IBAction func sendbutton(_ sender: Any) {
        
        
        let request = NSMutableURLRequest(url: NSURL(string: "http://120.101.8.52/test/WebService1.asmx/controlLED")! as URL)
        request.httpMethod = "POST"
        
        let postString = "arduinoID=B0342077&light_red=\(String(describing: redlight.text!))&light_blue=\(String(describing: bluelight.text!))&light_green=\(String(describing: greenlight.text!))&motor=\(String(describing: motor.text!))&decide=0)"
        
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
            
        }
        
        task.resume()
    }
    
    
        
}
    
    


