//
//  ViewController.swift
//  midterm_1
//
//  Created by mac on 2018/10/17.
//  Copyright © 2018 Ziyang Yang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var miles: UITextField!
    @IBOutlet weak var switchWeekly: UISwitch!
    @IBOutlet weak var timeSliderShow: UILabel!
    @IBOutlet weak var workoutButton: UIButton!
    @IBOutlet weak var workIma: UIImageView!
    @IBOutlet weak var fartogo: UILabel!
    @IBOutlet weak var caloriesburn: UILabel!
    @IBOutlet weak var RunSwimBike: UISegmentedControl!
    @IBOutlet weak var timeSlider: UISlider!
    var mydata = vebb()
    var speed:Float = 10
    var cals:Float = 0.0
    //var isSwim:Bool = false
    //var isBike:Bool = false
    
    @IBAction func calculateWorkout(_ sender:UIButton){
        if(miles.text != nil){
            if((Float(miles.text!)!)<30){
                let alert1 = UIAlertController(title: "Too short!", message: "You really should work out more!", preferredStyle: .alert)
                alert1.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Action"), style: .default, handler: {
                    action in self.miles.text="30"
                    self.calculateWorkout(self.workoutButton)
                }))
                let cancelAction = UIAlertAction(title: NSLocalizedString("cancel", comment: "cancelAction"), style: UIAlertActionStyle.cancel, handler: nil)
                alert1.addAction(cancelAction)
                present(alert1, animated: true, completion: nil)
            }
            fartogo.text = String(Float(miles.text!)!/10)+" miles"
            caloriesburn.text = String((Float(miles.text!)!/60)*600)+" cals"
           /*     let distance:Float = (Float(miles.text!)!/speed)
                let Calories:Float = ((Float(miles.text!)!/60)*600)
                fartogo.text = String(format: "%.0f", distance)+" miles"
                caloriesburn.text = String(format: "%.0f", Calories)+" cals"
            
            if isBike{
                fartogo.text = String(Float(miles.text!)!/4)+" miles"
                caloriesburn.text = String(((Float(miles.text!)!/60)*510))+" cals"
            }
            else if isSwim{
                fartogo.text = String(Float(miles.text!)!/30)+" miles"
                caloriesburn.text = String(((Float(miles.text!)!/60)*420))+" cals"
            }
            else{
                let distance:Float = (Float(miles.text!)!/speed)
                let Calories:Float = ((Float(miles.text!)!/60)*600)
                fartogo.text = String(format: "%.0f", distance)+" miles"
                caloriesburn.text = String(format: "%.0f", Calories)+" cals"
                }
 */
            }
        
    }
    @IBAction func workSliderAct(_ sender: UISlider){
        let workact = sender.value
        timeSliderShow.text = String(format: "%.0f", workact)
        mydata.weektimes = workact
    }
    func weeklychange(){
        if(switchWeekly.isOn){
            fartogo.text = String(((Float(miles.text!)!*(mydata.weektimes!))/10))+" miles"
            caloriesburn.text = String(((Float(miles.text!)!/60)*600)*(mydata.weektimes!))+" cals"
        }
        else{
            fartogo.text = String((Float(miles.text!)!/10))+" miles"
            caloriesburn.text = String(((Float(miles.text!)!/60)*600))+" cals"
        }
    }
    @IBAction func monthlySwitchControl(_sender: UISwitch){
        updateMode(RunSwimBike)
    }
    @IBAction func updateMode(_ sender: UISegmentedControl){
        if sender.selectedSegmentIndex == 0{
            workIma.image = UIImage(named: "run")
            speed = 10
            cals = ((Float(miles.text!)!/60)*600)
            //isSwim = false
            //isBike = false
            //calculateWorkout(workoutButton)
        }
        else if sender.selectedSegmentIndex == 1{
            workIma.image = UIImage(named: "swim")
            //speed = 30
            cals = ((Float(miles.text!)!/60)*420)
            //isSwim = true
            //isBike = false
            //calculateWorkout(workoutButton)
            fartogo.text = String(Float(miles.text!)!/30)+" miles"
            caloriesburn.text = String(((Float(miles.text!)!/60)*420))+" cals"
        }
        else if sender.selectedSegmentIndex == 2{
            workIma.image = UIImage(named: "bike")
            //speed = 4
            cals = ((Float(miles.text!)!/60)*510)
            //isSwim = false
            //isBike = true
            //calculateWorkout(workoutButton)
            fartogo.text = String(Float(miles.text!)!/4)+" miles"
            caloriesburn.text = String(((Float(miles.text!)!/60)*510))+" cals"
        }
    }
    @IBAction func RunBikeSwim(_ sender: UISegmentedControl){
        updateMode(RunSwimBike)
    }
    @IBAction func Switchchange(_ sender: UISwitch){
        weeklychange()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        return true
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.miles.delegate = self as? UITextFieldDelegate
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

