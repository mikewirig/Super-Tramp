//
//  VideosController.swift
//  Devin Supertramp
//
//  Created by Michael Wirig on 9/18/14.
//  Copyright (c) 2014 Michael Wirig. All rights reserved.
//

import UIKit


let reuseIdentifier = "VidCell"




class VideosController: UICollectionViewController {
    
    var imageUrls = [String]()
    var titles = [String]()
    var imageCache = NSMutableDictionary()
    var durs = [String]()
    //    var dates = [String]()
    //    var favorites = [String]()
    //    var videos = [AnyObject]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        

        //PFRequest pulls all video objects
        var query = PFQuery(className:"Video")
        query.orderByDescending("uploadDate")
        query.limit = 1000
        query.findObjectsInBackgroundWithBlock {
            (objects: [AnyObject]!, error: NSError!) -> Void in
            if error == nil {
                
                // The find succeeded.
                NSLog("Successfully retrieved \(objects.count) videos.")
                
                // Do something with the found objects
                for object in objects {
                    var title = object["title"] as String
                    var dur = object["duration"] as String
                    var imageUrl = object["thumbnail"] as String
                    
                    self.durs.append(dur)
                    self.titles.append(title)
                    self.imageUrls.append(imageUrl)
                    
                    
                    self.collectionView?.reloadData()
                    NSLog("%@", object.objectId)
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

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
        cell.thumbnailImageView.image = UIImage(named: "placeHolder")
        //        cell.releaseDateLabel.text = dates[indexPath.row]
    
        var image:UIImage? = self.imageCache.valueForKey(self.imageUrls[indexPath.row]) as? UIImage
        self.imageCache.setValue(image, forKey:self.imageUrls[indexPath.row])
        cell.thumbnailImageView.image = image
        
        if image == nil {
            dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
                
                image = UIImage(data: NSData(contentsOfURL: NSURL(string:self.imageUrls[indexPath.row])))
                cell.thumbnailImageView.image = image;
                self.imageCache.setValue(image, forKey:self.imageUrls[indexPath.row])
                println(self.imageCache)
            })

        }

        cell.backgroundColor = UIColor.blackColor()
        return cell
    

    }//This comment is to show changes in git
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
    
    println("cell \(indexPath.row)")
     
    }
    
    @IBAction func favoriteVideo(sender: AnyObject) {
        println("favorited")
    }
    
    @IBAction func shareVideo(sender: AnyObject) {
        println("Shared")
    }
    
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    func collectionView(collectionView: UICollectionView!, shouldHighlightItemAtIndexPath indexPath: NSIndexPath!) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    func collectionView(collectionView: UICollectionView!, shouldSelectItemAtIndexPath indexPath: NSIndexPath!) -> Bool {
        return true
    }
    */

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
