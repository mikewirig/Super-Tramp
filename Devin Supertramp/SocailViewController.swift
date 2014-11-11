//
//  SocailViewController.swift
//  Devin Supertramp
//
//  Created by Michael Wirig on 11/4/14.
//  Copyright (c) 2014 Michael Wirig. All rights reserved.
//

import UIKit

class SocailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  
    @IBAction func youTubeSubscribe(sender: AnyObject) {
        
        println("Subscribed to Youtube Channel")
        
        if UIApplication.sharedApplication().canOpenURL(NSURL(string: "youtube://channel/devinsupertramp")!){
            
            UIApplication.sharedApplication().openURL(NSURL(string: "youtube://channel/devinsupertramp")!)
            
        } else {
            
        UIApplication.sharedApplication().openURL(NSURL(string: "http://www.youtube.com/user/devinsupertramp")!)
        }
    }

  
    @IBAction func twitterFollow(sender: AnyObject) {
        
        println("Followed on Twitter")
        
        if UIApplication.sharedApplication() .canOpenURL(NSURL(string: "twitter://user?screen_name=devinsupertramp")!) {

        UIApplication.sharedApplication().openURL(NSURL(string: "twitter://user?screen_name=devinsupertramp")!)
            
        } else {
            
            UIApplication.sharedApplication().openURL(NSURL(string: "https://twitter.com/devinsupertramp")!)
        }
            }
    
   
    @IBAction func intsagramFollow(sender: AnyObject) {
       
        println("Followed on Instagram")
        
        if UIApplication.sharedApplication() .canOpenURL(NSURL(string: "instagram://user?username=devinsupertramp")!){
            
             UIApplication.sharedApplication().openURL(NSURL(string: "instagram://user?username=devinsupertramp")!)
        } else {
            
            UIApplication.sharedApplication().openURL(NSURL(string: "http://instagram.com/devinsupertramp")!)
        }
       
    }
   
  
    @IBAction func facebookFollow(sender: AnyObject) {
        println("Liked Facebook page")
        
        if UIApplication.sharedApplication().canOpenURL(NSURL(string: "fb://profile/165050690179330")!) {
        
            UIApplication.sharedApplication().openURL(NSURL(string: "fb://profile/165050690179330")!)
            
        } else {
            
            UIApplication.sharedApplication().openURL(NSURL(string: "https://www.facebook.com/devinsupertrampyoutube?fref=ts")!)
        }
    }
    
    
  
    @IBAction func googleFollow(sender: AnyObject) {
        println("Followed on Google+")
        
        if UIApplication.sharedApplication().canOpenURL(NSURL(string: "gplus://plus.google.com/104845842837016673586/posts")!) {
            
            UIApplication.sharedApplication().openURL(NSURL(string: "gplus://plus.google.com/104845842837016673586/posts")!)
            
        } else {
            
            UIApplication.sharedApplication().openURL(NSURL(string: "https://plus.google.com/104845842837016673586/posts")!)
        }

    }
    
    
   
    @IBAction func blogFollow(sender: AnyObject) {
        println("Followed the Blog")
        
        UIApplication.sharedApplication().openURL(NSURL(string: "http://devingraham.blogspot.com")!)
    }
    
    
   
    @IBAction func sendEmail(sender: AnyObject) {
        println("Sent an Email")
        
        UIApplication.sharedApplication().openURL(NSURL(string:"twitter://post?message=Check%20out%20this%20awesome%20video!")!)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
//    twitter://user?screen_name=lorenb
//    
//    twitter://user?id=12345
//    
//    twitter://status?id=12345
//    
//    twitter://timeline
//    
//    twitter://mentions
//    
//    twitter://messages
//    
//    twitter://list?screen_name=lorenb&slug=abcd
//    
//    twitter://post?message=hello%20world
//    
//    twitter://post?message=hello%20world&in_reply_to_status_id=12345
//    
//    twitter://search?query=%23hashtag
    //"twitter://post?message="https://www.youtube.com/watch?v=oc1HDF2AyNE"

}
