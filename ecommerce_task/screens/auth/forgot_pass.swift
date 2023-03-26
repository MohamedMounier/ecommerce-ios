//
//  forgot_pass.swift
//  ecommerce_task
//
//  Created by Mohamed Mounier on 23/03/2023.
//

import UIKit

class ForgotPassVC :UIViewController {
    static let id : String = String(describing: ForgotPassVC.self)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func navToConfirm(_ sender: Any) {
        self.naviagte(VerifyPassVC.id)
    }
    @IBAction func backBtn(_ sender: Any) {
        self.pop()
    }
}
