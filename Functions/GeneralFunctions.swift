//
//  CreateAlert.swift
//  FurkanIbili_HW3
//
//  Created by Mac on 25.05.2020.
//  Copyright © 2020 Furkan İbili. All rights reserved.
//

import Foundation
import UIKit
class GeneralFunctions {
    
    /**
     Create alert for warning
     - Parameters:
        - title -- Alert title
        - message -- Alert Message
        - style -- Alert style (actionSheet or Alert)
        - actions -- action array to add to alert
     */
    static func createAlert(_ title:String, _ message:String, _ style:UIAlertController.Style, _ actions:[UIAlertAction]) -> UIAlertController {
        let alert = UIAlertController.init(title: title, message: message, preferredStyle: style)
        
        for action in actions{
            alert.addAction(action)
        }
        
        return alert
    }
    
    
    /**
     Check sent fields for empty or not. If there is a empty field, present alert to view.
     - Parameters:
        - fields -- UITextFields array to checks
        - view -- UIViewController to (if neccessary) present alert
     
     -Return:
        - Bool -- ıf empties is empty return true for contiue to next process in view
     */
    static func checkFields(_ fields:[UITextField], view:UIViewController) -> Bool {
        for field in fields {
            if field.text!.isEmpty {
                let action = UIAlertAction.init(title: "Close", style: .cancel, handler: nil)
                view.present(GeneralFunctions.createAlert("Error", "Inout(s) cannot be empty", .alert, [action]), animated: true)
                
                return false
            }
        }
        return true
    }
    
    /**
     This functions convert string to double. Created because in decimal keyboard, you have add double value with comma (,). And double value not allowed comma.
     - Parameters:
        - text -- to convert double
     - Return:
            Double Value
     */
    static func convertToDouble(text:String) -> Double {
        return Double(text.replacingOccurrences(of: ",", with: "."))!
    }
}
