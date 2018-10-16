//
//  Scene3ViewController.swift
//  project_1
//
//  Created by mac on 2018/10/11.
//  Copyright © 2018 Ziyang Yang. All rights reserved.
//

import UIKit

class Scene3ViewController: UIViewController {
    
    @IBOutlet weak var MovieImage: UIImageView!
    @IBOutlet weak var Question: UILabel!
    
    @IBOutlet weak var Answer1: UIButton!
    @IBOutlet weak var Answer2: UIButton!
    @IBOutlet weak var Answer3: UIButton!
    @IBOutlet weak var Answer4: UIButton!
    
    
    var questionPro = [Int:[String]]()
    var counter:Int = 0
    var CorrectAnsCount:Float=0
    var IncorrectAnsCount:Float=0
    
    func questionAns(){
        if(questionPro[counter] != nil){
            Question.text = questionPro[counter]?[0]
            Answer1.setTitle(questionPro[counter]?[1], for: .normal)
            Answer2.setTitle(questionPro[counter]?[2], for: .normal)
            Answer3.setTitle(questionPro[counter]?[3], for: .normal)
            Answer4.setTitle(questionPro[counter]?[4], for: .normal)
            counter+=1
            NSLog("Correct: \(CorrectAnsCount)");
            NSLog("Incorrect: \(IncorrectAnsCount)");
            if(counter==1){
                MovieImage.image=UIImage(named: "question1Ima")
            }
            else if(counter==2){
                MovieImage.image=UIImage(named: "question2Ima")
            }
            else if(counter==3){
                MovieImage.image=UIImage(named: "question3Ima")
            }
            else if(counter==4){
                MovieImage.image=UIImage(named: "question4Ima")
            }
            else if(counter==5){
                MovieImage.image=UIImage(named: "question5Ima")
            }
            else if(counter==6){
                MovieImage.image=UIImage(named: "question6Ima")
            }
        }
        else{
            let score = ((CorrectAnsCount)/(CorrectAnsCount+IncorrectAnsCount))*100
            NSLog("Correct: \(CorrectAnsCount)");
            NSLog("Incorrect: \(IncorrectAnsCount)");
            Question.text="Congratulation! Your score is \(score)%.\nClick any button to play again!"
            Answer1.setTitle("", for: .normal)
            Answer2.setTitle("", for: .normal)
            Answer3.setTitle("", for: .normal)
            Answer4.setTitle("", for: .normal)
            counter=0
            CorrectAnsCount = 0
            IncorrectAnsCount = -1
        }
    }
    @IBAction func Answer1(_ sender: UIButton){
        if(questionPro[counter-1]?[5]=="1"){
            CorrectAnsCount+=1
            let alert1=UIAlertController(title: "Nice job!", message:"You're correct!",preferredStyle: UIAlertControllerStyle.alert)
            let okAction1=UIAlertAction(title: "Got it", style:UIAlertActionStyle.default, handler: nil)
            alert1.addAction(okAction1)
            present(alert1, animated:true, completion: nil)
            
        }
        else{
            IncorrectAnsCount+=1
            let alertw1=UIAlertController(title: "Wow!", message:"You are wrong, try next time!",preferredStyle: .alert)
            let cancelAction1=UIAlertAction(title: "Got it", style:UIAlertActionStyle.default, handler: nil)
            alertw1.addAction(cancelAction1)
            present(alertw1, animated:true, completion: nil)
 
        }
        questionAns()
    }
    @IBAction func Answer2(_ sender: UIButton){
        
        if(questionPro[counter-1]?[5]=="2"){
            CorrectAnsCount+=1
            let alert2=UIAlertController(title: "Nice job!", message:"You're correct!",preferredStyle: UIAlertControllerStyle.alert)
            let okAction2=UIAlertAction(title: "Got it", style:UIAlertActionStyle.default, handler: nil)
            alert2.addAction(okAction2)
            present(alert2, animated:true, completion: nil)
           
        }
        else{
            IncorrectAnsCount+=1
            let alertw2=UIAlertController(title: "Wow!", message:"You are wrong, try next time!",preferredStyle: .alert)
            let cancelAction2=UIAlertAction(title: "Got it", style:UIAlertActionStyle.default, handler: nil)
            alertw2.addAction(cancelAction2)
            present(alertw2, animated:true, completion: nil)
        }
        questionAns()
    }
    @IBAction func Answer3(_ sender: UIButton){
        if(questionPro[counter-1]?[5]=="3"){
            CorrectAnsCount+=1
            let alert3=UIAlertController(title: "Nice job!", message:"You're correct!",preferredStyle: UIAlertControllerStyle.alert)
            let okAction3=UIAlertAction(title: "Got it", style:UIAlertActionStyle.default, handler: nil)
            alert3.addAction(okAction3)
            present(alert3, animated:true, completion: nil)
        }
        else{
            IncorrectAnsCount+=1
            let alertw3=UIAlertController(title: "Wow!", message:"You are wrong, try next time!",preferredStyle: .alert)
            let cancelAction3=UIAlertAction(title: "Got it", style:UIAlertActionStyle.default, handler: nil)
            alertw3.addAction(cancelAction3)
            present(alertw3, animated:true, completion: nil)
        }
        questionAns()
    }
    @IBAction func Answer4(_ sender: UIButton){
        if(questionPro[counter-1]?[5]=="4"){
            CorrectAnsCount+=1
            let alert4=UIAlertController(title: "Nice job!", message:"You're correct!",preferredStyle: UIAlertControllerStyle.alert)
            let okAction4=UIAlertAction(title: "Got it", style:UIAlertActionStyle.default, handler: nil)
            alert4.addAction(okAction4)
            present(alert4, animated:true, completion: nil)
        }
        else{
            IncorrectAnsCount+=1
            let alertw4=UIAlertController(title: "Wow!", message:"You are wrong, try next time!",preferredStyle: .alert)
            let cancelAction4=UIAlertAction(title: "Got it", style:UIAlertActionStyle.default, handler: nil)
            alertw4.addAction(cancelAction4)
            present(alertw4, animated:true, completion: nil)
        }
        questionAns()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        questionPro[0] = ["What magical creatures lead Merida to a witch in 'Brave'?", "Goblins", "Will O’ The Wisps", "Ghosts", "Selkies", "2"]
        questionPro[1] = ["Who voiced Remy in 'Ratatouille'?", "David Cross", "Louis C.K.", "Tim Allen", "Patton Oswalt", "4"]
        questionPro[2] = ["What's the name of the ball with a star that appears in many Pixar films?", "Bouncers", "Andy’s Ball", "The Luxo Ball", "The BNL Ball", "3"]
        questionPro[3] = ["What fraternity does Mike Wazowski join in 'Monsters University'?", "Roar Omega Roar", "Sigma Fear Omega", "Oozma Kappa", " Alpha Scarems", "3"]
        questionPro[4] = ["Who voiced Stinky Pete in ‘Toy Story2’?", "John Ratzenberger", "Kelsey Grammer", "Ted Danson", "Woody Harreison", "2"]
        questionPro[5] = ["The movie “WALL-E” features a robot of the same name. What is his job?", "Trash Collector", "Gardener", "Waiter", "Driver", "1"]
        questionAns()
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
    /*reference:
     https://www.macx.cn/thread-2116864-1-1.html
     http://www.cocoachina.com/ios/20160301/15328.html
     http://www.cocoachina.com/ios/20171017/20814.html
     */
    
}
