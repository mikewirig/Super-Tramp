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
var sharedId = String()


class VidCell: UICollectionViewCell {
    
    
   
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!
      var cellVideoId = String()
    
    
    override init() {
        super.init()
        
        
       
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
        //cancel the share
    
    @IBAction func cancelShare(sender: AnyObject) {
       
        sharing = false
    
    }
    
    @IBAction func sharedFB(sender: AnyObject) {
       
        sharing = false
        sharedTitle = self.titleLabel.text!
        sharedDate = self.releaseDateLabel.text!
        sharedImage = self.thumbnailImageView.image!
        //will also need video url as NSURL
        sharedId = self.cellVideoId

    }
    
    @IBAction func sharedTwitter(sender: AnyObject) {
            sharing = false
        sharedTitle = self.titleLabel.text!
        sharedDate = self.releaseDateLabel.text!
        sharedImage = self.thumbnailImageView.image!
        //will also need video url as NSURL
        sharedId = self.cellVideoId

    }
    
    @IBAction func sharedEmail(sender: AnyObject) {
        sharing = false
        sharedTitle = self.titleLabel.text!
        sharedDate = self.releaseDateLabel.text!
        sharedImage = self.thumbnailImageView.image!
        //will also need video url as NSURL
        sharedId = self.cellVideoId
        
    }
}

