//
//  sign_in.swift
//  ecommerce_task
//
//  Created by Mohamed Mounier on 08/03/2023.
//

import UIKit
import Alamofire
class SignInVC :UIViewController {
    static let id:String = String(describing: SignInVC.self)

    @IBOutlet weak var backImg: UIImageView!
    var baseData :BaseRemoteDataSource = RemoteDataSource()
    let homeViewModel = HomeViewModel()
    @IBOutlet weak var emailTF: UITextField!
    
    @IBOutlet weak var forgotPassLbl: UILabel!
    @IBOutlet weak var passTF: UITextField!
    override func viewDidLoad() {
        let forgotTap = UITapGestureRecognizer(target: self, action: #selector(navToForgot))
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.backFunc))
        forgotPassLbl.addGestureRecognizer(forgotTap)
        backImg.addGestureRecognizer(tap)
        homeViewModel.getCategories(complition:
                                        {categoriesList ,error in
            print("list of categories\(categoriesList?.data)")
            
            
        })
    }
    @objc func navToForgot(){
        self.naviagte(ForgotPassVC.id)
    }
    
    @objc func backFunc(){
        self.pop()
    }
    
    
    func login(){
        print("email is \(emailTF.text!)")
        print("pass is \(passTF.text!)")

    
//        var result = self.baseData.login(email: self.emailTF.text!, password: self.passTF.text!)
//        if(result.response?.statusCode==200&&result.data != nil){
//            print("finally Logged in ")
//        }else{
//            print("couldn't log in")
//        }
        
        
        homeViewModel.login(email: emailTF.text!, password: passTF.text!, complition: {
            userLogin,_error in

print(" user loginnn\(userLogin!)")
            if userLogin?.status == true  {
                AppSnackBars.succ(isError: false, messageText: "Successfullt Logged in  , welcome \(userLogin?.data?.name! ?? "name")", view: self ) {
                    

                }
                self.naviagte(HomeVC.id)

            }else{
                AppSnackBars.succ(isError: true, messageText: " \(userLogin!.message!)", view: self){}
            }
        })
        
       
       
        
        
    }
    
    @IBAction func signInBtn(_ sender: Any) {
        print("Logging ...")
        self.login()
    }
    
}
