//
//  UIView+Utils.swift
//  ProjectAdvanced
//
//  Created by Dev2 on 03/10/2019.
//  Copyright © 2019 Orum Games. All rights reserved.
//

import UIKit

extension UIView {
    func configureShadows(color: UIColor = UIColor.black,
                          opacity: Float = 0.5,
                          radius: CGFloat = 8.0,
                          offset: CGSize = CGSize.zero) {
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = offset
        self.layer.shadowOpacity = opacity
        self.layer.shadowRadius = radius
    }
}

