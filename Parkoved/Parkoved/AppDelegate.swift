//
//  AppDelegate.swift
//  Parkoved
//
//  Created by Александр on 26.09.2020.
//  Copyright © 2020 AlexBugatti. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let vc = CityController.init(nibName: nil, bundle: nil)
        let navVC = UINavigationController.init(rootViewController: vc)
        navVC.setNavigationBarHidden(true, animated: false)
        
        let mapVC = MapController.init(nibName: nil, bundle: nil)
        let nav = UINavigationController.init(rootViewController: mapVC)
        nav.setNavigationBarHidden(true, animated: false)
        
        let profileVC = ProfileController.init(nibName: nil, bundle: nil)
        
        let navProfile = UINavigationController.init(rootViewController: profileVC)
        navProfile.setNavigationBarHidden(true, animated: false)
        
        let tabbar = UITabBarController.init()
        tabbar.viewControllers = [navVC, nav, navProfile]
        
        
        let tabCity = tabbar.tabBar.items![0]
        tabCity.title = "Парки" // tabbar titlee
        tabCity.image=UIImage(named: "Home")?.withRenderingMode(.alwaysOriginal) // deselect image
        tabCity.selectedImage = UIImage(named: "Home")?.withRenderingMode(.alwaysOriginal) // select image

        let tabMap = tabbar.tabBar.items![1]
        tabMap.title = "Карта"
        tabMap.image=UIImage(named: "map")?.withRenderingMode(.alwaysOriginal)
        tabMap.selectedImage=UIImage(named: "map")?.withRenderingMode(.alwaysOriginal)

        let tabProfile = tabbar.tabBar.items![2]
        tabProfile.title = "Профиль"
        tabProfile.image=UIImage(named: "Profile")?.withRenderingMode(.alwaysOriginal)
        tabProfile.selectedImage=UIImage(named: "Profile")?.withRenderingMode(.alwaysOriginal)
        
        self.window?.rootViewController = tabbar
        
        return true
    }


}

