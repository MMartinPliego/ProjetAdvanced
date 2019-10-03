//
//  SplashViewController.swift
//  ProjectAdvanced
//
//  Created by Dev2 on 02/10/2019.
//  Copyright © 2019 Orum Games. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Para cargar la pantalla Splash
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            
            // Guard let para desempaquetar el opcional de ""self.present(viewControllerDestination, animated: true)""
            guard let viewControllerDestination =
                storyboard.instantiateInitialViewController() else {
                    return
            }
            self.present(viewControllerDestination, animated: true)
        }
        
        
    }


}

