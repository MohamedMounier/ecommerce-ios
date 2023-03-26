//
//  sign_up.swift
//  ecommerce_task
//
//  Created by Mohamed Mounier on 08/03/2023.
//

import UIKit
class SignUpVc :UIViewController {
    
    
    @IBOutlet weak var backImg: UIImageView!
    static let id:String = String(describing: SignUpVc.self)
    var baseData :BaseRemoteDataSource = RemoteDataSource()
    let  homeViewModel = HomeViewModel()
    
    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var rememberMeSwitch: UISwitch!
 
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passTF: UITextField!
    override func viewDidLoad() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.back))
        self.backImg.addGestureRecognizer(tap)
    }
    
    @objc func back(){
        self.pop()
    }
    
    
    @IBAction func signUp(_ sender: Any) {
        print("SRegistering")
//        baseData.register(registerModel: RegisterModel(name: userNameTF.text,email: emailTF.text,phone:  "01143576746", password: passTF.text))
        homeViewModel.register(registerModel:RegisterModel(name: userNameTF.text,email: emailTF.text,phone:  "01148053533630847", password: passTF.text) , complition:
                                {userLogin,_error in
            if userLogin?.status == true  {
                AppSnackBars.succ(isError: false, messageText: "Successfullt created , welcome \(userLogin?.data?.name! ?? "name")", view: self ) {
                    self.pop()
                    
                }
            }else{
                AppSnackBars.succ(isError: true, messageText: " \(userLogin!.message!)", view: self){}
            }
        print(" user loginnn\(userLogin!)")
        })
        
        
    }
    
}
