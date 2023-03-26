//
//  home_view_models.swift
//  ecommerce_task
//
//  Created by Mohamed Mounier on 19/03/2023.
//

import Foundation
import Alamofire


class HomeViewModel{
    
    
    var homeRepo = HomeRepo()
    
    
    func getUsers(complition:@escaping(([UserDataModel]?,_ error:AFError?)->Void)){
        homeRepo.getUsers { UserDataModel, error in
            complition(UserDataModel,error)
        }

    }
    
    func register(registerModel: RegisterModel,complition:@escaping((UserLogin?,_ error:AFError?)->Void)){
        homeRepo.register(registerModel: registerModel, completion: complition )   }
    
    func login(email: String , password: String,complition:@escaping((UserLogin?,_ error:AFError?)->Void)){
        homeRepo.login(email: email, password: password, completion: complition)  }

    func getCategories(complition:@escaping((CategoryModel?,_ error:AFError?)->Void)){
        homeRepo.getCategories(complition: complition) }
    
    func getProductsByCategory(categoryId:Int,complition:@escaping((ProductModel?,_ error:AFError?)->Void)){
        homeRepo.getCategoryProductsById(categoryId: categoryId, complition: complition)}
    
    // seconde way without the repo
    func getUsers2(complition:@escaping(([UserDataModel])->Void)){
        
        AF.request("https://jsonplaceholder.typicode.com/users", method: .get).responseDecodable(of: [UserDataModel].self){res in
            
            switch res.result{
            case .success(let res):
                print("done")
                complition(res)
            case .failure(let error):
                print("error \(error)")
            }
            
        }
        
        
    }
    
    
}
