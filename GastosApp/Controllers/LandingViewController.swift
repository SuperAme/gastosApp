//
//  LandingViewController.swift
//  GastosApp
//
//  Created by IDS Comercial on 17/05/21.
//

import Foundation
import UIKit
import Firebase

class LandingViewController: UITabBarController {
    
    let ingresosVC = IngresosViewController()
    let gastosVC = GastosViewController()
    let homeVC = HomeViewController()
    let firebaseAuth = Auth.auth()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeVC.title = "Home"
        ingresosVC.title = "ingresos"
        gastosVC.title = "gastos"
        self.setViewControllers([homeVC, ingresosVC, gastosVC], animated: false)
        let leftBtn = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(didLogOutTapped))
        self.navigationItem.leftBarButtonItem = leftBtn
        
        if let currentUser = firebaseAuth.currentUser?.email {
            gastosVC.user = currentUser
            ingresosVC.user = currentUser
            homeVC.user = currentUser
        }
        
    }
    
    @objc func didLogOutTapped() {
        do {
            try firebaseAuth.signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
}
