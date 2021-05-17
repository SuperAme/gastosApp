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
//        let topButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAdd))
//        self.navigationItem.rightBarButtonItem = topButton
    }
//    @objc public func didTapAdd() {
//        print("add button")
//    }
}
