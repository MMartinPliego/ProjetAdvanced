//
//  AddUserViewController.swift
//  ProjectAdvanced
//
//  Created by Manuel Martín on 24/10/2019.
//  Copyright © 2019 Manuel Martín. All rights reserved.
//

import UIKit

class AddUserViewController: UIViewController {
    
    
    @IBOutlet weak var tableview: UITableView!
    
    
    @IBAction func buttonSave(_ sender: UIButton) {
    }
    
    
    private enum AddUserViewController: Int {
        case addUserName = 0
        case addUserData = 1
        case addUserGender = 2
        case addUserBirthdate = 3
        case addUserNat = 4
        case addUserHouse = 5
        case addUserCoordenates = 6
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}

extension AddUserViewController: UITableViewDelegate, UITableViewDataSource {
    /// Configure tableView with default options
    func configure(tableView: UITableView) {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        UITableViewCell()
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var cellHeigth: CGFloat = 0
        
        switch AddUserViewController(rawValue: indexPath.row) {
        case .addUserName:
            cellHeigth = 170
        case .addUserData:
            cellHeigth = 115
        case .addUserGender:
            cellHeigth = 140
        case .addUserBirthdate:
            cellHeigth = 125
        case .addUserNat:
            cellHeigth = 115
        case .addUserHouse:
            cellHeigth = 135
        case .addUserCoordenates:
            cellHeigth = 365
            
        default:
            cellHeigth = 250
        }
        return cellHeigth
    }
    
}
