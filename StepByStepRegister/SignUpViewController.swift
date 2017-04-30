//
//  ViewController.swift
//  StepByStepRegister
//
//  Created by Mac on 2017/2/2.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class SignUpViewController: UIViewController {
    
    
    @IBOutlet weak var Name: UITextField!
    @IBOutlet weak var Gender: UITextField!
    @IBOutlet weak var Email: UITextField!
    @IBOutlet weak var Phone: UITextField!
    
    var uid = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 這裡即是 uid 所解釋的，將Firebase使用者uid儲存愛變數uid裡面，在viewDidLoad中取用一次，便可在這個viewController隨意使用
        if let user = FIRAuth.auth()?.currentUser{
            uid = user.uid
        }

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
        @IBOutlet weak var Confirm_Button_Tapped: UIButton!
    
    // 這是前往LogInViewController的按鈕，但在到下一個ViewController之前，先「確認註冊資料填寫完畢」
    @IBAction func Confirm_Button_Tapped(_ sender: Any) {
        // 在四個 Text Field 中都要輸入東西，接著把所有在手機上輸入的資訊，在Firebase中setvalue，就即時更新到 Firebase 了！
        if Name.text != "" && Gender.text != "" && Email.text != "" && Phone.text != ""{
            FIRDatabase.database().reference(withPath: "ID/\(self.uid)/Profile/Name").setValue(Name.text)
            FIRDatabase.database().reference(withPath: "ID/\(self.uid)/Profile/Gender").setValue(Gender.text)
            FIRDatabase.database().reference(withPath: "ID/\(self.uid)/Profile/Email").setValue(Email.text)
            FIRDatabase.database().reference(withPath: "ID/\(self.uid)/Profile/Phone").setValue(Phone.text)
            
            //跳回登入頁
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let nextVC = storyboard.instantiateViewController(withIdentifier: "LogInViewControllerID")as! LogInViewController
            self.present(nextVC,animated:true,completion:nil)
        }
        else{
            let abc = Tool()
            abc.alertMsg(viewController: self, alertTitle: "警告", alertMessage: "無法接受空欄位")
        }
        
    }

}

