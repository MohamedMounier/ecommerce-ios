//
//  user_data_model.swift
//  ecommerce_task
//
//  Created by Mohamed Mounier on 10/03/2023.
//

import Foundation
class UserDataModel :Decodable{
    var id : Int?
    var name : String?
    var email : String?
    var phone : String?
    var image : String?
    var token : String?
    var points : Int?
    var credit : Int?
}
