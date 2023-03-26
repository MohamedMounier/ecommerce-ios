//
//  home_view.swift
//  ecommerce_task
//
//  Created by Mohamed Mounier on 19/03/2023.
//

import UIKit
class HomeVC : UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UITableViewDelegate,UITableViewDataSource{
    
    var chosenId : Int?
    @IBOutlet weak var catNameLBL: UILabel!
    static var id :String = String(describing: HomeVC.self)
    @IBOutlet weak var categoryCV: UICollectionView!
    @IBOutlet weak var testLbl: UILabel!
    @IBOutlet weak var imageTest: UIImageView!
    let homeViewModel = HomeViewModel()
    var categories:[CategoryDataModel] = []
    @IBOutlet weak var productsCV: UITableView!
    var categoryProducts:[ProductDataModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeViewModel.getProductsByCategory(categoryId: self.chosenId ?? 46, complition: {productsList ,error in
            print("list of products\(productsList?.data)")
            self.categoryProducts = (productsList?.data?.data!)!
            self.productsCV.reloadData()
            
        })
//        let tap = UITapGestureRecognizer(target: self, action: #selector(fetchProductsByCategory))
//        categoryCV.isUserInteractionEnabled = true
//        
//        categoryCV.addGestureRecognizer(tap)
        
        homeViewModel.getCategories(complition:
                                        {categoriesList ,error in
            print("list of categories\(categoriesList?.data)")
            self.categories = (categoriesList?.data?.data!)!
            self.categoryCV.reloadData()
            
        })
        
        
        
        //  registerCell(in: categoryCV)
        
        categoryCV.delegate = self
        categoryCV.dataSource = self
        productsCV.delegate = self
        productsCV.dataSource = self
        
    }
    
    @objc func fetchProductsByCategory(){
        homeViewModel.getProductsByCategory(categoryId: self.chosenId ?? 46, complition: {productsList ,error in
            print("list of products\(productsList?.data)")
            self.categoryProducts = (productsList?.data?.data!)!
            self.productsCV.reloadData()
            
        })
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionCell.id, for: indexPath) as! MyCollectionCell
        cell.setUp(categoryModel:self.categories[indexPath.row] )
        return cell
        
    }
    func registerCell(in collectionView :UICollectionView){
        let nib = UINib( nibName: MyCollectionCell.id, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: MyCollectionCell.id)
        
    }
    
    func productsCollectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.categoryProducts.count
    }
    
    //    func productsCollectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    //        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductsCell.id, for: indexPath) as! ProductsCell
    //        cell.setUp(product:self.categoryProducts[indexPath.row] )
    //        return cell
    //
    //    }
    func productsRegisterCell(in collectionView :UICollectionView){
        let nib = UINib( nibName: ProductsCell.id, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: ProductsCell.id)
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.categoryProducts.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductsCell.id, for: indexPath) as! ProductsCell
        cell.setUp(product:self.categoryProducts[indexPath.row] )
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("selected category name is \(categories[indexPath.row].name)")
        self.chosenId = categories[indexPath.row].id
        fetchProductsByCategory()
        
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: ProductVC.id) as! ProductVC
        
        vc.product = categoryProducts[indexPath.row]
        
        navigationController?.pushViewController(vc, animated: true)    }
    
}
