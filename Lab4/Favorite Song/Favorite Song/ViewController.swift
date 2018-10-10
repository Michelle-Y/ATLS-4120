//
//  ViewController.swift
//  Favorite Song
//
//  Created by mac on 2018/10/6.
//  Copyright © 2018 Ziyang Yang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var SingerLabel: UILabel!
    @IBOutlet weak var SongLabel: UILabel!
    var mySong = Favorite()
    let filename = "test.plist"
    
    @IBAction func unwindSegue (_ segue:UIStoryboardSegue){
        SongLabel.text=mySong.favSong
        SingerLabel.text=mySong.favSinger
    }
   func dataFileURL(_ filename:String)->URL?{
        let urls = FileManager.default.urls(for:.documentDirectory, in: .userDomainMask)
        var url : URL?
        url = urls.first?.appendingPathComponent(filename)
        return url
    }
 
    override func viewDidLoad() {
        
        let fileURL = dataFileURL(filename)
        if FileManager.default.fileExists(atPath: (fileURL?.path)!){
            let url = fileURL!
            do {
                //creates a data buffer with the contents of the
                let data = try Data(contentsOf: url)
                //create an instance of PropertyListDecoder
                let decoder = PropertyListDecoder()
                mySong = try decoder.decode(Favorite.self, from: data)
                //assign data to textfields
                SongLabel.text=mySong.favSong
                SingerLabel.text=mySong.favSinger
            } catch {
                print("no file")
            }
        } else {
            print("file does not exist")
        }
        let app = UIApplication.shared
        //subscribe to the UIApplicationWillResignActiveNotification notification
        NotificationCenter.default.addObserver(self, selector: #selector(self.applicationWillResignActive(_:)), name: Notification.Name.UIApplicationWillResignActive, object: app)
        super.viewDidLoad()
    }
    @objc func applicationWillResignActive(_ notification: Notification){
        //url of data file
        let fileURL = dataFileURL(filename)
        //create an instance of PropertyListEncoder
        let encoder = PropertyListEncoder()
        //set format type to xml
        encoder.outputFormat = .xml
        do {
            //encode the data using the structure of the Favorite class
            let plistData = try encoder.encode(mySong)
            //write encoded data to the file
            try plistData.write(to: fileURL!)
        } catch {
            print("write error")
        }
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

