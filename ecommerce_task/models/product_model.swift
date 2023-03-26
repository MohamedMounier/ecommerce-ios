//
//  product_model.swift
//  ecommerce_task
//
//  Created by Mohamed Mounier on 22/03/2023.
//

import Foundation
struct ProductModel : Decodable {
    var status:Bool?
    var message:String?
    var data:ProductDataListModel?
}

struct ProductDataListModel :Decodable{
    
    var data : [ProductDataModel]?
}
struct ProductDataModel :Decodable{
    var id : Int?
    var name : String?
    var image : String?
    var images : [String]?
    var description : String?
    var price : Double?
    var in_favorites : Bool?
    var in_cart : Bool?
    
}
