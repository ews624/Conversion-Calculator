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
    
    @IBAction func convertButton(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    var conversions = [Convert(label : "fahrenheit to celcius", input : "°F", output : "°C"),
        Convert(label : "celcius to fahrenheit", input : "°C", output : "°F"),
        Convert(label : "miles to kilometers", input : "mi", output : "km"),
        Convert(label : "kilometers to miles", input : "km", output : "mi")]
    
    
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
