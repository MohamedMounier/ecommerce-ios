//
//  ProductsCell.swift
//  ecommerce_task
//
//  Created by Mohamed Mounier on 22/03/2023.
//

import UIKit

class ProductsCell : UITableViewCell {
    static let id :String = String(describing: ProductsCell.self)
    
    @IBOutlet weak var productImage: UIImageView!
    
    @IBOutlet weak var productPrice: UILabel!
    
    @IBOutlet weak var productName: UILabel!
    var productId:Int?
    
    func setUp(product:ProductDataModel){
        self.productImage.kf.setImage(with: URL(string: product.image ?? "https://pics.freeicons.io/uploads/icons/png/18879031931588529849-512.png"))
        self.productName.text = " Name : \(product.name!)"
        self.productId = product.id
        self.productPrice.text = " Price : \(product.price!)"

    }
}
