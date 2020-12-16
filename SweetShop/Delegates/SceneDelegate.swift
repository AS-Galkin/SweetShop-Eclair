//
//  SceneDelegate.swift
//  SweetShop
//
//  Created by Александр Галкин on 02.12.2020.
//

import UIKit
import Foundation

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        print(#function + "SceneDelegate")
        //MARK: - Настраиваем первоначальную сцену. Инициализируем TabBarController.  Оборачиваем ViewController в NavigationViewController.
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        let userViewController: UserViewController = UserViewController()
        let mainViewController: MainViewController = MainViewController()
        let cartViewController: CartViewController = CartViewController()
        let locationViewController: LocationViewController = LocationViewController()
        let viewControllerArray: [UIViewController] = [mainViewController, locationViewController, cartViewController, userViewController]
        
        setTabBarItem(viewControllerArray: viewControllerArray)
        
        let navViewControllerArray: [NavigationViewController] = coverToNavController(viewControllerArray)
        let tabBarController: TabBarController =  TabBarController()
        
        tabBarController.setViewControllers(navViewControllerArray, animated: false)
        
        window?.rootViewController = tabBarController
//        print(tabBarController.tabBar.frame)
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
    
    
    //MARK: - Оборачиваем viewController в NavViewController
    func coverToNavController(_ viewControllerArray: [UIViewController]) -> [NavigationViewController] {
        var navigationControllerArray: [NavigationViewController] = []
        for viewController in viewControllerArray {
            let navController = NavigationViewController(rootViewController: viewController)
            navController.restorationIdentifier = "navigation" + viewController.typeName
            navigationControllerArray.append(navController)
        }
        return navigationControllerArray
    }
    
    
    //MARK: - Создаем BarBitemItem
    func setTabBarItem(viewControllerArray: [UIViewController]) {
        for viewController in viewControllerArray {
            for index in 0..<Icons.tabBarCases.count {
                //MARK: - Создаем подстроку
                let start = Icons.tabBarCases[index].rawValue.startIndex
                let end = Icons.tabBarCases[index].rawValue.index(Icons.tabBarCases[index].rawValue.endIndex, offsetBy: -5)
                if(viewController.typeName.contains(String(Icons.tabBarCases[index].rawValue[start..<end]).capitalized)) {
                    
                    viewController.tabBarItem = UITabBarItem(title: Titles.allCases[index].rawValue, image: UIImage(named:Icons.tabBarCases[index].rawValue), selectedImage: nil)
                    viewController.title = Titles.allCases[index].rawValue
                    viewController.tabBarItem.badgeColor = .brown
                    viewController.view.backgroundColor = .cyan
                }
            }
        }
    }

}

