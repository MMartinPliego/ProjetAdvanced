//
//  PersonalDataTableViewCell.swift
//  ProjectAdvanced
//
//  Created by Manuel Martín on 16/10/2019.
//  Copyright © 2019 Manuel Martín. All rights reserved.
//

import UIKit

class PersonalDataTableViewCell: UITableViewCell {
    static let cellIdentifier = String(describing: PersonalDataTableViewCell.self)

    // MARK: - Outlets -
    @IBOutlet weak var mView: UIView!
    @IBOutlet weak var mImage: UIImageView!
    @IBOutlet weak var mLabelName: UILabel!
    @IBOutlet weak var mLabelNat: UILabel!
    @IBOutlet weak var mLabelGender: UILabel!
    
    // MARK: - Lifecycle -
    override func prepareForReuse() {
        mImage.image = nil
        mLabelName.text = nil
        mLabelNat.text = nil
        mLabelGender.text = nil
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        mView.layer.cornerRadius = 8.0
        mView.configureShadows()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    //MARK: - Configure Methods
    func configureCell(image: String? = nil, name: String? = nil, nat: String? = nil, gender: String? = nil) {
        let url = URL(string: image ?? "")
        
        mImage.kf.setImage(with: url)
        mLabelName.text = name
        mLabelNat.text = nat
        mLabelGender.text = gender
    }
    
}
