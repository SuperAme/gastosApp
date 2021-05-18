//
//  IngresosViewController.swift
//  GastosApp
//
//  Created by IDS Comercial on 17/05/21.
//

import UIKit

class IngresosViewController: UIViewController {
    
    let tableView = UITableView()
    var user = ""
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = Constants.ingresos
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        return label
    }()
    
    private let addBtn: UIButton = {
        let button = UIButton()
        button.setTitleColor(.link, for: .normal)
        button.setTitle(Constants.agregaIngreso, for: .normal)
        button.addTarget(self, action: #selector(didTapAdd), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(titleLabel)
        view.addSubview(tableView)
        view.addSubview(addBtn)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        print(user)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        titleLabel.frame = CGRect(x: 110, y: view.layoutMargins.top+20, width: 100, height: 50)
        addBtn.frame = CGRect(x: 250, y: view.layoutMargins.top+20, width: 130, height: 45)
        tableView.frame = CGRect(x: 0, y: titleLabel.frame.origin.y+titleLabel.frame.size.height+10, width: view.frame.size.width, height: view.frame.size.height)
    }
    
    @objc public func didTapAdd() {
        viewAlert()
    }
    func viewAlert() {
        let alert = UIAlertController(title: Constants.agregaIngreso, message: Constants.agregaIngreso, preferredStyle: .alert)
        alert.addTextField { (txtField) in
            txtField.placeholder = Constants.agregaIngreso
        }
        alert.addAction(UIAlertAction(title: "Add", style: .default, handler: { (alertAction) in
            guard let field = alert.textFields?.first, let text = field.text, !text.isEmpty else {
                return
            }
            print(text)
        }))
        present(alert, animated: true)
    }
    
    func
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
