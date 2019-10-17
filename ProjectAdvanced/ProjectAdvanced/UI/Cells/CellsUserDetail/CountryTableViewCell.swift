//
//  CountryTableViewCell.swift
//  ProjectAdvanced
//
//  Created by Manuel Martín on 16/10/2019.
//  Copyright © 2019 Manuel Martín. All rights reserved.
//

import UIKit

class CountryTableViewCell: UITableViewCell {
    static let cellIdentifier = String(describing: CountryTableViewCell.self)
    
        // MARK: - Outlets -
    @IBOutlet weak var mView: UIView!
    @IBOutlet weak var mLabelCountry: UILabel!
    @IBOutlet weak var mLabelCity: UILabel!
    @IBOutlet weak var mLabelStreet: UILabel!
    
        // MARK: - Lifecycle -
    override func prepareForReuse() {
        mLabelCountry.text = nil
        mLabelCity.text = nil
        mLabelStreet.text = nil
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
    func configureCell(country: String? = nil, city: String? = nil, street: String? = nil) {
        mLabelCountry.text = country
        mLabelCity.text = city
        mLabelStreet.text = street
    }
    
}
