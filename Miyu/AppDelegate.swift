//
//  AppDelegate.swift
//  Miyu
//
//  Created by Cee on 03/11/2015.
//  Copyright © 2015 Cee. All rights reserved.
//

import UIKit
import Fabric
import Crashlytics
import DrawerController

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var drawerController: DrawerController!

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        Fabric.with([Crashlytics.self])
        setupDrawer()
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

    func setupDrawer() {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let leftSideDrawerViewController = storyboard.instantiateViewControllerWithIdentifier("ChannelTableViewController")
        let centerViewController = storyboard.instantiateViewControllerWithIdentifier("HomeViewController")
        
        self.drawerController = DrawerController(centerViewController: centerViewController, leftDrawerViewController: leftSideDrawerViewController, rightDrawerViewController: nil)
        self.drawerController.showsShadows = false
        self.drawerController.view.backgroundColor = UIColor.whiteColor()
        self.drawerController.restorationIdentifier = "Drawer"
        self.drawerController.maximumLeftDrawerWidth = 240
        self.drawerController.openDrawerGestureModeMask = .All
        self.drawerController.closeDrawerGestureModeMask = .All
        self.drawerController.shouldStretchDrawer = false
        
        let blurView = UIView(frame: UIScreen.mainScreen().bounds)
        blurView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.7)
        
        self.drawerController.drawerVisualStateBlock = { (drawer, drawerSide, percentVisible) in
            if percentVisible > 0 && blurView.superview == nil {
                self.drawerController.centerViewController?.view.addSubview(blurView)
            }
            if percentVisible == 0 {
                blurView.removeFromSuperview()
            }
            let block = ExampleDrawerVisualStateManager.sharedManager.drawerVisualStateBlockForDrawerSide(drawerSide)
            block?(self.drawerController, drawerSide, percentVisible)
        }
        
//        self.drawerController.drawerVisualStateBlock = { (drawerController, drawerSide, percentVisible) in
//            let block = ExampleDrawerVisualStateManager.sharedManager.drawerVisualStateBlockForDrawerSide(drawerSide)
//            block?(drawerController, drawerSide, percentVisible)
//        }
        
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        self.window?.rootViewController = self.drawerController
    }

}

