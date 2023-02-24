//
//  ViewController.swift
//  start-ios
//
//  Created by Zhuldyz Bukeshova on 24.02.2023.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    //MARK: - UI elements
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "logo") ?? UIImage())
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let loginTextField: UITextField = {
        let textField = UITextField()
        textField.setLeftIcon(image: UIImage(systemName: "envelope.fill") ?? UIImage())
        textField.placeholder = "Email"
        textField.keyboardType = .emailAddress
        textField.returnKeyType = .continue
        textField.autocapitalizationType = .none
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 16
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        var textField = UITextField()
        textField.setLeftIcon(image: UIImage(systemName: "lock.fill") ?? UIImage())
        textField.placeholder = "Password"
        textField.textContentType = .password
        textField.isSecureTextEntry = true
        textField.returnKeyType = UIReturnKeyType.done
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 16
        return textField
    }()
    
    private lazy var enterButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.backgroundColor = .link
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = .preferredFont(forTextStyle: .headline)
        button.layer.cornerRadius = 16
        button.setTitle("Login", for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var passwordFogotButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Forgot your password?", for: .normal)
        button.titleLabel?.font = .preferredFont(forTextStyle: .footnote)
        button.setTitleColor(UIColor.white, for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let leftBottomLineView: UIView = {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 1).isActive = true
        view.widthAnchor.constraint(equalToConstant: 50).isActive = true
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        return view
    }()
    
    private let connectionsLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "or connect with"
        label.textColor = .white
        label.font = .preferredFont(forTextStyle: .body)
        label.textAlignment = .center
        return label
    }()
    
    private let rightBottomLineView: UIView = {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 1).isActive = true
        view.widthAnchor.constraint(equalToConstant: 50).isActive = true
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        return view
    }()
    
    private lazy var socialMediaSignUpStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [leftBottomLineView, connectionsLabel, rightBottomLineView])
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 10
        return stack
    }()
    
    private lazy var instaButton: UIButton = {
        let button = UIButton()
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.widthAnchor.constraint(equalToConstant: 40).isActive = true
        button.setImage(UIImage(named: "insta"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFill
        button.layer.cornerRadius = button.frame.width / 2
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var gitButton: UIButton = {
        let button = UIButton()
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.widthAnchor.constraint(equalToConstant: 40).isActive = true
        button.setImage(UIImage(named: "linkedin"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFill
        button.layer.cornerRadius = button.frame.width / 2
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var twitterButton: UIButton = {
        let button = UIButton()
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.widthAnchor.constraint(equalToConstant: 40).isActive = true
        button.setImage(UIImage(named: "twitter"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFill
        button.layer.cornerRadius = button.frame.width / 2
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var socialMediaIconsStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [instaButton, gitButton, twitterButton])
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 10
        return stack
    }()
    
    private let signUpLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Don't have account?"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign up", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(UIColor.white, for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var signUpStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [signUpLabel, signUpButton])
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 10
        return stack
    }()
    
    //MARK: - ViewLifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundColorSetup()
        setupViews()
        setConstraints()
    }
    
    //MARK: - setupViews
    
    private func setupViews() {
        view.addSubview(logoImageView)
        view.addSubview(loginTextField)
        view.addSubview(passwordTextField)
        view.addSubview(enterButton)
        view.addSubview(passwordFogotButton)
        view.addSubview(socialMediaSignUpStackView)
        view.addSubview(socialMediaIconsStackView)
        view.addSubview(signUpStackView)
    }
    
    private func backgroundColorSetup() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.link.cgColor, UIColor.black.cgColor]
        gradientLayer.startPoint = CGPoint(x: 1.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.frame = view.bounds
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    
    //MARK: - ButtonsActions
    @objc private func buttonTapped() {
        print("buttonTapped")
    }
    
    //MARK: - SetConstraints
    func setConstraints() {
        NSLayoutConstraint.activate([
            
            logoImageView.widthAnchor.constraint(equalToConstant: 170),
            logoImageView.heightAnchor.constraint(equalToConstant: 35),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            
            loginTextField.heightAnchor.constraint(equalToConstant: 35),
            loginTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 70),
            loginTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -70),
            loginTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 50),
            
            passwordTextField.heightAnchor.constraint(equalToConstant: 35),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -70),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 70),
            passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 20),
            
            enterButton.heightAnchor.constraint(equalToConstant: 40),
            enterButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 70),
            enterButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -70),
            enterButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 40),
            
            passwordFogotButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordFogotButton.topAnchor.constraint(equalTo: enterButton.bottomAnchor, constant: 10),
            
            socialMediaSignUpStackView.topAnchor.constraint(equalTo: passwordFogotButton.bottomAnchor, constant: 60),
            socialMediaSignUpStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            socialMediaSignUpStackView.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor),
            socialMediaSignUpStackView.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor),
            
            socialMediaIconsStackView.topAnchor.constraint(equalTo: socialMediaSignUpStackView.bottomAnchor, constant: 20),
            socialMediaIconsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            socialMediaIconsStackView.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor),
            socialMediaIconsStackView.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor),
            
            signUpStackView.topAnchor.constraint(equalTo: socialMediaIconsStackView.bottomAnchor, constant: 20),
            signUpStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signUpStackView.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor),
            signUpStackView.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor)
            
        ])
    }
}

