//
//  AppDelegate.swift
//  Moody
//
//  Created by Florian on 07/05/15.
//  Copyright (c) 2015 objc.io. All rights reserved.
//

import UIKit
import CoreData


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var persistentContainer: NSPersistentContainer!
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        //应用一打开就对数据进行获取
        createMoodyContainer { container in //获取对象方法
            self.persistentContainer = container
            let storyboard = self.window?.rootViewController?.storyboard//获取StoryBoard
            guard let vc = storyboard?.instantiateViewController(withIdentifier: "RootViewController") as? RootViewController
                else { fatalError("Cannot instantiate root view controller") }
            vc.managedObjectContext = container.viewContext//这个container的上下文传递给vc方便使用
            self.window?.rootViewController = vc
        }
        return true
    }
}

