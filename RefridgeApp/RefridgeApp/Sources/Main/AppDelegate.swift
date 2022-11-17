//
//  AppDelegate.swift
//  RefridgeApp
//
//  Created by Syakur, Y. (Yusuf) on 09/11/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    // MARK: UIApplicationDelegate States
    // UIApplicationDelegate is a protocol for notifying when events occur such as app launch, app goes into background or foreground, app is terminated, a push notification was opened etc. It handles your application lifecycle and gives space to handle events that were started outside of the app.

    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("AppDelegate: I will finish launch")
        return true
    }
    
    // Application started and initialized. self.rootViewController will be instantiated at this stage.
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        print("AppDelegate: I finished launching, I am initializing and instantiating rootViewController...")
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        window?.rootViewController = TabBarController()
        
        return true
    }
    
    // This function will be called when the application is active from either starting or resume
    func applicationDidBecomeActive(_ application: UIApplication) {
        print("AppDelegate: I just became active")
    }
    
    // Called when user prompts to put the app from foreground to background. This can be used to save the state of the UI if needed.
    func applicationWillResignActive(_ application: UIApplication) {
        print("AppDelegate: User wants to move app from foreground to background")
    }
    
    // Called when the app has been put in the background. This can be used to save user data and release file or database sources.
    func applicationDidEnterBackground(_ application: UIApplication) {
        print("AppDelegate: I have been put in the background.")
    }
    
    // Called when user wants to put the inactive (background) app to active state (foreground). You can restore saved states or data.
    func applicationWillEnterForeground(_ application: UIApplication) {
        print("AppDelegate: I will return from background to foreground.")
    }
    
    // This function will be called when the application is about to terminate. You can put things here like save user data. The process may only last for a few seconds; this process will get killed in about 5 seconds.
    func applicationWillTerminate(_ application: UIApplication) {
        print("AppDelegate: I will terminate in 5 seconds")
    }
}

