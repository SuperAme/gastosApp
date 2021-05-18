//
//  HomeViewController.swift
//  GastosApp
//
//  Created by IDS Comercial on 17/05/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    let tableView = UITableView()
    var saldoTotal = 0.0
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = Constants.saldo
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        return label
    }()
    
    private var totalLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        getSaldo()
        view.addSubview(titleLabel)
        view.addSubview(totalLabel)
        view.addSubview(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        titleLabel.frame = CGRect(x: 130, y: view.layoutMargins.top+20, width: 100, height: 50)
        totalLabel.frame = CGRect(x: 180, y: view.layoutMargins.top+20, width: 100, height: 50)
        tableView.frame = CGRect(x: 0, y: titleLabel.frame.origin.y+titleLabel.frame.size.height+10, width: view.frame.size.width, height: view.frame.size.height)
    }
    
    func getSaldo() {
        totalLabel.text = saldoTotal != 0.0 ? "\(saldoTotal)" : "0"
    }

}
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "cell \(indexPath.row)"
        return cell
    }
}