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
    
    @IBOutlet weak var mView: UIView!
    @IBOutlet weak var mMap: MKMapView!
    
    //ver la cantidad que se mostrará en el mapa
    private let regionRadius: CLLocationDistance = 800_000
    private var userLocation: CLLocation? = nil
    
    
    override func prepareForReuse() {
        userLocation = nil
        mMap.delegate = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        mMap.layer.cornerRadius = 8.0
        mView.layer.cornerRadius = 8.0
        mView.configureShadows()
    }
    
    
    func configureCell(latitude: String? = nil, longitude: String? = nil) {
        let latitude = (latitude! as NSString).doubleValue
        let longitude = (longitude! as NSString).doubleValue
        
        let initialLocation = CLLocation(latitude: latitude,
                                         longitude: longitude)
        
        centerMapOnLocation(location: initialLocation)
        addUserMark(location: initialLocation)
    }
    
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate,
                                                  latitudinalMeters: regionRadius,
                                                  longitudinalMeters: regionRadius)
        mMap.setRegion(coordinateRegion, animated: true)
    }
    
    //Poner una chincheta en el mapa
    private func addUserMark(location: CLLocation) {
        mMap.addAnnotation(UserMarkAnnotacion(tittle: "User name",
                                              locationName: "calle, ciudad",
                                              coordinate: location.coordinate))
    }

}

//Poner una chincheta en el mapa
class UserMarkAnnotacion: NSObject, MKAnnotation {
    let title: String?
    let locationName: String?
    let coordinate: CLLocationCoordinate2D
    var subtitle: String? {
        return locationName
    }
    
    init(tittle: String, locationName: String, coordinate: CLLocationCoordinate2D) {
        self.title = tittle
        self.locationName = locationName
        self.coordinate = coordinate
    }
}
