//
//  UserViewController.swift
//  ProjectAdvanced
//
//  Created by Manuel Martín on 03/10/2019.
//  Copyright © 2019 Orum Games. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {
    
    // MARK: - Outlets -
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var segmenOptions: UISegmentedControl!
    
    @IBAction func onListTypePressed(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            tableView.isHidden = false
            collectionView.isHidden = true
            tableView.reloadData()
        default:
            tableView.isHidden = true
            collectionView.isHidden = false
            collectionView.reloadData()
        }
    }
    
    
    // MARK: - Properties
    private var cellSpacing: CGFloat = 16.0
    private var users: Array<User> = []
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure(tableView: tableView)
        configureView(collectionView: collectionView)
        loadUsers()
    }
    
    private func loadUsers(){
        // traer los usuarios de la base de datos
        DataManager.shared.usersForceUpdate() { [weak self] result in
            switch result {
            //comprobar el tipo de devolución que esperamos (let data):
            case .success(let data):
                guard let users = data as? Array<User> else {
                    return
                }
                
                self?.users = users
                switch self?.segmenOptions.selectedSegmentIndex {
                case 0:
                    self?.tableView.reloadData()
                default:
                    self?.collectionView.reloadData()
                }
                
            case .failure(let msg):
                print(msg)
                
            }
            
        }
        
    }
}

// MARK: - Extension Methods Table View -
extension UserViewController: UITableViewDataSource, UITableViewDelegate {

    /// Configure tableView with default options
    func configure(tableView: UITableView) {
        
        tableView.register(UINib(nibName: PersonTableViewCell.cellIdentifier,
                                 bundle: nil),
                           forCellReuseIdentifier:
            PersonTableViewCell.cellIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        // para añadir margen superior al TableView
        self.tableView.contentInset = UIEdgeInsets(top: segmenOptions.frame.origin.y + segmenOptions.bounds.height,
                                                   left: 0,
                                                   bottom: 0,
                                                   right: 0)
        
        //self.cellSpacing
    }
    
    //número de celdas a poner en la tableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PersonTableViewCell.cellIdentifier,
                                                       for: indexPath) as? PersonTableViewCell else {
            return UITableViewCell()
        }
        
        if (indexPath.row < users.count) {
            let user = users[indexPath.row]
            cell .configureCell(image: user.avatar,
                                name: user.name,
                                email: user.email)
        }
        
        return cell
    }
}

// MARK: - Extension Methods Collection View -
extension UserViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    /// Configure collectionView with default options
    func configureView(collectionView: UICollectionView) {
        collectionView.register(UINib(nibName: PersonCollectionViewCell.cellIdentifier,
                                 bundle: nil),
                                forCellWithReuseIdentifier:
            PersonCollectionViewCell.cellIdentifier)

        
        collectionView.dataSource = self
        collectionView.delegate = self
        // para añadir margen superior al CollectionView
        self.collectionView.contentInset = UIEdgeInsets(top: segmenOptions.frame.origin.y + segmenOptions.bounds.height,
                                                        left: 0,
                                                        bottom: 0,
                                                        right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PersonCollectionViewCell.cellIdentifier,
                                                       for: indexPath) as? PersonCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        if (indexPath.row < users.count) {
                   let user = users[indexPath.row]
                   cell .configureCell(image: user.avatar,
                                       title: user.name)
        }

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return cellSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return cellSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let size = (collectionView.frame.size.width - cellSpacing) / 2
        return CGSize(width: size,
                      height: size)
    }
}


