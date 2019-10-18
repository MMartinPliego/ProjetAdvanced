//
//  ContactDataTableViewCell.swift
//  ProjectAdvanced
//
//  Created by Manuel Martín on 16/10/2019.
//  Copyright © 2019 Manuel Martín. All rights reserved.
//

import UIKit

class ContactDataTableViewCell: UITableViewCell {
    static let cellIdentifier = String(describing: ContactDataTableViewCell.self)
    
    
    @IBOutlet weak var mView: UIView!
    @IBOutlet weak var mPhone: UILabel!
    @IBOutlet weak var mCell: UILabel!
    @IBOutlet weak var mEmail: UILabel!
    @IBOutlet weak var mTimezone: UILabel!
    
    override func prepareForReuse() {
        mPhone.text = nil
        mCell.text = nil
        mEmail.text = nil
        mTimezone.text = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(phone: String? = nil, cell: String? = nil, email: String? = nil, timezone: String? = nil) {
        mPhone.text = phone
        mCell.text = cell
        mEmail.text = email
        mTimezone.text = timezone
    }
}
