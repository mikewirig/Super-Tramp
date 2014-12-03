
//  VideosController.swift
//  Devin Supertramp
//
//  Created by Michael Wirig on 9/18/14.
//  Copyright (c) 2014 Michael Wirig. All rights reserved.
//

import UIKit
import Social

let reuseIdentifier = "VidCell"

class VideosController: UICollectionViewController, YTPlayerViewDelegate {
    
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

    
    //share view that appears when video ends/done button pressed
   
    
    @IBOutlet weak var mediaPlayer: YTPlayerView!
           
    override func shouldAutorotate() -> Bool {
        
        return true
    }
    
    override func supportedInterfaceOrientations() -> Int {
        println("second supported")
        return Int(UIInterfaceOrientationMask.Landscape.rawValue)
    }
   
    
    override func viewDidLoad() {
        
        
        
        super.viewDidLoad()
       
      
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        let screenWidth = screenSize.width;
        let screenHeight = screenSize.height;
        
        self.changingWidth = screenWidth
        
        
        sharing = false
        self.mediaPlayer.delegate = self
        self.mediaPlayer.hidden = true
        self.updateView()
        
        shouldAutorotate()
        
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
            self.mediaPlayer.hidden = false
            self.mediaPlayer.loadWithVideoId(self.youtubeIds[indexPath.row])
            println("cell \(indexPath.row)")
            println(self.youtubeIds[indexPath.row])
            
        } else {
            
           
            println("cancel sharing before viewing video")
            
            sharing = false
            
            println(sharing)
            
        }
    }
    
    func playerView(playerView: YTPlayerView!, didChangeToState state: YTPlayerState) {
        println("Changed State")
        
        switch state.value {
        case kYTPlayerStatePaused.value:
            println("playerView is paused/done was pressed")
            self.mediaPlayer.hidden = true
            
            
        case kYTPlayerStatePlaying.value:
            println("playerView is playing")
            
            if self.activityIndicator.isAnimating(){
            self.activityIndicator.stopAnimating()
            }
            
            if UIApplication.sharedApplication().isIgnoringInteractionEvents() {
            UIApplication.sharedApplication().endIgnoringInteractionEvents()
            }
            self.mediaPlayer.hidden = false

            
            self.bufferView.hidden = true
        case kYTPlayerStateEnded.value:
            println("playerView ended")
            
        case kYTPlayerStateBuffering.value:
            println("playerView is buffering")
            
            self.bufferView.hidden = false
            self.bufferView.frame = self.view.frame
            self.bufferView.center = self.view.center
            self.bufferView.backgroundColor = UIColor.grayColor().colorWithAlphaComponent(0.6)
            self.view.addSubview(bufferView)
            
            
            self.activityIndicator.frame = CGRectMake(0, 0, 120, 120)
            self.activityIndicator.center = self.view.center
            self.activityIndicator.hidesWhenStopped = true
            self.activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.WhiteLarge
            self.bufferView.addSubview(activityIndicator)
            self.activityIndicator.startAnimating()
            UIApplication.sharedApplication().beginIgnoringInteractionEvents()
            
            
        case kYTPlayerStateUnstarted.value:
            println("playerView is unstarted")
        
        default:
            println("playerView State changed")

        }
        
    }
    
    func playerViewDidBecomeReady(playerView: YTPlayerView!) {
        self.mediaPlayer.playVideo()
    }
    
    //social sharing code
    
    @IBAction func twitterShare(sender: AnyObject) {
        println("shared \(sharedTitle) to twitter")
        
        var twitterShare : SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
        
        var sharedUrl = NSURL(string: "www.youtube.com/watch?v=" + sharedId)
        twitterShare.setInitialText("Check out this sweet video! #teamsupertramp")
        twitterShare.addURL(sharedUrl)
        
        
        self.presentViewController(twitterShare, animated: true, completion: nil)
    }
    
    @IBAction func facebookShare(sender: AnyObject) {
        println("shared \(sharedTitle) to facebook")
        
        
        var fbShare : SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
        
        var sharedUrl = NSURL(string: "www.youtube.com/watch?v=" + sharedId)
        
        fbShare.setInitialText("Check out this sweet video! #teamsupertramp")
        fbShare.addURL(sharedUrl)
        
        
        
        self.presentViewController(fbShare, animated: true, completion: nil)
        
        
    }

    @IBAction func emailShare(sender: AnyObject) {
        println("shared to email")
        
        var address = " "
        var subject = "Check out this Awesome Video!"
        var body =  "www.youtube.com/watch?v=" + sharedId
        var path = "mailto:\(address)?&subject=\(subject)&body=\(body)"
        println(path)
        var url = NSURL(string: path.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!)
        
        UIApplication.sharedApplication().openURL(url!)
        
    }
    
    // MARK: UICollectionViewDelegate
    
    
        
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

