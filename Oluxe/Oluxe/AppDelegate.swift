//
//  AppDelegate.swift
//  Oluxe
//
//  Created by Jiang Chuncheng on 3/26/15.
//  Copyright (c) 2015 MorganStark. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        self.window?.backgroundColor = UIColor.blueColor()
        self.window?.makeKeyAndVisible()
        
        initUmeng()
        
        self.window?.rootViewController = configViewControllersWithOptions(launchOptions)
        
        initAppRating()
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    /**
    初始化友盟统计分析
    */
    func initUmeng() {
        #if (DEBUG)
            MobClick.startWithAppkey("551eb0a2fd98c5030d0001ac", reportPolicy: REALTIME, channelId: "Development")
        #else
            MobClick.startWithAppkey("551eb0a2fd98c5030d0001ac", reportPolicy: REALTIME, channelId: "App Store")
        #endif
        
        MobClick.setAppVersion(NSBundle.mainBundle().infoDictionary?["CFBundleShortVersionString"] as? String)
        
        UMFeedback.setAppkey("551eb0a2fd98c5030d0001ac")
    }
    
    /**
    初始化App评级功能
    */
    func initAppRating() {
        Appirater.setAppId("974476273")
        Appirater.setDaysUntilPrompt(7)         //使用N天后跳出提示
        Appirater.setUsesUntilPrompt(7)         //使用N次后跳出提示
        Appirater.setTimeBeforeReminding(7)     //点击稍候提醒，设置N天后再提示
        Appirater.setOpenInAppStore(true)
        Appirater.setDebug(false)
        
        Appirater.appLaunched(true)
    }
    
    /**
    初始化界面元素
    
    :param: launchOptions 启动参数
    
    :returns: 根视图控制器
    */
    func configViewControllersWithOptions(launchOptions: [NSObject: AnyObject]?) -> UIViewController {
        //设置导航栏背景
        UINavigationBar.appearance().setBackgroundImage(UIImage.imageWithColor(UIColor(red: 247/255.0, green: 162/255.0, blue: 51/255.0, alpha: 1.0), forSize: CGSizeMake(1, 64)), forBarMetrics: UIBarMetrics.Default)
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor(), NSFontAttributeName: UIFont.boldSystemFontOfSize(20)]
        UINavigationBar.appearance().tintColor = UIColor.whiteColor();
        
        //配置切换卡背景
        UITabBar.appearance().barTintColor = UIColor(red: 247/255.0, green: 162/255.0, blue: 51/255.0, alpha: 1.0)
        
        //配置切换卡
        let articleListViewController = ArticleListViewController(nibName: nil, bundle: nil)
        let productListViewController = ProductListViewController(nibName: nil, bundle: nil)
        let playViewController = PlayViewController(nibName: nil, bundle: nil)
        let mineViewController = MineViewController(nibName: nil, bundle: nil)
        
        let nav1 = UINavigationController()
        nav1.viewControllers = [articleListViewController]
        let nav2 = UINavigationController()
        nav2.viewControllers = [productListViewController]
        let nav3 = UINavigationController()
        nav3.viewControllers = [playViewController]
        let nav4 = UINavigationController()
        nav4.viewControllers = [mineViewController]
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [nav1, nav2, nav3, nav4]
        
        return tabBarController
    }

}

