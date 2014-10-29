//
//  VidCell.swift
//  Devin Supertramp
//
//  Created by Michael Wirig on 9/23/14.
//  Copyright (c) 2014 Michael Wirig. All rights reserved.
//

import UIKit

class VidCell: UICollectionViewCell, YTPlayerViewDelegate {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var favoiteImage: UIButton!
   
    @IBOutlet var mediaPlayer: YTPlayerView!
    
    override init() {
        super.init()
        
        self.mediaPlayer.delegate = self
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @IBAction func favorite(sender: AnyObject) {
        println("Favorited \(self.titleLabel.text!)!")
    }
    
    @IBAction func share(sender: AnyObject) {
        println("Shared \(self.titleLabel.text!)!")
        
    }
}
