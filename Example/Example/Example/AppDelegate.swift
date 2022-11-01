//
//  AppDelegate.swift
//  Example
//
//  Created by darvin on 2021/9/20.
//

import DVTLoger
import DVTSecurity
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        Loger.info(KeyChain.default.UDIDString)

        Loger.debug("debug", 100)
        Loger.info("info", 101)
        Loger.warning("warning", 102)
        Loger.error("error", 103)

        DispatchQueue.main.async {
            Loger.info(CGFloat.dvt.navigationBarHeight)
            Loger.info(CGFloat.dvt.safeBottomHeight)
        }
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert]) { _, _ in
        }
        UNUserNotificationCenter.current().delegate = self
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}

extension AppDelegate: UNUserNotificationCenterDelegate {
    // App处于前台时收到通知
    public func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        if #available(iOS 14.0, *) {
            completionHandler([.banner, .list])
        } else {
            completionHandler([.alert])
        }
    }

    // 触发通知动作时回调
    public func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        completionHandler()
    }
}
