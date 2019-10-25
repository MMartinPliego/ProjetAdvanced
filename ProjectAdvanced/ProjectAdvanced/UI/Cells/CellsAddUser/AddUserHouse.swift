//
//  AddUserHouse.swift
//  ProjectAdvanced
//
//  Created by Dev2 on 24/10/2019.
//  Copyright © 2019 Orum Games. All rights reserved.
//

import UIKit

class AddUserHouse: UITableViewCell {
            static let cellIdentifier = String(describing: AddUserHouse.self)
    
    @IBOutlet weak var textfieldCountry: UITextField!
    @IBOutlet weak var textfieldCity: UITextField!
    @IBOutlet weak var textfieldState: UITextField!
    @IBOutlet weak var textfieldStreet: UITextField!
    
    
    // MARK: - Lifecycle -
    override func prepareForReuse() {

    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }
}


extension AddUserHouse: UITextFieldDelegate {
    func configureCell() {
        textfieldCountry?.delegate = self
        textfieldCity?.delegate = self
        textfieldState?.delegate = self
        textfieldStreet.delegate = self
    }
}
