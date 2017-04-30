//
//  ChangeDataViewController.swift
//  StepByStepRegister
//
//  Created by Mac on 2017/2/3.
//  Copyright © 2017年 Mac. All rights reserved.


import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class ChangeDataViewController: UIViewController {
    
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var gender: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var phone: UITextField!
    
    var uid = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 這裡即是 uid 所解釋的，將Firebase使用者uid儲存愛變數uid裡面，在viewDidLoad中取用一次，便可在這個viewController隨意使用
        if let user = FIRAuth.auth()?.currentUser {
            uid = user.uid
        }
        
        // 設立變數，把路徑儲存在var
        var ref: FIRDatabaseReference!
        
        // 接下來這些與 ConfirmViewController 裡面的 viewDetail 一樣，從Firebase拿取資料，這次是在viewDidLoad先做這個動作
        // 也就是在這個頁面還未跑起來時就已經從Firebase抓取資料，並顯示在 Text Field 裡面，但方式是一模一樣的
        ref = FIRDatabase.database().reference(withPath: "ID/\(self.uid)/Profile/Name")
        ref.observe(.value, with: { (snapshot) in
            let name = snapshot.value as! String
            self.name.text = name
        })
        
        ref = FIRDatabase.database().reference(withPath: "ID/\(self.uid)/Profile/Gender")
        ref.observe(.value, with: { (snapshot) in
            let gender = snapshot.value as! String
            self.gender.text = gender
        })
        
        ref = FIRDatabase.database().reference(withPath: "ID/\(self.uid)/Profile/Email")
        ref.observe(.value, with: { (snapshot) in
            let email = snapshot.value as! String
            self.email.text = email
        })
        
        ref = FIRDatabase.database().reference(withPath: "ID/\(self.uid)/Profile/Phone")
        ref.observe(.value, with: { (snapshot) in
            let phone = snapshot.value as! String
            self.phone.text = phone
        })

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 前往ConfirmViewController，先儲存資料到Firebase，再行前往ConfirmVC檢視資料是不是即時改變了
    @IBAction func save(_ sender: Any) {
        
        // 首先確認所有 Text Field 裡面都有東西，再來就是老方法，setValue到Firebase就好囉！
        if name.text != "" && gender.text != "" && email.text != "" && phone.text != "" {
            FIRDatabase.database().reference(withPath: "ID/\(self.uid)/Profile/Name").setValue(name.text)
            FIRDatabase.database().reference(withPath: "ID/\(self.uid)/Profile/Gender").setValue(gender.text)
            FIRDatabase.database().reference(withPath: "ID/\(self.uid)/Profile/Email").setValue(email.text)
            FIRDatabase.database().reference(withPath: "ID/\(self.uid)/Profile/Phone").setValue(phone.text)
            
            // 前往ConfirmViewController
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let nextVC = storyboard.instantiateViewController(withIdentifier: "ConfirmViewControllerID")as! ConfirmViewController
            self.present(nextVC,animated:true,completion:nil)
        }

    }
    
}
