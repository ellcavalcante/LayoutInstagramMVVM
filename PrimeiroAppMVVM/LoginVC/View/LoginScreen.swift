//
//  LoginScreen.swift
//  PrimeiroAppMVVM
//
//  Created by Ellington Cavalcante on 22/05/23.
//

import UIKit

protocol LoginScreenProtocol: AnyObject {
    func actionLoginButton()
}

class LoginScreen: UIView {
    
    private weak var delegate: LoginScreenProtocol?
    func delegate(delegate: LoginScreenProtocol?) {
        self.delegate = delegate
    }
    
    lazy var loginLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Login"
        lb.textAlignment = .center
        lb.font = UIFont.boldSystemFont(ofSize: 40)
        lb.textColor = .black
        return lb
    }()
    
    lazy var emailTextField: UITextField = {
        let eTF = UITextField()
        eTF.translatesAutoresizingMaskIntoConstraints = false
        eTF.placeholder = "Digite seu e-mail:"
        eTF.clipsToBounds = true
        eTF.layer.cornerRadius = 7.5
        eTF.backgroundColor = .white
        eTF.clearButtonMode = .whileEditing
        return eTF
    }()
    
    lazy var passwordTextField: UITextField = {
        let eTF = UITextField()
        eTF.translatesAutoresizingMaskIntoConstraints = false
        eTF.placeholder = "Digite sua senha:"
        eTF.clipsToBounds = true
        eTF.layer.cornerRadius = 7.5
        eTF.backgroundColor = .white
        eTF.clearButtonMode = .whileEditing
        return eTF
    }()
    
    lazy var loginButton: UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.backgroundColor = .darkGray.withAlphaComponent(0.6)
        bt.setTitle("Entrar", for: .normal)
        bt.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        bt.isEnabled = false
        bt.setTitleColor(.white, for: .normal)
        bt.clipsToBounds = true
        bt.layer.cornerRadius = 7.5
        bt.addTarget(self, action: #selector(tappedLoginButton), for: .touchUpInside)
        return bt
    }()
    
    @objc func tappedLoginButton() {
        delegate?.actionLoginButton()
    }
    
    public func configTextFieldDelegate(delegate: UITextFieldDelegate) {
        emailTextField.delegate = delegate
        passwordTextField.delegate = delegate
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addElements()
        backgroundColor()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        addSubview(loginLabel)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(loginButton)
    }
    
    private func backgroundColor() {
        backgroundColor = .systemMint
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
        
            loginLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
            loginLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 30),
            loginLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -30),
            loginLabel.heightAnchor.constraint(equalToConstant: 40),
        
            emailTextField.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 30),
            emailTextField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            emailTextField.heightAnchor.constraint(equalToConstant: 40),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passwordTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30),
            loginButton.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor),
            loginButton.heightAnchor.constraint(equalTo: passwordTextField.heightAnchor),
        ])
    }
}
