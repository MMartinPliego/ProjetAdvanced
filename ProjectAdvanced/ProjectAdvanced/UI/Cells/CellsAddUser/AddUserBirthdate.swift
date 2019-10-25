//
//  AddUserBirthdate.swift
//  ProjectAdvanced
//
//  Created by Dev2 on 24/10/2019.
//  Copyright © 2019 Orum Games. All rights reserved.
//

import UIKit

class AddUserBirthdate: UITableViewCell {
        static let cellIdentifier = String(describing: AddUserBirthdate.self)
    
    @IBOutlet var collectionBirthdate: [UIDatePicker]!
    @IBOutlet weak var labelBirthdate: UILabel!
    
   
    
        // MARK: - Lifecycle -
        override func prepareForReuse() {

        }

        
        override func awakeFromNib() {
            super.awakeFromNib()
        }
}

extension AddUserBirthdate: UITextFieldDelegate {
    func configureCell() {
        
    }
}
