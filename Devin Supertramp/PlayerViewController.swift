//
//  PlayerViewController.swift
//  Devin Supertramp
//
//  Created by Michael Wirig on 12/11/14.
//  Copyright (c) 2014 Michael Wirig. All rights reserved.
//

import UIKit



class PlayerViewController: UIViewController, YTPlayerViewDelegate {

    @IBOutlet var mediaPlayer: YTPlayerView!
    
    @IBOutlet weak var loadingImage: UIImageView!
    
    override func viewWillAppear(animated: Bool) {
        
        println(sharedId)
        self.mediaPlayer.delegate = self
        self.mediaPlayer.loadWithVideoId(sharedId)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mediaPlayer.hidden = true
        
    }
    
    
    //This function handles everything that happens when the mediaplayer changes states
    func playerView(playerView: YTPlayerView!, didChangeToState state: YTPlayerState) {
        println("Changed State")
        
        switch state.value {
        case kYTPlayerStatePaused.value:
            println("playerView is paused/done was pressed")
            self.dismissViewControllerAnimated(true, completion: nil)
            
        case kYTPlayerStatePlaying.value:
            println("playerView is playing")
           
            if UIApplication.sharedApplication().isIgnoringInteractionEvents() {
                UIApplication.sharedApplication().endIgnoringInteractionEvents()
            }
            
        case kYTPlayerStateEnded.value:
            println("playerView ended")
            
        case kYTPlayerStateBuffering.value:
            println("playerView is buffering")
            
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


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
