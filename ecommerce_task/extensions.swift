//
//  extensions.swift
//  taskDoctor
//
//  Created by Micheal Hany on 2/14/23.
//

import UIKit


extension UIViewController{
    
    func naviagte(_ screenID:String, _ storyBoardID:String = "Main"){
        let storyBoard = UIStoryboard(name: storyBoardID, bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: screenID)
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func pop(){
        navigationController?.popViewController(animated: true)
    }
    
    
    
}


extension UIView{
    
    @IBInspectable var cornerRadius:CGFloat{
        
        get{
            return 0
        }
        
        set{
            self.layer.cornerRadius = newValue
            
        }
        
    }
    
}



extension UITextField{
    
    @IBInspectable var underLine:Bool{
        
        set{
            
            let underLineLayer = CALayer()
            underLineLayer.frame = CGRect(x: 0, y: self.frame.height - 1, width: self.frame.width, height: 1)
            
            underLineLayer.backgroundColor = UIColor(named: "lightGrey")?.cgColor
            
            self.borderStyle = .none
            self.backgroundColor = .clear
            self.layer.addSublayer(underLineLayer)
            
        }
        
        get{
            
            return false
            
        }
        
    }
    
    
    @IBInspectable var startimage:UIImage{

        get{
            return disabledBackground!
        }

        set(value){
            let rightImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
            rightImageView.image = value
            self.rightView = rightImageView
            self.rightViewMode = .always
        }
    }
    
}

