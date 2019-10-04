//
//  SplashViewController.swift
//  ProjectAdvanced
//
//  Created by Dev2 on 02/10/2019.
//  Copyright © 2019 Orum Games. All rights reserved.
//

import UIKit
import Lottie

class SplashViewController: UIViewController {
    
    @IBOutlet weak var mViewLoading: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        playAnimation()
        navigate()
    }
    
    // añadir Lottie a la pantalla Splash
    func playAnimation(){
        let animationView = AnimationView(name: "lottie_bueno")
        animationView.contentMode = .scaleAspectFill
        animationView.frame = mViewLoading.bounds
        animationView.loopMode = .loop
        mViewLoading.addSubview(animationView)
        animationView.play()
    }
    
     // Para cargar la pantalla Splash durante 3 segundos
    private func navigate() { DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
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


