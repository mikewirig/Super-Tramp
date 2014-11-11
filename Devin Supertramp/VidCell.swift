//
//  VidCell.swift
//  Devin Supertramp
//
//  Created by Michael Wirig on 9/23/14.
//  Copyright (c) 2014 Michael Wirig. All rights reserved.
//

import UIKit

var sharedTitle = String()
var sharedDate = String()
var sharedImage = UIImage()
var sharing = Bool()

class VidCell: UICollectionViewCell {
    
    
    @IBOutlet weak var shareView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var favoiteImage: UIButton!
    
    @IBOutlet weak var shareTitleLabel: UILabel!
    @IBOutlet weak var shareImageView: UIImageView!
    
    override init() {
        super.init()
        
        self.shareView.center.x = self.center.x - 320
        self.shareView.center.y = self.center.y
        self.shareView.hidden = true
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    @IBAction func favorite(sender: AnyObject) {
        println("Favorited \(self.titleLabel.text!)!")
    }
    
    @IBAction func share(sender: AnyObject) {
        println("Shared \(self.titleLabel.text!)!")
        
        
        //display the shareView
        self.shareView.hidden = false
        self.shareView.center = self.center
        
        //set the necessary data to global variables
        sharing = true
        sharedTitle = self.titleLabel.text!
        sharedDate = self.releaseDateLabel.text!
        sharedImage = self.thumbnailImageView.image!
        //will also need video url as NSURL
        
        //set the image and title outlets in the shareView
        self.shareImageView.image = sharedImage
        self.shareTitleLabel.text = sharedTitle
        
    }
    //cancel the share
    @IBAction func cancelShare(sender: AnyObject) {
        self.shareView.center.x = self.center.x - 320
        self.shareView.center.y = self.center.y
        self.shareView.hidden = true
        sharing = false
    }

    @IBAction func facebookPressed(sender: AnyObject) {
        self.shareView.center.x = self.center.x - 320
        self.shareView.center.y = self.center.y
        self.shareView.hidden = true
        sharing = false
        
    }
    @IBAction func twitterPressed(sender: AnyObject) {
        self.shareView.center.x = self.center.x - 320
        self.shareView.center.y = self.center.y
        self.shareView.hidden = true
        sharing = false
    }
}
