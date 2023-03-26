//
//  snackbars.swift
//  ecommerce_task
//
//  Created by Mohamed Mounier on 23/03/2023.
//

import Foundation
import MaterialComponents.MaterialSnackbar
class AppSnackBars :NSObject {
    static func succ(isError:Bool,messageText:String,view:UIViewController,actionClosure : @escaping()->Void){
        let action = MDCSnackbarMessageAction()
        let actionHandler = {() in
          actionClosure()
        }
        action.handler = actionHandler
        action.title = "OK"
        var answerMessage = MDCSnackbarMessage()
        answerMessage.text = messageText
        answerMessage.action = action

        MDCSnackbarManager.default.show(answerMessage)
        MDCSnackbarManager.default.snackbarMessageViewShadowColor = isError ? UIColor.red : UIColor.green
        
    }
}
