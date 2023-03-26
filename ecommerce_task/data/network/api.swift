//
//  api.swift
//  ecommerce_task
//
//  Created by Mohamed Mounier on 19/03/2023.
//

import Foundation
import Alamofire

class APIHelper {
    
    static var shared = APIHelper()
    
    
    
    private init(){
        
    }
    
    func request<T:Decodable>(base_url:String, enpoint:String, method:HTTPMethod, params:[String:String]? = nil, headers:HTTPHeaders? = nil,model:T?,complition:@escaping(_ response:Any?)->Void){
        
        let fullURL = base_url + enpoint
        
        AF.request(fullURL, method: method, parameters: params, headers: headers).responseDecodable(of: model as! T.Type){res in
            
            switch res.result{
            case .success(let res):
                print("done")
                complition(res)
            case .failure(let error):
                print("error \(error)")
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
