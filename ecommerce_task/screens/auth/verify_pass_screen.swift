//
//  verify_pass_screen.swift
//  ecommerce_task
//
//  Created by Mohamed Mounier on 23/03/2023.
//

import UIKit
class VerifyPassVC:UIViewController {
    
    static let id : String = String(describing: VerifyPassVC.self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    @IBAction func backBtn(_ sender: Any) {
        self.pop()
    }
}
