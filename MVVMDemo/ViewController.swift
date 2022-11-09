//
//  ViewController.swift
//  MVVMDemo
//
//  Created by Capgemini-DA078 on 07/11/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var UITableView: UITableView!
    
    private var employeeViewModel : EmployeesViewModel!
    
    private var dataSource : EmployeeTableViewDataSource<EmployeeTableViewCell,EmployeeData>!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        callToViewModelForUpdate()
    }
    func callToViewModelForUpdate() {
        self.employeeViewModel = EmployeesViewModel()
        self.employeeViewModel.bindEmployeeViewModelToController = {
            self.updateDataSource()
        }
    }
    
    func updateDataSource(){
        self.dataSource = EmployeeTableViewDataSource(cellIdentifier: "EmployeeTableViewCell", items: self.employeeViewModel.empData.data, configureCell: { (cell,evm) in
            cell.employeeIdLabel.text = evm.id
            cell.employeeNameLabel.text = evm.employeeName
        })
        
        DispatchQueue.main.async {
            self.UITableView.dataSource = self.dataSource
            self.UITableView.reloadData()
        
        }
    }


}

