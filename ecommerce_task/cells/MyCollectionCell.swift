//
//  MyCollectionCell.swift
//  Laza
//
//  Created by Ahmed on 3/19/23.
//

import UIKit
import Kingfisher

class MyCollectionCell: UICollectionViewCell {
    
    
  
    
    static let id:String = String(describing: MyCollectionCell.self)
    
    
    @IBOutlet weak var imageCategory: UIImageView!
    
    @IBOutlet weak var nameCategory: UILabel!
    func setUp(categoryModel:CategoryDataModel){
            
            self.imageCategory.kf.setImage(with: URL(string: categoryModel.image ?? "https://pics.freeicons.io/uploads/icons/png/18879031931588529849-512.png"))
       
        self.nameCategory.text = categoryModel.name
        self.categoryId = categoryModel.id

    }
    
    var categoryId:Int?
    
}
