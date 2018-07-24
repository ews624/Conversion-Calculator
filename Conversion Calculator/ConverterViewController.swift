//
//  ConverterViewController.swift
//  Conversion Calculator
//
//  Created by Ethan Schutzenhofer on 7/11/18.
//  Copyright © 2018 Ethan Schutzenhofer. All rights reserved.
//

import UIKit

class ConverterViewController: UIViewController {

    @IBOutlet weak var outputDisplay: UITextField!
    @IBOutlet weak var inputDisplay: UITextField!
    
    @IBOutlet weak var decimalButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    
    @IBOutlet weak var plusMinus: UIButton!

    var choice : Int = 1
    var unit: String = ""
    var count = 0
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    
    @IBAction func convertButton(_ sender: Any) {
        let alert = UIAlertController(title: "Choose a Conversion", message : "", preferredStyle: UIAlertControllerStyle.actionSheet)
        alert.addAction(UIAlertAction(title: "Miles to Kilometers", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            
            //self.count = 0
            self.choice = 1
            self.inputDisplay.text = ""
            self.outputDisplay.text = ""
            
            
        }))
        alert.addAction(UIAlertAction(title: "Kilometers to Miles", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            
            //self.count = 0
            self.choice = 2
            self.inputDisplay.text = ""
            self.outputDisplay.text = ""
            
        }))
        
        alert.addAction(UIAlertAction(title: "Ferenheight to Celcius", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            
            //self.count = 0
            self.choice = 4
            self.inputDisplay.text = ""
            self.outputDisplay.text = ""
           
        }))
        alert.addAction(UIAlertAction(title: "Celcius to Ferenheight", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            
           // self.count = 0
            self.choice = 3
            self.inputDisplay.text = ""
            self.outputDisplay.text = ""
            
        }))
        self.present(alert, animated: true, completion: nil)
    }
        

    
    @IBAction func plusMinus(_ sender: UIButton) {
        
        
        if numbers == ""{
            return
        }
        if numbers == "." {
            return
        }
 
        var new: Double
        
        if let check = Double(numbers),
            check < 0{
            
            new = abs(check)
            numbers = String(new)
            count = 1
            
        }
        if let check = Double(numbers),
            check > 0 {
                numbers = "-" + numbers
            }
        if let check = Double(numbers),
            check == 0 {
            return
        }
        
        inputDisplay.text = numbers + " " + inputs[choice-1]
        
        switch choice {
        case 1:
            //count = 0
            self.outputDisplay.text = self.milesToKM(numbers)
        case 2:
            //count = 0
            self.outputDisplay.text = self.KMToMiles(numbers)
        case 3:
            //count = 0
            self.outputDisplay.text = self.fTC(numbers)
        case 4:
            //count = 0
            self.outputDisplay.text = self.cTF(numbers)
        default:
            self.outputDisplay.text = "default"
        }
        
        
    }
    
    
    
    @IBAction func numbers(_ sender: UIButton) {
       inputDisplay.text = inputDisplay.text! + String(sender.tag)
        
        numbers = inputDisplay.text!
        
        unit = inputs[choice-1]
        
        
        
        switch choice {
        case 1:
            self.outputDisplay.text = self.milesToKM(numbers)
        case 2:
            self.outputDisplay.text = self.KMToMiles(numbers)
        case 3:
            self.outputDisplay.text = self.cTF(numbers)
        case 4:
            self.outputDisplay.text = self.fTC(numbers)
        default:
            self.outputDisplay.text = "default"
        }
        
    }
    
    
    @IBAction func clearButton(_ sender: UIButton) {
        inputDisplay.text = ""
        outputDisplay.text = ""
    }
    
    
    
    var conversions = [Convert(label : "fahrenheit to celcius", input : "°F", output : "°C"),
        Convert(label : "celcius to fahrenheit", input : "°C", output : "°F"),
        Convert(label : "miles to kilometers", input : "mi", output : "km"),
        Convert(label : "kilometers to miles", input : "km", output : "mi")]
    
    var numbers: String = ""
    
    
    var inputs = ["mi", "km", "\u{00B0}F", "\u{00B0}C"]
    var outputs = ["km", "mi", "\u{00B0}C", "\u{00B0}F"]
    
    
    
    
    
    @IBAction func decimalButton(_ sender: UIButton) {
        if count == 0 {
        inputDisplay.text = inputDisplay.text! + "."
            count = 1
        }
    }
    
    
    func milesToKM(_ miles: String) -> String {
        //inputDisplay.text = inputDisplay.text! + "mi"
        let new: Double = Double(miles)!
        let multiplier: Double = 1.61
        
        let total = new * multiplier
        
        return String(total) + "km"
        
    }
    
    func KMToMiles(_ kilometers: String) -> String {
        //inputDisplay.text = inputDisplay.text! + "km"
        let new: Double = Double(kilometers)!
        let multiplier: Double = 0.62
        let total = new * multiplier
        
        return String(total) + "mi"
    }
    
    func fTC(_ ferenheight: String) -> String{
        let new: Double = Double(ferenheight)!
        
        let ferenheight = (new - 32) * (5/9)
        let total : String = String(ferenheight) + "\u{00b0}C"
        return total
    }
    
    func cTF(_ celcius: String) -> String {
        
        let new: Double = Double(celcius)!
        let celcius = new * (9/5) + 32
        let total : String =  String(celcius) + "\u{00b0}F"
        return total
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
