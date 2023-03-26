//
//  register_model.swift
//  ecommerce_task
//
//  Created by Mohamed Mounier on 12/03/2023.
//

import Foundation

class RegisterModel {
    var name :String?
    var email :String?
    var phone :String?
    var password :String?
    
    init(name: String? = nil, email: String? = nil, phone: String? = nil, password: String? = nil) {
        self.name = name
        self.email = email
        self.phone = phone
        self.password = password
    }
    
   func toMap()->Dictionary<String,Any>{
       return [
        "email":self.email!,
        "password":self.password!,
        "phone":self.phone!,
        "name":self.name!,
       ]
    }
}
