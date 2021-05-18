//
//  LandingViewController.swift
//  GastosApp
//
//  Created by IDS Comercial on 17/05/21.
//

import Foundation
import UIKit

class LandingViewController: UITabBarController {
    
    let ingresosVC = IngresosViewController()
    let gastosVC = GastosViewController()
    let homeVC = HomeViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeVC.title = "Home"
        ingresosVC.title = "ingresos"
        gastosVC.title = "gastos"
        self.setViewControllers([homeVC, ingresosVC, gastosVC], animated: false)
        let leftBtn = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(didLogOutTapped))
        self.navigationItem.leftBarButtonItem = leftBtn
    }
    @objc func didLogOutTapped() {
        print("Logout")
    }
}
