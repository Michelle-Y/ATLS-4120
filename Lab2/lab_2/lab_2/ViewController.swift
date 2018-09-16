//
//  ViewController.swift
//  lab_2
//
//  Created by mac on 2018/9/15.
//  Copyright © 2018 Ziyang Yang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var Imageview: UIImageView!
    @IBOutlet weak var segmChange: UISegmentedControl!
    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var colorGreen: UIButton!
    @IBOutlet weak var colorBlue: UIButton!
    
    @IBOutlet weak var sliderLabel: UILabel!
    @IBOutlet weak var slidercontrol: UISlider!
    
    @IBOutlet weak var SwitchLabel: UILabel!
    @IBOutlet weak var switchcontrol: UISwitch!
    
    @IBAction func changeSeg(_ sender:UISegmentedControl){
        if sender.selectedSegmentIndex == 0{
            Imageview.image = UIImage(named: "black")
            TitleLabel.text = "b&w photo"
            changeSwitch(switchcontrol)
        }else{
            Imageview.image = UIImage(named: "color")
            TitleLabel.text = "color photo"
            changeSwitch(switchcontrol)
        }
    }
    
    @IBAction func changeFont(_ sender:UISlider){
        let fontsize = sender.value
        sliderLabel.text = String(format: "%.0f",fontsize)
        TitleLabel.font = UIFont.systemFont(ofSize: CGFloat(fontsize))
    }
    
    @IBAction func changeSwitch(_ sender: UISwitch){
        if sender.isOn{
            TitleLabel.text = TitleLabel.text?.uppercased()
        }
        else{
            TitleLabel.text = TitleLabel.text?.lowercased()
        }
    }
    @IBAction func changecolorG(_ sender:UIButton){
        TitleLabel.textColor = UIColor.green
    }
    @IBAction func changecolorB(_ sender:UIButton){
        TitleLabel.textColor = UIColor.blue
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

