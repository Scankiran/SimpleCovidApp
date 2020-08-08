//
//  MainVC.swift
//  FurkanIbili_HW3
//
//  Created by Mac on 25.05.2020.
//  Copyright © 2020 Furkan İbili. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    //Data
    var students:[Student] = []
    
    //To send for update screen
    var studentSent:Student? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        giveDelegateToTableView()
        
        DataFunctions.run.getData()
        students = DataFunctions.run.students
        
        tableView.reloadData()
    }
    
    

}


extension MainVC:UITableViewDelegate,UITableViewDataSource {
    
    //Register cell and give delegate to table view
    func giveDelegateToTableView() {
        self.tableView.register(UINib.init(nibName: "StudentCell", bundle: nil), forCellReuseIdentifier:  Constants.shared.cellIdentifier)
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    
    
    //Set custom tableViewCell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.shared.cellIdentifier) as! StudentCell
        let student = students[indexPath.row]
        
        cell.nameSurnameLabel.text = "\(student.name) \(student.surname)"
        cell.gradesLabel.text = "Midterm = \(student.midterm), Final = \(student.final)"
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        studentSent = students[indexPath.row]
        performSegue(withIdentifier: Constants.shared.segue, sender: self)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //Send student to update screen
        if segue.identifier == Constants.shared.segue {
            let vc = segue.destination as! UpdateRecordVC
            vc.student = self.studentSent!
        }
    }
    
}
