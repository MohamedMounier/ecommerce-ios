//
//  products_screen.swift
//  ecommerce_task
//
//  Created by Mohamed Mounier on 23/03/2023.
//

import UIKit
class ProductVC:UIViewController {
    
    static let id : String = String(describing: ProductVC.self)
    
    
    
    @IBOutlet weak var productImg: UIImageView!
    var product : ProductDataModel?
    
    @IBOutlet weak var productNameLbl: UILabel!
    
    @IBOutlet weak var productPriceLbL: UILabel!
    
    @IBOutlet weak var productDecriptionLbl: UILabel!
    
    @IBOutlet weak var productTotalPriceLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("current product name is \(product!.name!)")
        setupUi()
    }
    
   func setupUi(){
        self.productImg.kf.setImage(with: URL(string: (self.product?.image)!))
       productNameLbl.text = product?.name
       productPriceLbL.text = "\(product!.price!) $"
       productDecriptionLbl.text = product?.description
       productTotalPriceLbl.text = "\((product?.price)! + 27) $"


       
    }
    
    @IBAction func backFunc(_ sender: Any) {
        self.pop()
    }
}
