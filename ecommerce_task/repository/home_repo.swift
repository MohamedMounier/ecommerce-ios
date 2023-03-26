//
//  home_repo.swift
//  ecommerce_task
//
//  Created by Mohamed Mounier on 19/03/2023.
//

import Foundation
import Alamofire

class HomeRepo {
    func getUsers(complition:@escaping(([UserDataModel]?,_ error:AFError?)->Void)){
        
        AF.request("https://jsonplaceholder.typicode.com/users", method: .get).responseDecodable(of: [UserDataModel].self){res in
            
            switch res.result{
            case .success(let res):
                print("done")
                complition(res,nil)
            case .failure(let error):
                print("error \(error)")
                complition(nil,error)
            }
            
        }
        
    }
    func register(registerModel: RegisterModel,completion:@escaping((UserLogin?,_ error:AFError?)->Void))->DataRequest {
        return AF.request(API.register,method: .post , parameters: registerModel.toMap()).responseDecodable(of: UserLogin.self){result  in
            
            if result.response?.statusCode == 200{
                switch result.result{
                   
                case .success(let user):
                    if user.data != nil{
//                        print("Registered  status in success \(user.status!)")
//                        print("user toke: \(user.data!.token!)")
//                        print("Registered   is \(user.message ?? "nope")")

                    }else{
                        print("no user data returned and message is \(user.message ?? "nope")")
                        print(" in status  no data \(user.status!)")
                    }
                    completion(user,nil)
                case .failure(let error):
                    print(error.localizedDescription)
                    completion(nil,error)
                }
            }else {
                
            }
        }
    }
    
    
    func login(email: String, password: String,completion: @escaping((UserLogin?),_ error:AFError?)->Void)->DataRequest {
        
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
//                        print("logged in status in success \(user.status!)")
//                        print("user toke: \(user.data!.token!)")
//                        print("Logged in  is \(user.message ?? "nope")")
                        
                    }else{
                        print("no user data returned and message is \(user.message ?? "nope")")
                        print("logged in status  no data \(user.status!)")
                        

                    }
                    completion(user,nil)
                    
                case .failure(let error):
                   // print(error.localizedDescription)
                    completion(nil,error)

                }
            }else{
               // print("else \(result.response!.statusCode)")
                return
            }
        }
         
            
    }
    
    func getCategories(complition:@escaping((CategoryModel?,_ error:AFError?)->Void))->DataRequest {
        return AF.request(API.categories,method: .get).responseDecodable(of: CategoryModel.self){ res in
            switch res.result{
            case .success(let res):
                print("done")
                complition(res,nil)
            case .failure(let error):
                print("error \(error)")
                complition(nil,error)
            }
            
        }

    }
    func getCategoryProductsById(categoryId:Int,complition:@escaping((ProductModel?,_ error:AFError?)->Void))->DataRequest {
        return AF.request(API.categoriesProducts(categoryId: categoryId),method: .get).responseDecodable(of: ProductModel.self){ res in
            switch res.result{
            case .success(let res):
                print("done")
                complition(res,nil)
            case .failure(let error):
                print("error \(error)")
                complition(nil,error)
            }
            
        }

    }

    
}
