//
//  ViewController.swift
//  GastosApp
//
//  Created by IDS Comercial on 04/05/21.
//

import UIKit

class ViewController: UIViewController {
    
    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = Constants.title
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        return label
    }()
    
    private let emailTextField: UITextField = {
        let emailTextField = UITextField()
        emailTextField.placeholder = Constants.email
        emailTextField.layer.borderWidth = 1
        emailTextField.layer.borderColor = UIColor.black.cgColor
        return emailTextField
    }()
    
    private let pwdTextField: UITextField = {
        let pwdTextField = UITextField()
        pwdTextField.placeholder = Constants.password
        pwdTextField.layer.borderWidth = 1
        pwdTextField.isSecureTextEntry = true
        pwdTextField.layer.borderColor = UIColor.black.cgColor
        return pwdTextField
    }()
    
    private let loginBtn: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
        button.setTitle(Constants.logIn, for: .normal)
        return button
    }()
    
    private let registerBtn: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.setTitle(Constants.createUsr, for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(label)
        view.addSubview(emailTextField)
        view.addSubview(pwdTextField)
        view.addSubview(loginBtn)
        view.addSubview(registerBtn)
        view.backgroundColor = .white
        loginBtn.addTarget(self, action: #selector(didLoginPressed), for: .touchUpInside)
        registerBtn.addTarget(self, action: #selector(didRegisterPressed), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        label.frame = CGRect(x: 0,
                             y: 100,
                             width: view.frame.size.width,
                             height: 80)
        emailTextField.frame = CGRect(x: 20,
                                      y: label.frame.origin.y+label.frame.size.height+10,
                                      width: view.frame.size.width-40,
                                      height: 50)
        pwdTextField.frame = CGRect(x: 20,
                                    y: emailTextField.frame.origin.y+emailTextField.frame.size.height+10,
                                    width: view.frame.size.width-40,
                                    height: 50)
        loginBtn.frame = CGRect(x: 20,
                                y: pwdTextField.frame.origin.y+pwdTextField.frame.size.height+50,
                                width: view.frame.size.width-40,
                                height: 50)
        registerBtn.frame = CGRect(x: 20,
                                y: loginBtn.frame.origin.y+loginBtn.frame.size.height+10,
                                width: view.frame.size.width-40,
                                height: 50)
    }
    
    @objc private func didLoginPressed() {
        let vc = RegisterViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    @objc private func didRegisterPressed() {
        let vc = RegisterViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

