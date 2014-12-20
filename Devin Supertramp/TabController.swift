//
//  TabController.swift
//  Devin Supertramp
//
//  Created by Michael Wirig on 12/5/14.
//  Copyright (c) 2014 Michael Wirig. All rights reserved.
//

import UIKit

class TabController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.tabBar.backgroundImage = UIImage(named: "Rectangle 16")
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func shouldAutorotate() -> Bool {
        
        if canRotate == false {
        
        return false
        } else {
            return true
        }
    }
    
    override func supportedInterfaceOrientations() -> Int {
        
        if canRotate == false {
        return UIInterfaceOrientationMask.Portrait.rawValue.hashValue
        
        } else {
            return UIInterfaceOrientationMask.All.rawValue.hashValue
        }
    }
    
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
