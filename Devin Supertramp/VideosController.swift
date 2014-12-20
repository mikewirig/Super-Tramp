
//  VideosController.swift
//  Devin Supertramp
//
//  Created by Michael Wirig on 9/18/14.
//  Copyright (c) 2014 Michael Wirig. All rights reserved.
//

import UIKit
import Social

let reuseIdentifier = "VidCell"


class VideosController: UICollectionViewController {
    
    var shareView = UIView()
    var imageUrls = [String]()
    var titles = [String]()
    var imageCache = NSMutableDictionary()
    var durs = [String]()
    var dates = [String]()
    var youtubeIds = [String]()
    var videoObjects = [AnyObject]()
    var url = NSURL()
    var activityIndicator = UIActivityIndicatorView()
    var bufferView = UIView()
    var changingWidth = CGFloat()

    
   
    
    
    
    //view did load function
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        canRotate = false
        
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        let screenWidth = screenSize.width;
        let screenHeight = screenSize.height;
        
        self.changingWidth = screenWidth
        
        sharing = false
        self.updateView()
    }
    
    
    func updateView() {
        
        //PFRequest pulls all video objects
        var query = PFQuery(className:"Video")
        query.orderByDescending("uploadDate")
        query.limit = 1000
        query.findObjectsInBackgroundWithBlock {
            (objects: [AnyObject]!, error: NSError!) -> Void in
            if error == nil {
                
                // The find succeeded.
                NSLog("Successfully retrieved \(objects.count) videos.")
                self.videoObjects = objects
                //                 Do something with the found objects
                for object in objects {
                    var title = object["title"] as String
                    var dur = object["duration"] as String
                    var imageUrl = object["thumbnail"] as String
                    var date = object["timeElapsed"] as String
                    var id = object["youtubeId"] as String
                    
                    
                    self.durs.append(dur)
                    self.titles.append(title)
                    self.imageUrls.append(imageUrl)
                    self.dates.append(date)
                    self.youtubeIds.append(id)
                    
                    self.collectionView.reloadData()
                }
                
            } else {
                // Log details of the failure
                NSLog("Error: %@ %@", error, error.userInfo!)
            }
            
        }//end query
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
     // MARK: UICollectionViewDataSource
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        //#warning Incomplete method implementation -- Return the number of sections
        return 1
    }
    
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //#warning Incomplete method implementation -- Return the number of items in the section
        return self.titles.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> VidCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as VidCell
        
        // Configure the cell
    
        cell.titleLabel.text = self.titles[indexPath.row]
        cell.durationLabel.text = self.durs[indexPath.row]
        cell.releaseDateLabel.text = self.dates[indexPath.row]
        
        self.url = NSURL(string: self.imageUrls[indexPath.row])!
        cell.cellVideoId = self.youtubeIds[indexPath.row]
        cell.thumbnailImageView.sd_setImageWithURL(url)
        
            
        cell.backgroundColor = UIColor.lightGrayColor()
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        return CGSizeMake(changingWidth, 275)
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        if sharing == false {
            
            sharedId = self.youtubeIds[indexPath.row]
            println("cell \(indexPath.row)")
            println(self.youtubeIds[indexPath.row])
            
        } else {
            
            println("cancel sharing before viewing video")
            
            sharing = false
            
            println(sharing)
            
        }
    }
//       //social sharing code
    
    @IBAction func twitterShare(sender: AnyObject) {
        println("shared \(sharedTitle) to twitter")
        self.twitterPerformShare()
        
    }
    
    func twitterPerformShare(){
       
        var twitterShare : SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
        
        var sharedUrl = NSURL(string: "www.youtube.com/watch?v=" + sharedId)
        twitterShare.setInitialText("Check out this sweet video! #teamsupertramp")
        twitterShare.addURL(sharedUrl)
        
        
        self.presentViewController(twitterShare, animated: true, completion: nil)

    }
    
    @IBAction func facebookShare(sender: AnyObject) {
        println("shared \(sharedTitle) to facebook")
        println(sharedId)
        
        self.performFBShare()
    }
    
    func performFBShare() {
        
        var fbShare : SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
        
        var sharedUrl = NSURL(string: "www.youtube.com/watch?v=" + sharedId)
        
        fbShare.setInitialText("Check out this sweet video! #teamsupertramp")
        fbShare.addURL(sharedUrl)
        
        self.presentViewController(fbShare, animated: true, completion: nil)

    }

    @IBAction func emailShare(sender: AnyObject) {
        println("shared to email")
        println(sharedId)
        
        self.performEmailShare()
        
        }
    
    func performEmailShare() {
       
        var address = " "
        var subject = "Check out this Awesome Video!"
        var body =  "www.youtube.com/watch?v=\(sharedId)"
        var path = "mailto:\(address)?&subject=\(subject)&body=\(body)"
        println(path)
        var url = NSURL(string: path.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!)
        
        UIApplication.sharedApplication().openURL(url!)
        
    }
    
   
    
    
        
    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    func collectionView(collectionView: UICollectionView!, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath!) -> Bool {
    return false
    }
    
    func collectionView(collectionView: UICollectionView!, canPerformAction action: String!, forItemAtIndexPath indexPath: NSIndexPath!, withSender sender: AnyObject!) -> Bool {
    return false
    }
    
    func collectionView(collectionView: UICollectionView!, performAction action: String!, forItemAtIndexPath indexPath: NSIndexPath!, withSender sender: AnyObject!) {
    
    }
    */
    
}

