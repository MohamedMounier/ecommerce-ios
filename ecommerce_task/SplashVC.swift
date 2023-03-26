//
//  ViewController.swift
//  ecommerce_task
//
//  Created by Mohamed Mounier on 07/03/2023.
//

import UIKit

class SplashVC: UIViewController {
     static let  id : String = String(describing: SplashVC.self)

    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+2, execute: {
            self.naviagte(OnBoardingVC.id)
        })
        // Do any additional setup after loading the view.
    }


}



