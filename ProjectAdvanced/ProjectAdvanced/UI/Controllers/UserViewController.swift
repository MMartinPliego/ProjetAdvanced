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
    
    
    // MARK: - Properties
    private var cellSpacing: CGFloat = 16.0
    private var users: Array<User> = []
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadUsers()
    }
    
    private func loadUsers(){
        // traer los usuarios de la base de datos
        DataManager.shared.users() { [weak self] result in
            switch result {
            //comprobar el tipo de devolución que esperamos (let data):
            case .success(let data):
                guard let users = data as? Array<User> else {
                    return
                }
                self?.users = users
                
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
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PersonTableViewCell.cellIdentifier,
                                                       for: indexPath) as? PersonTableViewCell else {
            return UITableViewCell()
        }
        
        return cell
    }
}

// MARK: - Extension Methods Collection View -
extension UserViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    /// Configure collectionView with default options
    func configureView(collectionView: UICollectionView) {
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PersonCollectionViewCell.cellIdentifier,
                                                       for: indexPath) as? PersonCollectionViewCell else {
            return UICollectionViewCell()
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


