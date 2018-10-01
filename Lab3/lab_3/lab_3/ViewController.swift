//
//  ViewController.swift
//  lab_3
//
//  Created by mac on 2018/9/30.
//  Copyright © 2018 Ziyang Yang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var CostDollar_Mon: UITextField!
    @IBOutlet weak var CostDollar_Tues: UITextField!
    @IBOutlet weak var CostDollar_Wed: UITextField!
    @IBOutlet weak var CostDollar_Thur: UITextField!
    
    @IBOutlet weak var CostDollar_Fri: UITextField!
    @IBOutlet weak var CostDollar_Sat: UITextField!
    @IBOutlet weak var CostDollar_Sun: UITextField!
    @IBOutlet weak var TotalCost: UILabel!
    @IBOutlet weak var AvgCost: UILabel!
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        return true
    }
    @IBAction func CalculateCostButt(_ sender: UIButton){
        var amount: Float = 0.0
        //var avg: Float
        if(CostDollar_Mon.text!.isEmpty || CostDollar_Tues.text!.isEmpty || CostDollar_Wed.text!.isEmpty || CostDollar_Thur.text!.isEmpty || CostDollar_Fri.text!.isEmpty || CostDollar_Sat.text!.isEmpty || CostDollar_Sun.text!.isEmpty){
            let alert = UIAlertController(title: "Fields Empty", message: "Please make sure you fill out the cost.", preferredStyle: .alert)
            let okAction=UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {action in
                self.CostDollar_Mon.text="0"
            }) //alert.addAction(UIAlertAction(title:NSLocalizedString("OK", comment: "Default action"), style: .default, handler:{_ in NSLog("The \"OK\" alert occured.")}))
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        }else{
            //Float amount = 0.0
            /*if(CostDollar_Mon.text != ""){
                amount = amount + Float(CostDollar_Mon.text!)!
            }
            if(CostDollar_Tues.text != ""){
                amount = amount + Float(CostDollar_Mon.text!)!
            }
            if(CostDollar_Wed.text != ""){
                amount = amount + Float(CostDollar_Mon.text!)!
            }
            if(CostDollar_Thur.text != ""){
                amount = amount + Float(CostDollar_Mon.text!)!
            }
            if(CostDollar_Fri.text != ""){
                amount = amount + Float(CostDollar_Mon.text!)!
            }
            if(CostDollar_Sat.text != ""){
                amount = amount + Float(CostDollar_Mon.text!)!
            }
            if(CostDollar_Sun.text != ""){
                amount = amount + Float(CostDollar_Mon.text!)!
            }
            */
           amount = Float(CostDollar_Mon.text!)!+Float(CostDollar_Tues.text!)!+Float(CostDollar_Wed.text!)!+Float(CostDollar_Thur.text!)!+Float(CostDollar_Fri.text!)!+Float(CostDollar_Sat.text!)!+Float(CostDollar_Sun.text!)!
        }
        let avg = amount/7
        let currencyFormatter = NumberFormatter()
        currencyFormatter.numberStyle=NumberFormatter.Style.currency
        TotalCost.text=currencyFormatter.string(from: NSNumber(value: amount))
        AvgCost.text=currencyFormatter.string(from: NSNumber(value: avg))
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.CostDollar_Mon.delegate = self as? UITextFieldDelegate
        self.CostDollar_Tues.delegate = self as? UITextFieldDelegate
        self.CostDollar_Wed.delegate = self as? UITextFieldDelegate
        self.CostDollar_Thur.delegate = self as? UITextFieldDelegate
        self.CostDollar_Fri.delegate = self as? UITextFieldDelegate
        self.CostDollar_Sat.delegate = self as? UITextFieldDelegate
        self.CostDollar_Sun.delegate = self as? UITextFieldDelegate
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

