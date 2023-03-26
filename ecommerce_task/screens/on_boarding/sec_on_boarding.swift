//
//  sec_on_boarding.swift
//  ecommerce_task
//
//  Created by Mohamed Mounier on 08/03/2023.
//

import UIKit

class SecOnBoardingVC :UIViewController{
    static  let  id : String = String(describing: SecOnBoardingVC.self)
    @IBOutlet weak var signInLbl: UILabel!
    override func viewDidLoad() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.navigateToSignVC))
        signInLbl.addGestureRecognizer(tap)
    }
 
    
    @IBAction func facebookBtn(_ sender: Any) {
        print("Facebook")
    }
    @IBAction func goToSignUpBtn(_ sender: Any) {
        self.naviagte(SignUpVc.id)
    }
    @objc func navigateToSignVC(){
       
        print("navigating to sign in")
        self.naviagte(SignInVC.id)
    }
}
