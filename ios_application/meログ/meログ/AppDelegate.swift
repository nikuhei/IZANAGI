//
//  AppDelegate.swift
//  meログ
//
//  Created by 西澤 郁平 on 2016/03/26.
//  Copyright © 2016年 ikunyan.org. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var type: UIUserNotificationType?
    var settings: UIUserNotificationSettings?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        if let option = launchOptions {
            
            let notification = launchOptions?[UIApplicationLaunchOptionsLocalNotificationKey] as! UILocalNotification!
            if (notification != nil) {
                //notificationを実行します
                var alert = UIAlertView();
                alert.title = "LocalNotification経由で起動しました";
                alert.addButtonWithTitle("OK")
                alert.show();
                
                //Notification消去.
                UIApplication.sharedApplication().cancelLocalNotification(notification);
            }
        }
        
        type = UIUserNotificationType.Badge
        settings = UIUserNotificationSettings(forTypes: [.Alert, .Badge, .Sound], categories: nil)
        application.registerUserNotificationSettings(settings!)
        
        // 毎日21時に服薬確認アラート
        let now = NSDate()
        print(now);// -> 2015-09-15 23:06:47 +0000
        let calendar = NSCalendar(identifier: NSCalendarIdentifierGregorian)
        let comps:NSDateComponents = calendar!.components([.Year, .Month, .Day],fromDate: now)
        comps.calendar = calendar;
        comps.hour = 21;
        
        let now2 = comps.date;
        print(now2);// -> Optional(0000-12-31 22:47:48 +0000)
        
        let med_notification = UILocalNotification()
        med_notification.alertBody = "今日はもうお薬飲んだ？"
        med_notification.alertAction = "OK"
        med_notification.timeZone = NSTimeZone.defaultTimeZone();
        med_notification.fireDate = now2;
        med_notification.repeatInterval = .Day;
        med_notification.soundName = UILocalNotificationDefaultSoundName
        UIApplication.sharedApplication().scheduleLocalNotification(med_notification)

        return true
    }
    
    func application(application: UIApplication, didReceiveLocalNotification notification: UILocalNotification) {
        
        let alert = UIAlertView();
        alert.title = "受け取りました";
        alert.message = notification.alertBody;
        alert.addButtonWithTitle(notification.alertAction!);
        alert.show();
        
    }
    
    func application(application: UIApplication, handleActionWithIdentifier identifier: String?, forLocalNotification notification: UILocalNotification, completionHandler: () -> Void) {
        var alert = UIAlertView();
        alert.title = "非アクティブなのに受け取りました";
        alert.message = notification.alertBody;
        alert.addButtonWithTitle(notification.alertAction!);
        alert.show();
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
}

