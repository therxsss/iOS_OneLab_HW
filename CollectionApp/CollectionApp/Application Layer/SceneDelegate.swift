//
//  SceneDelegate.swift
//  CollectionApp
//
//  Created by Abdurakhman on 17.04.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let myFeedVC = createMyFeedVC()
        let myFriendsVC = createMyFriendsVC()
        let myPinsVC = createMyPinsVC()
        let myProfileVC = createMyProfileVC()
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [myFeedVC, myFriendsVC, myPinsVC, myProfileVC]
        
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }
    
    private func createMyFeedVC() -> UINavigationController {
        let myFeedVC = UINavigationController(rootViewController: MyFeedViewController())
        myFeedVC.title = NSLocalizedString("My Feed", comment: "")
        myFeedVC.tabBarItem = UITabBarItem(title: NSLocalizedString("My Feed", comment: ""), image: UIImage(systemName: "text.below.photo"), tag: 0)
        return myFeedVC
    }
    
    private func createMyFriendsVC() -> UINavigationController {
        let myFriendsVC = UINavigationController(rootViewController: MyFriendsViewController())
        myFriendsVC.title = NSLocalizedString("My Friends", comment: "")
        myFriendsVC.tabBarItem = UITabBarItem(title:  NSLocalizedString("My Friends", comment: ""), image: UIImage(systemName: "person.2.fill"), tag: 0)
        return myFriendsVC
    }
    
    private func createMyPinsVC() -> UINavigationController {
        let myPinsVC = UINavigationController(rootViewController: MyPinsViewController())
        myPinsVC.title = NSLocalizedString("My Pins", comment: "")
        myPinsVC.tabBarItem = UITabBarItem(title: NSLocalizedString("My Pins", comment: ""), image: UIImage(systemName: "pin.fill"), tag: 0)
        return myPinsVC
    }
    
    private func createMyProfileVC() -> UINavigationController {
        let myProfileVC = UINavigationController(rootViewController: MyProfileViewController())
        myProfileVC.title = NSLocalizedString("My Profile", comment: "")
        myProfileVC.tabBarItem = UITabBarItem(title: NSLocalizedString("My Profile", comment: ""), image: UIImage(systemName: "person.crop.rectangle.stack.fill"), tag: 0)
        return myProfileVC
    }

}

