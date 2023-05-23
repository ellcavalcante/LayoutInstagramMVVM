//
//  LoginVC.swift
//  PrimeiroAppMVVM
//
//  Created by Ellington Cavalcante on 22/05/23.
//

import UIKit

class LoginVC: UIViewController {
    
    private var loginScreen: LoginScreen? = LoginScreen()
    private var viewModel: LoginViewModel? = LoginViewModel()
    
    override func loadView() {
        view = loginScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loginScreen?.delegate(delegate: self)
        loginScreen?.configTextFieldDelegate(delegate: self)
        viewModel?.delegateViewModel(delegate: self)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
}

extension LoginVC: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let email: String = loginScreen?.emailTextField.text ?? ""
        let passwordTextField: String = loginScreen?.passwordTextField.text ?? ""
        
        if !email.isEmpty && !passwordTextField.isEmpty {
            loginScreen?.loginButton.isEnabled = true
            loginScreen?.loginButton.backgroundColor = .darkGray
        } else {
            loginScreen?.loginButton.isEnabled = false
            loginScreen?.loginButton.backgroundColor = .darkGray.withAlphaComponent(0.6)
        }
    }
}

extension LoginVC: LoginScreenProtocol {
    func actionLoginButton() {
        viewModel?.login(email: loginScreen?.emailTextField.text ?? "", password: loginScreen?.passwordTextField.text ?? "")
    }
}

extension LoginVC: LoginViewModelProtocol {
    func successLogin() {
        let homeVC: HomeVC = HomeVC()
        self.navigationController?.pushViewController(homeVC, animated: true)
    }
    
    func errorLogin(errorMessage: String) {
        Alert(controller: self).showAlertInformation(title: "Ops, error login", message: errorMessage)
    }
}
