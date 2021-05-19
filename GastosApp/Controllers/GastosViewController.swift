//
//  GastosViewController.swift
//  GastosApp
//
//  Created by IDS Comercial on 17/05/21.
//

import UIKit
import RealmSwift

class GastosViewController: UIViewController {
    
    let realm = try! Realm()
    var userGastos: Results<UserFinances>?
    let tableView = UITableView()
    var user = ""
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = Constants.gastos
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        return label
    }()
    
    private let addBtn: UIButton = {
        let button = UIButton()
        button.setTitleColor(.link, for: .normal)
        button.setTitle(Constants.agregarGasto, for: .normal)
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
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        titleLabel.frame = CGRect(x: 0, y: view.layoutMargins.top+20, width: view.frame.size.width, height: 50)
        addBtn.frame = CGRect(x: 250, y: view.layoutMargins.top+20, width: 130, height: 45)
        tableView.frame = CGRect(x: 0, y: titleLabel.frame.origin.y+titleLabel.frame.size.height+10, width: view.frame.size.width, height: view.frame.size.height)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        getUserInfo()
        tableView.reloadData()
    }
    
    @objc public func didTapAdd() {
        viewAlert()
    }
    func viewAlert() {
        let alert = UIAlertController(title: Constants.agregarGasto, message: Constants.agregarGasto, preferredStyle: .alert)
        alert.addTextField { (txtField) in
            txtField.placeholder = Constants.agregarGasto
        }
        alert.addAction(UIAlertAction(title: "Add", style: .default, handler: { (alertAction) in
            guard let field = alert.textFields?.first, let text = field.text, !text.isEmpty else {
                return
            }
            let users = self.realm.objects(User.self)
            let currentUser = users.filter("email == '\(self.user)'")
            let cuantity = Float(text)!
            do {
                try self.realm.write {
                    let newFinance = UserFinances()
                    newFinance.gastos = cuantity
                    currentUser.first?.finances.append(newFinance)
                }
            } catch {
                print("error saving data \(error)")
            }
            self.tableView.reloadData()
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alert, animated: true)
    }
    
    func getUserInfo() {
        let info = realm.objects(User.self)
        let userInfo = info.filter("email == '\(user)'")
        userGastos = userInfo.first?.finances.filter("gastos != 0.0")
    }
}

extension GastosViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userGastos?.count ?? 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if let gasto = userGastos?[indexPath.row].gastos {
            cell.textLabel?.text = "\(gasto)"
        }
        return cell
    }
}
