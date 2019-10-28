//
//  AddUserGender.swift
//  ProjectAdvanced
//
//  Created by Dev2 on 24/10/2019.
//  Copyright © 2019 Orum Games. All rights reserved.
//

import UIKit

class AddUserGender: UITableViewCell {
            static let cellIdentifier = String(describing: AddUserGender.self)
    
    @IBOutlet weak var labelGender: UILabel!
    @IBOutlet weak var genderSelected: UISegmentedControl!
    
    
    @IBAction func onGenderTypePressed(_ sender: UISegmentedControl) {
        
    }

    
    // MARK: - Lifecycle -
    override func prepareForReuse() {

    }

    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
}


extension AddUserGender: UITextFieldDelegate {
    func configureCell() {

    }
}
