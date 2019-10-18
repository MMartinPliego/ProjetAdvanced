//
//  UserDetailViewController.swift
//  ProjectAdvanced
//
//  Created by Manuel Martín on 16/10/2019.
//  Copyright © 2019 Manuel Martín. All rights reserved.
//

import UIKit

enum UserDetailCellType: Int {
    case personal = 0
    case map
    case country
    case contact
}

class UserDetailViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func onActionPressed (_ sender:UIButton)  {
    }
    
    
    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure(tableView: tableView)
    }
    
    var user: User? = nil
    
    func configureViewDetail() {
        
    }
}

    // MARK: - Extension TableView methods
extension UserDetailViewController: UITableViewDataSource, UITableViewDelegate {
    /// Configure tableView with default options
    func configure(tableView: UITableView) {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Aquí hacer el case para que entre en la celda correspondiente
        
        switch indexPath.row {
        case 0:
            if let cell = tableView.dequeueReusableCell(withIdentifier: PersonalDataTableViewCell.cellIdentifier, for: indexPath) as? PersonalDataTableViewCell {
                cell.configureCell(image: user?.avatar, name: user?.firstName, nat: user?.nationality, gender: user?.gender)
                return cell
            }
            return UITableViewCell()
            
        case 1:
            if let cell = tableView.dequeueReusableCell(withIdentifier: MapTableViewCell.cellIdentifier, for: indexPath) as? MapTableViewCell {
                return cell
                
            }
            return UITableViewCell()
            
        case 2:
            if let cell = tableView.dequeueReusableCell(withIdentifier: CountryTableViewCell.cellIdentifier, for: indexPath) as? CountryTableViewCell {
                cell.configureCell(country: user?.country, city: user?.city, street: user?.streetName)
                return cell
            }
            return UITableViewCell()
            
        default:
            if let cell = tableView.dequeueReusableCell(withIdentifier: ContactDataTableViewCell.cellIdentifier, for: indexPath) as? ContactDataTableViewCell {
                cell.configureCell(phone: user?.phone, cell: user?.cell, email: user?.email, timezone: user?.timezone)
                return cell
            }
            return UITableViewCell()
        }
        
    }
    
}
