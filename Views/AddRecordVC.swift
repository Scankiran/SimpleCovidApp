//
//  AddRecordVC.swift
//  FurkanIbili_HW3
//
//  Created by Mac on 25.05.2020.
//  Copyright © 2020 Furkan İbili. All rights reserved.
//

import UIKit

class AddRecordVC: UIViewController {

    @IBOutlet var nameField: UITextField!
    @IBOutlet var surnameField: UITextField!
    @IBOutlet var midtermField: UITextField!
    @IBOutlet var finalField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let blankTap = UITapGestureRecognizer.init(target: self, action: #selector(blankTapped))
        self.view.addGestureRecognizer(blankTap)
        
        
    }
    

    
    @IBAction func saveButton(_ sender: Any) {
        //CheckFields for empty or not
        if GeneralFunctions.checkFields([nameField,surnameField,midtermField,finalField], view: self) {
            
            //Convert and validate double grades
            let midterm = GeneralFunctions.convertToDouble(text: midtermField.text!)
            let final = GeneralFunctions.convertToDouble(text: finalField.text!)
            
            DataFunctions.run.saveData(nameField.text!, surnameField.text!, midterm, final)
            
            //Go back
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
    
    
    
    @objc func blankTapped() {
        self.view.endEditing(true)
    }
    
}
