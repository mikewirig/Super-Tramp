//
//  teamSupertrampController.swift
//  Devin Supertramp
//
//  Created by Michael Wirig on 12/9/14.
//  Copyright (c) 2014 Michael Wirig. All rights reserved.
//

import UIKit

class teamSupertrampController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//Parker social buttons
    @IBAction func parkerFB(sender: AnyObject) {
        
        println("Liked Facebook page")
        
        if UIApplication.sharedApplication().canOpenURL(NSURL(string: "fb://profile/569730163")!) {
            
            UIApplication.sharedApplication().openURL(NSURL(string: "fb://profile/569730163")!)
            
        } else {
            
            UIApplication.sharedApplication().openURL(NSURL(string: "https://www.facebook.com/parker.walbeck?ref=ts&fref=ts")!)
        }

        
    }
    
    @IBAction func parkerTwitter(sender: AnyObject) {
        
        println("Followed on Twitter")
        
        if UIApplication.sharedApplication() .canOpenURL(NSURL(string: "twitter://user?screen_name=parkerwalbeck")!) {
            
            UIApplication.sharedApplication().openURL(NSURL(string: "twitter://user?screen_name=parkerwalbeck")!)
            
        } else {
            
            UIApplication.sharedApplication().openURL(NSURL(string: "https://twitter.com/parkerwalbeck")!)
        }

        
    }
    
    @IBAction func parkerInsta(sender: AnyObject) {
        
        println("Followed on Instagram")
        
        if UIApplication.sharedApplication() .canOpenURL(NSURL(string: "instagram://user?username=parkerwalbeck")!){
            
            UIApplication.sharedApplication().openURL(NSURL(string: "instagram://user?username=parkerwalbeck")!)
        } else {
            
            UIApplication.sharedApplication().openURL(NSURL(string: "http://instagram.com/parkerwalbeck")!)
        }

        
    }
   
    @IBAction func parkerGoogle(sender: AnyObject) {
        
        
        println("Followed on Google+")
        
        if UIApplication.sharedApplication().canOpenURL(NSURL(string: "gplus:/plus.google.com/111252167244978423909/posts")!) {
            
            UIApplication.sharedApplication().openURL(NSURL(string: "gplus://plus.google.com/111252167244978423909/posts")!)
            
        } else {
            
            UIApplication.sharedApplication().openURL(NSURL(string: "https://plus.google.com/111252167244978423909/posts")!)
        }

    }
    
    //carter social buttons
    
    @IBAction func carterFB(sender: AnyObject) {
        
        println("Liked Facebook page")
        
        if UIApplication.sharedApplication().canOpenURL(NSURL(string: "fb://profile/524639195")!) {
            
            UIApplication.sharedApplication().openURL(NSURL(string: "fb://profile/524639195")!)
            
        } else {
            
            UIApplication.sharedApplication().openURL(NSURL(string: "https://www.facebook.com/profile.php?id=524639195&ref=ts&fref=ts")!)
        }

        
    }
    
    @IBAction func carterTwitter(sender: AnyObject) {
        
        println("Followed on Twitter")
        
        if UIApplication.sharedApplication() .canOpenURL(NSURL(string: "twitter://user?screen_name=carjhogan")!) {
            
            UIApplication.sharedApplication().openURL(NSURL(string: "twitter://user?screen_name=carjhogan")!)
            
        } else {
            
            UIApplication.sharedApplication().openURL(NSURL(string: "https://twitter.com/carjhogan")!)
        }

        
    }
    
    @IBAction func carterInsta(sender: AnyObject) {
        
        println("Followed on Instagram")
        
        if UIApplication.sharedApplication() .canOpenURL(NSURL(string: "instagram://user?username=carjhogan")!){
            
            UIApplication.sharedApplication().openURL(NSURL(string: "instagram://user?username=carjhogan")!)
        } else {
            
            UIApplication.sharedApplication().openURL(NSURL(string: "http://instagram.com/carjhogan")!)
        }

        
    }
    
    @IBAction func carterGoogle(sender: AnyObject) {
        
        println("Followed on Google+")
        
        if UIApplication.sharedApplication().canOpenURL(NSURL(string: "gplus://plus.google.com/118282612625385211987/posts")!) {
            
            UIApplication.sharedApplication().openURL(NSURL(string: "gplus://plus.google.com/118282612625385211987/posts")!)
            
        } else {
            
            UIApplication.sharedApplication().openURL(NSURL(string: "https://plus.google.com/118282612625385211987/posts")!)
        }

        
    }
    
    //dakota social buttons
    
    @IBAction func dakotaFB(sender: AnyObject) {
        
        println("Liked Facebook page")
        
        if UIApplication.sharedApplication().canOpenURL(NSURL(string: "fb://profile/606117286")!) {
            
            UIApplication.sharedApplication().openURL(NSURL(string: "fb://profile/606117286")!)
            
        } else {
            
            UIApplication.sharedApplication().openURL(NSURL(string: "https://www.facebook.com/dakota.walbeck?ref=ts&fref=ts")!)
        }

        
    }
    
    @IBAction func dakotaTwitter(sender: AnyObject) {
        
        println("Followed Dakota on Twitter")
        
        if UIApplication.sharedApplication() .canOpenURL(NSURL(string: "twitter://user?screen_name=Dakota_Walbeck")!) {
            
            UIApplication.sharedApplication().openURL(NSURL(string: "twitter://user?screen_name=Dakota_Walbeck")!)
            
        } else {
            
            UIApplication.sharedApplication().openURL(NSURL(string: "https://twitter.com/Dakota_Walbeck")!)
        }

        
    }
    
    @IBAction func dakotaInsta(sender: AnyObject) {
        
        println("Followed Dakota on Instagram")
        
        if UIApplication.sharedApplication() .canOpenURL(NSURL(string: "instagram://user?username=Dakota_Walbeck")!){
            
            UIApplication.sharedApplication().openURL(NSURL(string: "instagram://user?username=Dakota_Walbeck")!)
        } else {
            
            UIApplication.sharedApplication().openURL(NSURL(string: "http://instagram.com/Dakota_Walbeck")!)
        }

        
    }
    
    @IBAction func dakotaGoogle(sender: AnyObject) {
        
        println("Followed Dakota on Google+")
        
        if UIApplication.sharedApplication().canOpenURL(NSURL(string: "gplus://plus.google.com/+DakotaWalbeck/posts")!) {
            
            UIApplication.sharedApplication().openURL(NSURL(string: "gplus://plus.google.com/+DakotaWalbeck/posts")!)
            
        } else {
            
            UIApplication.sharedApplication().openURL(NSURL(string: "https://plus.google.com/+DakotaWalbeck/posts")!)
        }

        
    }

}

