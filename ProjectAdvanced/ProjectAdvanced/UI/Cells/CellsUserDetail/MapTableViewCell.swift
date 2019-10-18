//
//  MapTableViewCell.swift
//  ProjectAdvanced
//
//  Created by Manuel Martín on 16/10/2019.
//  Copyright © 2019 Manuel Martín. All rights reserved.
//

import UIKit
import MapKit

class MapTableViewCell: UITableViewCell {
    static let cellIdentifier = String(describing: MapTableViewCell.self)
    
    
    @IBOutlet weak var mLabelMap: UILabel!
    @IBOutlet weak var mMap: MKMapView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
