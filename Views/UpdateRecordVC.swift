//
//  UpdateRecordVC.swift
//  FurkanIbili_HW3
//
//  Created by Mac on 25.05.2020.
//  Copyright © 2020 Furkan İbili. All rights reserved.
//

import UIKit

class UpdateRecordVC: UIViewController {
    @IBOutlet var nameField: UITextField!
    @IBOutlet var surnameField: UITextField!
    @IBOutlet var midtermField: UITextField!
    @IBOutlet var finalField: UITextField!
    
    var student:Student? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let blankTap = UITapGestureRecognizer.init(target: self, action: #selector(blankTapped))
        self.view.addGestureRecognizer(blankTap)
        
        //Fill the blank when screen loaded with student data
        nameField.text = "\(student!.name)"
        surnameField.text = "\(student!.surname)"
        midtermField.text = "\(student!.midterm)"
        finalField.text = "\(student!.final)"
        
    
    }
    
    @IBAction func updateButton(_ sender: Any) {
        //CheckFields for empty or not
        if GeneralFunctions.checkFields([nameField,surnameField,midtermField,finalField], view: self) {
            
            //Convert and validate double grades
            let midterm = GeneralFunctions.convertToDouble(text: midtermField.text!)
            let final = GeneralFunctions.convertToDouble(text: finalField.text!)
            DataFunctions.run.updateData(student!.name, nameField.text!, surnameField.text!, midterm, final)
            
            //Go back
            self.navigationController?.popToRootViewController(animated: true)
        }      
        
    }
    
    
    
    @objc func blankTapped() {
        self.view.endEditing(true)
    }
}
