//
//  LoginVC.swift
//  Onboarding
//
//  Created by Fritz Heider on 4/23/20.
//  Copyright © 2020 Make School. All rights reserved.
//


import Foundation
import UIKit

class LoginVC: UIViewController {
    
    var titleConstraintStart: NSLayoutConstraint!
    var titleConstraintEnd: NSLayoutConstraint!
    
    
    let appNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Pantrack"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.font = UIFont(name: "Times New Roman", size: 80)
        return label
    }()
    
    let mainImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "box")
        return imageView
    }()
    
    let usernameTextField: LoginText = {
        let textField = LoginText(placeholder: "username")
        return textField
    }()
    
    let passwordTextField: LoginText = {
        let textField = LoginText(placeholder: "password")
        textField.isSecureTextEntry = true
        return textField
    }()
    let loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Sign In", for: .normal)
        button.backgroundColor = UIColor(displayP3Red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addGradientToView(view: self.view)
        setImageView()
        setLabel()
        createButton()
        setTextFields()
    }
    
    
    func createButton(){
        view.addSubview(loginButton)
        
        loginButton.addTarget(self, action: #selector(HomePage), for: .touchUpInside)
        
        
        
        
        loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60).isActive = true
        loginButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
    func setImageView(){
        self.view.addSubview(mainImage)
        mainImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        mainImage.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -20).isActive = true
    }
    
    func setLabel(){
        self.view.addSubview(appNameLabel)
        appNameLabel.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        appNameLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        titleConstraintEnd = appNameLabel.centerYAnchor.constraint(equalTo: mainImage.topAnchor, constant: -60)
        titleConstraintStart = appNameLabel.centerYAnchor.constraint(equalTo: mainImage.centerYAnchor, constant: 5)
        titleConstraintStart.isActive = true
        appNameLabel.transform = CGAffineTransform(scaleX: 0, y: 0)
        
    }
    func setTextFields(){
        //Adds Username field
        self.view.addSubview(usernameTextField)
        usernameTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        usernameTextField.topAnchor.constraint(equalTo: mainImage.bottomAnchor, constant: 30).isActive = true
        usernameTextField.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.75).isActive = true
        //Adds Password field
        self.view.addSubview(passwordTextField)
        passwordTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 15).isActive = true
        passwordTextField.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.75).isActive = true
    }
    
    

    
    func addGradientToView(view: UIView)
    {
        //gradient layer
        let gradientLayer = CAGradientLayer()
        
        //define colors
        gradientLayer.colors = [UIColor.blue.cgColor, UIColor.white.cgColor, UIColor.purple.cgColor]
        
        //define locations of colors as NSNumbers in range from 0.0 to 1.0
        //if locations not provided the colors will spread evenly
        gradientLayer.locations = [0.0, 0.5, 0.8]
        
        //define frame
        gradientLayer.frame = view.bounds
        
        //insert the gradient layer to the view layer
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    override func viewDidAppear(_ animated: Bool) {
        titleConstraintStart.isActive = false
        titleConstraintEnd.isActive = true
        UIView.animate(withDuration: 2.0, delay: 0.2,
                       usingSpringWithDamping: 0.6, initialSpringVelocity: 0.0, options: [ .curveEaseInOut],
                       animations: {
                        self.view.layoutIfNeeded()
                        self.appNameLabel.transform = CGAffineTransform(scaleX: 1, y: 1)
        }, completion: nil)
    }
    @objc func HomePage(){
        self.view.window!.rootViewController = TabBarController()
    }
    
}
