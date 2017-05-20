//
//  MP3ListTableViewController.swift
//  pg6
//
//  Created by Ben Harris on 12/4/16.
//  Copyright © 2016 benharris. All rights reserved.
//

import UIKit


struct MP3Song {
    var songURL: NSURL
    var songName: String
    
    init(songURL: NSURL, songName: String) {
        self.songURL = songURL
        self.songName = songName
    }
}

class MP3ListTableViewController: UITableViewController {
    
    var mp3s: [MP3Song] = []
    var nowPlayingViewController: NowPlayingViewController?
    
//    #warning you need to do this
    let songPath = "/Users/cs344student/benharri/pg6/"
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        self.clearsSelectionOnViewWillAppear = true
        
        let files = NSFileManager().enumeratorAtPath(songPath)
        while let file = files?.nextObject() {
            if file.pathExtension == "mp3" {
//                print(file)
                let song:MP3Song = MP3Song(songURL: NSURL(fileURLWithPath: songPath + (file as! String)), songName: file as! String)
                
                mp3s.append(song)
            }
        }
        
        let barViewControllers = tabBarController?.viewControllers
        nowPlayingViewController = barViewControllers![1] as? NowPlayingViewController
//        nowPlayingViewController!.setCurrentSongPath(songPath)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
//        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return mp3s.count
//        return 0
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MP3Cell", forIndexPath: indexPath)

        // Configure the cell...
        cell.textLabel!.text = (mp3s[indexPath.row].songName)

        return cell
    }
    

    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
//        print(mp3s[indexPath.row])
        
        nowPlayingViewController!.playSongFromFile(mp3s[indexPath.row].songURL)

        tabBarController?.selectedIndex = 1
        
    }
    
    // MARK: - Navigation
    /*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "playMP3" {
            print("playing MP3 maybe")
            (segue.destinationViewController as! NowPlayingViewController).setCurrentFileName((mp3s[self.tableView.indexPathForSelectedRow!.row] as! String) as String)
        }
    }
    */
    
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    

}
