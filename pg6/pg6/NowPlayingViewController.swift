//
//  NowPlayingViewController.swift
//  pg6
//
//  Created by Ben Harris on 12/4/16.
//  Copyright © 2016 benharris. All rights reserved.
//

import UIKit
import AVFoundation

class NowPlayingViewController: UIViewController {
    
    var player: AVAudioPlayer?
//    @IBOutlet var AlbumArtImageView: UIImageView!

    
    func playSongFromFile (songURL: NSURL) {
        
        do {
            try player = AVAudioPlayer(contentsOfURL: songURL)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        
        player!.play()
        
        let barePath = songURL.URLByDeletingPathExtension!.absoluteString + ".jpg"
        if let url = NSURL(string: barePath) {
            if let data = NSData(contentsOfURL: url) {
                if let img = UIImage(data: data) {
                    let imgView: UIImageView = UIImageView(image: img)
                    self.view.addSubview(imgView)
//                    AlbumArtImageView?.image = img
                }
            }
        }
        
    }



    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
