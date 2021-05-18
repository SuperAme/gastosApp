//
//  IngresosViewController.swift
//  GastosApp
//
//  Created by IDS Comercial on 17/05/21.
//

import UIKit

class IngresosViewController: UIViewController {
    
    let tableView = UITableView()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = Constants.ingresos
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(titleLabel)
        view.addSubview(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        titleLabel.frame = CGRect(x: 0, y: view.layoutMargins.top+20, width: view.frame.size.width, height: 50)
        tableView.frame = CGRect(x: 0, y: titleLabel.frame.origin.y+titleLabel.frame.size.height+10, width: view.frame.size.width, height: view.frame.size.height)
    }
    
    @objc public func didTapAdd() {
        print("add button")
    }
}

extension IngresosViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "cell number \(indexPath.row)"
        return cell
    }
}
