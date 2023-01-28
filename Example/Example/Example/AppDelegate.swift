//
//  AppDelegate.swift
//  Example
//
//  Created by darvin on 2021/9/20.
//

import DVTLoger
import DVTSecurity
import DVTUIKitNavigation
import UIKit

// 日志
let eLoger = {
    let loger = Loger("Test")
    loger.logExpire = 3600 * 24 * 7 // 七天有效时间
    loger.maxFilesCount = 1 // 只保留一个日志文件
    loger.toFileLevel = .all // 所有日志都写入文件
    loger.autoCleanLogFiles() // 第一次使用的时候就进行自动清理
    return loger
}()

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        eLoger.info(KeyChain.UDIDString)

        eLoger.debug("debug", 100)
        eLoger.info("info", 101)
        eLoger.warning("warning", 102)
        eLoger.error("error", 103)

        DispatchQueue.main.async {
            eLoger.info(CGFloat.dvt.navigationBarHeight)
            eLoger.info(CGFloat.dvt.safeBottomHeight)
        }
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert]) { _, _ in
        }
        NotificationCenter.default.addObserver(forName: UIApplication.protectedDataWillBecomeUnavailableNotification, object: nil, queue: .main) { _ in
            eLoger.info(KeyChain.UDIDString)
        }
        UNUserNotificationCenter.current().delegate = self

        DVTUINavigationBarStyle.default.dvt_navigationBarBackTitle = ""
        DVTUINavigationBarStyle.default.dvt_navigationBarShadowColor = .clear
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
