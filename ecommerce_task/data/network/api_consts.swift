//
//  api_consts.swift
//  ecommerce_task
//
//  Created by Mohamed Mounier on 10/03/2023.
//

import Foundation

class API{
    
    static let BASE_URL = "https://student.valuxapps.com/api/"
    static let CARTS_ENDPOINT = "\(BASE_URL)carts"
    static let LOGIN = "\(BASE_URL)login"
    static let register = "\(BASE_URL)register"
    static let categories = "\(BASE_URL)categories"
    static func categoriesProducts (categoryId:Int)->String{
       return "\(BASE_URL)categories/\(categoryId)"
    }
    
    static func getProductWithID(_ ID:Int) -> String{
        
        return "https://fakestoreapi.com/products/\(ID)"
        
    }
    
}
