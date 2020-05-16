//
//  TabBarController.swift
//  Onboarding
//
//  Created by Fritz Heider on 5/15/20.
//  Copyright © 2020 Make School. All rights reserved.
//
import SwiftUI
import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllers()
        self.delegate = self
        
    }
    
    func setupViewControllers() {
        
        let hvc = HomeViewController()
        hvc.title = "Home"
        hvc.tabBarItem = UITabBarItem(title: hvc.title, image: UIImage(named: "img5"), selectedImage: UIImage(named: "img5"))
        let homeNav = UINavigationController(rootViewController: hvc)

        let nb = NewBoxesViewController()
        nb.title = "New Box"
        nb.tabBarItem = UITabBarItem(title: nb.title, image: UIImage(named: "Img16"), selectedImage: UIImage(named: "Img16"))
        let nbNav = UINavigationController(rootViewController: nb)
        
        let history = HistoryBoxes()
        history.title = "History"
        let boxesH = UINavigationController(rootViewController: history)
        history.tabBarItem = UITabBarItem(title: history.title, image: UIImage(named: "img"), selectedImage: UIImage(named: "trophy"))

        let profileVC = ContentView()
        let profNavVC = UIHostingController(rootView: profileVC)
        let profileNav = UINavigationController(rootViewController: profNavVC)
        profileNav.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "user"), tag: 0)
        
        viewControllers = [homeNav, nbNav, boxesH, profileNav]
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("Selected a new view controller")
    }
}

struct TabBarController_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
