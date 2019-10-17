//
//  ContactDataTableViewCell.swift
//  ProjectAdvanced
//
//  Created by Manuel Martín on 16/10/2019.
//  Copyright © 2019 Manuel Martín. All rights reserved.
//

import UIKit

class ContactDataTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var mView: UIView!
    @IBOutlet weak var mPhone: UILabel!
    @IBOutlet weak var mCell: UILabel!
    @IBOutlet weak var mEmail: UILabel!
    @IBOutlet weak var mTimezone: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
