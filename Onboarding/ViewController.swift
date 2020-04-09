//
//  ViewController.swift
//  Onboarding
//
//  Created by Fritz Heider on 4/8/20.
//  Copyright © 2020 Make School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var scrollView: UIScrollView!
    var container: UIStackView!
    let firstView =  OnboardingPage()
    let secondView = OnboardingPage()
    let thirdView = OnboardingPage()
    
    
    override func loadView() {
        super.loadView()
        
        scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        view.addSubview(scrollView)
        
        container = UIStackView()
        container.axis = .horizontal
        container.spacing = 0
        container.translatesAutoresizingMaskIntoConstraints = false
        container.distribution = .fillEqually
        
        scrollView.addSubview(container)
        container.addArrangedSubview(firstView)
        container.addArrangedSubview(secondView)
        container.addArrangedSubview(thirdView)
        
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        container.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        container.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        container.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        container.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        container.heightAnchor.constraint(equalTo: scrollView.heightAnchor).isActive = true
        
        firstView.widthAnchor.constraint(equalToConstant: view.frame.size.width).isActive = true
        secondView.widthAnchor.constraint(equalToConstant: view.frame.size.width).isActive = true
        thirdView.widthAnchor.constraint(equalToConstant: view.frame.size.width).isActive = true
        
        firstView.button.isHidden = true
        secondView.button.isHidden = true
          thirdView.button.isEnabled = true
        
        
        firstView.newLabel.text = "Presenting Mobile 1.2"
        secondView.newLabel.text = "An app to fight the pandemic"
        thirdView.newLabel.text = "Are you ready for this?"
        
        secondView.newImage.image = UIImage(named: "img2")
        thirdView.newImage.image = UIImage(named: "img3")
//        
//        thirdView.button.addTarget(self, action: #selector(goToLogin), for: .touchUpInside)
//
//
        
        
    }
}
