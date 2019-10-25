//
//  AddUserData.swift
//  ProjectAdvanced
//
//  Created by Dev2 on 24/10/2019.
//  Copyright © 2019 Orum Games. All rights reserved.
//


import UIKit

class AddUserData: UITableViewCell {
        static let cellIdentifier = String(describing: AddUserData.self)

    @IBOutlet weak var textfieldEmail: UITextField!
    @IBOutlet weak var textfieldCell: UITextField!
    @IBOutlet weak var textfieldPhone: UITextField!
    
    
    // MARK: - Lifecycle -
    override func prepareForReuse() {

    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

}

extension AddUserData: UITextFieldDelegate {
    func configureCell() {
        textfieldEmail?.delegate = self
        textfieldCell?.delegate = self
        textfieldPhone?.delegate = self
    }
}
