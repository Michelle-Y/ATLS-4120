//
//  ViewController.swift
//  lab_1
//
//  Created by mac on 2018/9/11.
//  Copyright © 2018 Ziyang Yang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var Aimage: UIImageView!
    @IBOutlet weak var helloLable: UILabel!
    @IBAction func buttonchi(_ sender: UIButton) {
        helloLable.text="你好，世界！"
        Aimage.image=UIImage(named: "chi")
    }
    @IBAction func buttonjap(_ sender: UIButton) {
        helloLable.text="こんにちは,世界。"
        Aimage.image=UIImage(named: "jap")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

