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
    @IBOutlet weak var saveButton: UIButton!
    
    @IBAction func buttonSave(_ sender: UIButton) {
        
    }
    
    
    private enum AddUserCellType: Int {
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
        
        configure(tableView: tableview)
    }
}


extension AddUserViewController: UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    /// Configure tableView with default options
    func configure(tableView: UITableView) {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        switch AddUserCellType(rawValue: indexPath.row) {
        case .addUserName:
            if let cell = tableView.dequeueReusableCell(withIdentifier: AddUserName.cellIdentifier, for: indexPath) as?
                AddUserName {
                cell.configureCell()
                return cell
            }
            return UITableViewCell()
            
        case .addUserData:
            if let cell = tableView.dequeueReusableCell(withIdentifier: AddUserData.cellIdentifier, for: indexPath) as?
                AddUserData {
                cell.configureCell()
                return cell
            }
            return UITableViewCell()
            
        case .addUserGender:
            if let cell = tableView.dequeueReusableCell(withIdentifier: AddUserGender.cellIdentifier, for: indexPath) as?
                AddUserGender {
                cell.configureCell()
                return cell
            }
            return UITableViewCell()
            
        case .addUserBirthdate:
            if let cell = tableView.dequeueReusableCell(withIdentifier: AddUserBirthdate.cellIdentifier, for: indexPath) as?
                AddUserBirthdate {
                cell.configureCell()
                return cell
            }
            return UITableViewCell()
            
        case .addUserNat:
         if let cell = tableView.dequeueReusableCell(withIdentifier: AddUserNat.cellIdentifier, for: indexPath) as?
             AddUserNat {
            cell.configureCell()
             return cell
         }
         return UITableViewCell()
            
        case .addUserHouse:
            if let cell = tableView.dequeueReusableCell(withIdentifier: AddUserHouse.cellIdentifier, for: indexPath) as?
                AddUserHouse {
                cell.configureCell()
                return cell
            }
            return UITableViewCell()
            
        case .addUserCoordenates:
            if let cell = tableView.dequeueReusableCell(withIdentifier: AddUserCoordenates.cellIdentifier, for: indexPath) as?
                AddUserCoordenates {
                cell.configureCell()
                return cell
            }
            return UITableViewCell()
            
            
        default:
            break
        }
        return UITableViewCell()
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var cellHeigth: CGFloat = 0
        
        switch AddUserCellType(rawValue: indexPath.row) {
            case .addUserName:
                cellHeigth = 170
                
            case .addUserData:
                cellHeigth = 115
                
            case .addUserGender:
                cellHeigth = 110
                
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
