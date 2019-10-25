//
//  AddUserCoordenates.swift
//  ProjectAdvanced
//
//  Created by Dev2 on 24/10/2019.
//  Copyright © 2019 Orum Games. All rights reserved.
//

import UIKit
import MapKit

class AddUserCoordenates: UITableViewCell {
                static let cellIdentifier = String(describing: AddUserCoordenates.self)
    
    @IBOutlet weak var textfieldLatitude: UITextField!
    @IBOutlet weak var textfieldLongitude: UITextField!
    @IBOutlet weak var mapView: MKMapView!
    
    
    // MARK: - Lifecycle -
    override func prepareForReuse() {

    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
        mapView.layer.cornerRadius = 10.0
    }
    
    func configureCell() {
        
    }
    
    
}
