//
//  DataFunctions.swift
//  FurkanIbili_HW3
//
//  Created by Mac on 25.05.2020.
//  Copyright © 2020 Furkan İbili. All rights reserved.
//

import Foundation
import UIKit
import CoreData
class DataFunctions {
    //For singleton structure
    static let run = DataFunctions()
    var students:[Student] = []
    
    /**
     Get data from coreData 'Students' entity.
     */
    func getData() {
        self.students.removeAll()
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
               return
            }
            
            let managedContext =
              appDelegate.persistentContainer.viewContext
            
            //2
            let fetchRequest =
              NSFetchRequest<NSManagedObject>(entityName: "Students")
            
            //3
            do {
              let data = try managedContext.fetch(fetchRequest)
                for object in data {
                    let name = object.value(forKey: "name") as! String
                    let surname = object.value(forKey: "surname") as! String
                    let midterm = object.value(forKey: "midterm") as! Double
                    let final = object.value(forKey: "final") as! Double
                    
                    self.students.append(Student.init(name: name, surname: surname, midterm: midterm, final: final))
                }
                
            } catch let error as NSError {
              print("Could not save. \(error), \(error.userInfo)")
            }
        
        }
    
    
    /**
     This function save new student to coredata entity.
     - Parameters:
        - name -- Student name
        - surname -- Student surname
        - midterm -- Student Midterm Grade
        - final -- Student final Grade
     */
    func saveData( _ name:String, _ surname:String, _ midterm:Double, _ final:Double) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
          }
          
          // 1
          let managedContext =
            appDelegate.persistentContainer.viewContext
          
          // 2
          let entity =
            NSEntityDescription.entity(forEntityName: "Students",
                                       in: managedContext)!
          
          let entry = NSManagedObject(entity: entity,
                                       insertInto: managedContext)
          
          // 3
            let data:[String:Any] = ["name":name,"surname":surname,"midterm":midterm,"final":final]
            
            entry.setValuesForKeys(data)
          // 4
          do {
            try managedContext.save()
            
          } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
          }
        
    }
    
    
    /**
    This function save new student to coredata entity.
    - Parameters:
     - StudentNameForFilter -- Student name for filter coreData objects
       - name -- Student name
       - surname -- Student surname
       - midterm -- Student Midterm Grade
       - final -- Student final Grade
    */
    func updateData(_ stdName:String, _ name:String, _ surname:String, _ midterm:Double, _ final:Double) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
           return
        }
        
        let managedContext =
          appDelegate.persistentContainer.viewContext
        
        //2
        let fetchRequest =
          NSFetchRequest<NSManagedObject>(entityName: "Students")
        
        //3
        do {
          let data = try managedContext.fetch(fetchRequest)
            
            //Parse data to model.
            for object in data {
                let objectName = object.value(forKey: "name") as! String
                if objectName == stdName {
                    object.setValue(name, forKey: "name")
                    object.setValue(surname, forKey: "surname")
                    object.setValue(midterm, forKey: "midterm")
                    object.setValue(final, forKey: "final")
                }
            }
            
            try managedContext.save()
            
            
        } catch let error as NSError {
          print("Could not save. \(error), \(error.userInfo)")
        }
    }
}
