//
//  Scene2ViewController.swift
//  Favorite Song
//
//  Created by mac on 2018/10/6.
//  Copyright © 2018 Ziyang Yang. All rights reserved.
//

import UIKit

class Scene2ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var SongName: UITextField!
    @IBOutlet weak var SingerName: UITextField!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "doneFavs"{
            let scene1ViewController = segue.destination as! ViewController
            if SongName.text!.isEmpty==false{
                scene1ViewController.mySong.favSong=SongName.text
            }
            if SingerName.text!.isEmpty==false{
                scene1ViewController.mySong.favSinger=SingerName.text
            }
        }
    }
    override func viewDidLoad() {
       
        SongName.delegate=self
        SingerName.delegate=self
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
