//
//  AddUserNat.swift
//  ProjectAdvanced
//
//  Created by Dev2 on 24/10/2019.
//  Copyright © 2019 Orum Games. All rights reserved.
//

import UIKit

class AddUserNat: UITableViewCell {
        static let cellIdentifier = String(describing: AddUserNat.self)
    
    
    @IBOutlet weak var labelNat: UILabel!
    @IBOutlet var collectionNat: Array<UICollectionView>!
    
    //Poner el lunes las banderas
    //private var flagNat: Array = []
    
    // MARK: - Lifecycle -
    override func prepareForReuse() {

    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

extension AddUserNat: UITextFieldDelegate {
    func configureCell() {
    }
}
