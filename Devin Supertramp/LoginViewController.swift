//
//  LoginViewController.swift
//  Devin Supertramp
//
//  Created by Michael Wirig on 10/31/14.
//  Copyright (c) 2014 Michael Wirig. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBAction func signIn(sender: AnyObject) {
        var permissions = ["public_profile", "email"]
        
        PFFacebookUtils.logInWithPermissions(permissions, {
            (user:PFUser!, error: NSError!) -> Void in
            if user == nil {
                println("user cancelled")
                
            } else if user.isNew {
                println("User logged in through facebook")
                
                self.performSegueWithIdentifier("signedIn", sender: self)
                
            } else {
                println("User is already logged in")
            }
            
            })
    }
    
        override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}