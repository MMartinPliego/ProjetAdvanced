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
    }
    
    var user: User? = nil
    
    func configureViewDetail() {
        
    }
}

    // MARK: - Extension TableView methods
extension UserDetailViewController: UITableViewDataSource, UITableViewDelegate {
    /// Configure tableView with default options
    func configure(tableView: UITableView) {
       
        //Poner botón separado de la tabla para que no tape el contenido de la parte inferior
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Aquí hacer el case para que entre en la celda correspondiente
        
        switch indexPath.section {
        case 0:
            return PersonalDataTableViewCell()
        case 1:
            return MapTableViewCell()
        case 2:
            return CountryTableViewCell()
        default:
            return ContactDataTableViewCell()
        }
        
    }

    
}
