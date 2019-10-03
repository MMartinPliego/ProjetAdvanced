//
//  PersonViewCell.swift
//  ProjectAdvanced
//
//  Created by PersonTableViewCell.swift on 03/10/2019.
//  Copyright © 2019 Orum Games. All rights reserved.
//

import UIKit


class PersonTableViewCell: UITableViewCell {
     static let cellIdentifier = String(describing: PersonTableViewCell.self)
    
        // MARK: - Outlets -
    @IBOutlet weak var mView: UIView!
    @IBOutlet weak var mImage: UIImageView!
    @IBOutlet weak var mLabelName: UILabel!
    @IBOutlet weak var mLabelEmail: UILabel!
    
        // MARK: - Lifecycle -
    override func prepareForReuse() {
        mImage.image = nil
        mLabelName.text = nil
        mLabelEmail.text = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        mView.layer.cornerRadius = 6.0
        mView.configureShadows()
    }
    
        // MARK: - Configure methods -
    func configureCell(image: String? = nil, name: String? = nil, email: String? = nil) {
        mImage.image = UIImage(named: image ?? "")
        mLabelName.text = name
        mLabelEmail.text = email
    }
}


