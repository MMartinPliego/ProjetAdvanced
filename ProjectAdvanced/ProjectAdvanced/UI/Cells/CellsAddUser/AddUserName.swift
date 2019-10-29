//
//  AddUserName.swift
//  ProjectAdvanced
//
//  Created by Dev2 on 24/10/2019.
//  Copyright © 2019 Orum Games. All rights reserved.
//


import UIKit

class AddUserName: UITableViewCell {
    static let cellIdentifier = String(describing: AddUserName.self)
    
    @IBOutlet weak var viewImageSelector: UIView!
    @IBOutlet weak var imageUserName: UIImageView!
    @IBOutlet weak var textfieldFirstName: UITextField!
    @IBOutlet weak var textfieldLastName: UITextField!
        
    // MARK: - Lifecycle -
    override func prepareForReuse() {
        textfieldFirstName.text = nil
        textfieldLastName.text = nil
        imageUserName.image = nil
    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageUserName.layer.cornerRadius = 6.0
        
        let tapGesture = UITapGestureRecognizer(target: self,
                                                action: #selector(onImageTap))
        imageUserName.addGestureRecognizer(tapGesture)
    }
    
    @objc func onImageTap() {
        
    }
    

}


extension AddUserName: UITextFieldDelegate {
    func configureCell() {
        textfieldFirstName?.delegate = self
        textfieldLastName?.delegate = self
    }
}
