//
//  on_boarding.swift
//  ecommerce_task
//
//  Created by Mohamed Mounier on 07/03/2023.
//

import UIKit

class OnBoardingVC : UIViewController{
  static  let  id : String = String(describing: OnBoardingVC.self)

    @IBOutlet weak var skipLbl: UILabel!
    @IBOutlet weak var subtitle: UILabel!
    
    @IBOutlet weak var skipButton: UIButton!
    @IBOutlet weak var womenButton: UIButton!
    @IBOutlet weak var menButton: UIButton!
    //@IBOutlet weak var womenButton: UIButton!
    //@IBOutlet weak var menButton: UIButton!
    override func viewDidLoad() {
        skipLbl.isUserInteractionEnabled=true
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.skipFunc(_:)))
        
        skipLbl.addGestureRecognizer(tap)
        
//
//        skipButton.isUserInteractionEnabled=true
//        subtitle.adjustsFontSizeToFitWidth=true
//        subtitle.numberOfLines=2
//        let tab = UITapGestureRecognizer(target: self, action: #selector(self.tryWomen))
//
//        tab.numberOfTapsRequired=1
        
            // womenButton.addGestureRecognizer(tab)
        //menButton.isUserInteractionEnabled=true
     //   womenButton.isUserInteractionEnabled=true
        
//        let tab = UITapGestureRecognizer(target: self, action: #selector self.womenBtnAction)
//        womenButton.addGestureRecognizer(tab)
    
        
    }
    
    @IBAction func skipBtn(_ sender: Any) {
        self.naviagte(SplashVC.id)
        print("Skip now")
    }
    @objc func tryWomen(){
        print("women try pressed")

    }
    @IBAction func womenBtnAction(_ sender : Any) {
       print("women pressed")
        
        womenButton.backgroundColor=AppColors.selectedBtnColor
        menButton.backgroundColor=AppColors.greyButtonColor
        womenButton.titleLabel?.textColor=AppColors.whiteColor
        menButton.titleLabel?.textColor=AppColors.subtitleColor
    }
    
    @objc func skipFunc(_ sender:UITapGestureRecognizer){
        self.naviagte(SecOnBoardingVC.id)

    }
    @IBAction func menBtnAction(_ sender: Any) {
        menButton.backgroundColor=AppColors.selectedBtnColor
        womenButton.backgroundColor=AppColors.greyButtonColor
        menButton.titleLabel?.textColor=AppColors.whiteColor
        womenButton.titleLabel?
            .textColor=AppColors.subtitleColor
        self.naviagte(SplashVC.id)

        print("men pressed")

    }
    
    
}
