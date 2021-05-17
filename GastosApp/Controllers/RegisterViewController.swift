//
//  RegisterViewController.swift
//  GastosApp
//
//  Created by IDS Comercial on 13/05/21.
//

import UIKit
import Firebase
import RealmSwift

class RegisterViewController: UIViewController {
    
    let realm = try! Realm()
    
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
    
    private let registerBtn: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.setTitle(Constants.register, for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = Constants.register
        view.backgroundColor = .white
        view.addSubview(emailTextField)
        view.addSubview(pwdTextField)
        view.addSubview(registerBtn)
        registerBtn.addTarget(self, action: #selector(didRegisterUserPressed), for: .touchUpInside)
        print(Realm.Configuration.defaultConfiguration.fileURL)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        emailTextField.frame = CGRect(x: 20,
                                      y: 200,
                                      width: view.frame.size.width-40,
                                      height: 50)
        pwdTextField.frame = CGRect(x: 20,
                                    y: emailTextField.frame.origin.y+emailTextField.frame.size.height+10,
                                    width: view.frame.size.width-40,
                                    height: 50)
        registerBtn.frame = CGRect(x: 20,
                                   y: pwdTextField.frame.origin.y+pwdTextField.frame.size.height+50,
                                   width: view.frame.size.width-40,
                                   height: 50)
    }
    
    @objc private func didRegisterUserPressed() {
        if let email = emailTextField.text, let password = pwdTextField.text {
            
            Auth.auth().createUser(withEmail: email, password: password) { (authResult, err) in
                if let e = err {
                    print("error")
                } else {
                    print("Successful Registration!")
                    let newUser = User()
                    newUser.email = email
                    self.saveUser(user: newUser)
                }
            }
        }
    }
    
    func saveUser(user: User) {
        do {
            try realm.write {
                realm.add(user)
            }
        } catch {
            print("Error saving realm user")
        }
    }
}

