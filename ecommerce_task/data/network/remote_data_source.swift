//
//  remote_data_source.swift
//  ecommerce_task
//
//  Created by Mohamed Mounier on 10/03/2023.
//

import Foundation
import Alamofire



  protocol BaseRemoteDataSource {
      func login(email:String,password:String)->DataRequest
      func register(registerModel :RegisterModel)->DataRequest
}

class RemoteDataSource : BaseRemoteDataSource {
    func register(registerModel: RegisterModel)->DataRequest {
        return AF.request(API.register,method: .post , parameters: registerModel.toMap()).responseDecodable(of: UserLogin.self){result  in
            
            if result.response?.statusCode == 200{
                switch result.result{
                   
                case .success(let user):
                    if user.data != nil{
                        print("Registered  status in success \(user.status!)")
                        print("user toke: \(user.data!.token!)")
                        print("Registered   is \(user.message ?? "nope")")

                    }else{
                        print("no user data returned and message is \(user.message ?? "nope")")
                        print(" in status  no data \(user.status!)")
                    }
                    
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }else {
                
            }
        }
    }
    
    
    
    func login(email: String, password: String)->DataRequest {
        
            print("working")
        
    //        let headers:HTTPHeaders = [.authorization(UserDefaults.standard.string(forKey: "userToken")!)]
        
       return AF.request(API.LOGIN, method: .post ,
                   parameters:["email":email,
                                                        "password":password]).responseDecodable(of: UserLogin.self){
            result in
            if result.response?.statusCode == 200{
               
                switch result.result{
                   
                case .success(let user):
                    if user.data != nil{
                        print("logged in status in success \(user.status!)")
                        print("user toke: \(user.data!.token!)")
                        print("Logged in  is \(user.message ?? "nope")")

                    }else{
                        print("no user data returned and message is \(user.message ?? "nope")")
                        print("logged in status  no data \(user.status!)")
                    }
                    
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }else{
               // print("else \(result.response!.statusCode)")
                return
            }
        }
         
            
    }
    
    
}
