//
//  category_model.swift
//  ecommerce_task
//
//  Created by Mohamed Mounier on 20/03/2023.
//

import Foundation
struct CategoryModel : Decodable {
    var status:Bool?
    var message:String?
    var data:CategoryDataListModel?
}

struct CategoryDataListModel :Decodable{
    
    var data : [CategoryDataModel]?
}
struct CategoryDataModel :Decodable{
    var id : Int?
    var name : String?
    var image : String?
}
