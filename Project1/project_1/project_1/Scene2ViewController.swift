//
//  Scene2ViewController.swift
//  project_1
//
//  Created by mac on 2018/10/11.
//  Copyright © 2018 Ziyang Yang. All rights reserved.
//

import UIKit

class Scene2ViewController: UIViewController {
    
    @IBOutlet weak var Number: UILabel!
    @IBOutlet weak var Slider: UISlider!
    @IBOutlet weak var Done: UIButton!
    @IBOutlet weak var Reset: UIButton!
    @IBOutlet weak var Scorenum: UILabel!
    @IBOutlet weak var Times: UILabel!
    
    var Data=DataC()
    @IBAction func Slider(_ sender:UISlider){
       //Slider
        let val = sender.value
        Data.currentValue = lroundf(sender.value)
        NSLog("Number is: %.0f", val)
        view.setNeedsDisplay()
    }
    
    @IBAction func Done(_ sender:UIButton){
        
        var difference : Int = 0
        if(Data.currentValue == Data.targetValue){
            let alert1=UIAlertController(title: "Nice job!", message:"You got the correct number: \(Data.targetValue ?? 0)",preferredStyle: UIAlertControllerStyle.alert)
             let okAction1=UIAlertAction(title: "Play one more time!", style:UIAlertActionStyle.default, handler: nil)
             alert1.addAction(okAction1)
             present(alert1, animated:true, completion: nil)
            startNewRound()
            Data.round = Data.round + 1
        }
        else{
            if(Data.currentValue>Data.targetValue){
                difference = Data.currentValue - Data.targetValue
            }
            else if(Data.currentValue<Data.targetValue){
                difference = Data.targetValue-Data.currentValue
            }
            let alert2=UIAlertController(title: "Almost there!", message:"The current number is \(Data.currentValue ?? 0). The target number is \(Data.targetValue ?? 0). The gap is \(difference)",preferredStyle: UIAlertControllerStyle.alert)
        let okAction2=UIAlertAction(title: "Try one more time!", style:UIAlertActionStyle.default, handler: nil)
        alert2.addAction(okAction2)
        present(alert2, animated:true, completion: nil)
        
        }
        Data.score = 100 - difference
        Scorenum.text = String (Data.score)
        Times.text = String (Data.round)
        //Data.totalScore = (Data.score)
    }
    @IBAction func Reset(_ sender: UIButton){
        
        let alert3=UIAlertController(title: "Clear all records?", message:"You have play \(Data.round ?? 0) rounds.",preferredStyle: UIAlertControllerStyle.alert)
        let okAction3=UIAlertAction(title: "Yes", style:UIAlertActionStyle.default, handler: nil)
        alert3.addAction(okAction3)
        present(alert3, animated:true, completion: nil)
        Data.round = 0
        Data.score = 0
        Times.text = String (Data.round)
        Scorenum.text = String (Data.score)
 
    }
    func startNewRound(){
        Data.targetValue=lroundf(Float(1+(arc4random()%100)))
        //Data.currentValue=50
        //Slider.value = Float(Data.currentValue!)
        Data.currentValue=lroundf(Slider.value)
        Number.text = String (Data.targetValue)
        //Scorenum.text = String (Data.score)
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()
         //Data.currentValue=lroundf(Slider.value)
        //Data.targetValue=lroundf(Float(1+(arc4random()%100)))
        // Do any additional setup after loading the view.
        startNewRound()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
