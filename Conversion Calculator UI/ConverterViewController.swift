//
//  ConverterViewController.swift
//  Conversion Calculator UI
//
//  Created by Guangzu on 7/11/19.
//  Copyright © 2019 Guangzu. All rights reserved.
//

import UIKit

class ConverterViewController: UIViewController {

    @IBOutlet weak var OutputDisplay: UITextField!
    
    @IBOutlet weak var InputDisplay: UITextField!
    
    var converters = [Converter(label:"fahrenheit to celcius",input: "°F",output: "°C" ),
                      Converter(label:"celcius to fahrenheit",input: "°C",output: "°F" ),
                      Converter(label:"miles to kilometers",input: "mi",output: "km" ),
                      Converter(label:"kilometers to miles",input: "km",output: "mi" )]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        InputDisplay.text = "°F"
        OutputDisplay.text = "°C"

        // Do any additional setup after loading the view.
    }
    
    @IBAction func Choose(_ sender: AnyObject) {
        let alert = UIAlertController(title: "Choose Converter", message: "", preferredStyle: UIAlertController.Style.actionSheet)
       
        alert.addAction(UIAlertAction(title: converters[0].label, style: UIAlertAction.Style.default, handler: { (UIAlertAction) in
            self.InputDisplay.text = self.converters[0].input
            self.OutputDisplay.text = self.converters[0].output
        }))
        
        alert.addAction(UIAlertAction(title: converters[1].label, style: UIAlertAction.Style.default, handler: { (UIAlertAction) in
            self.InputDisplay.text = self.converters[1].input
            self.OutputDisplay.text = self.converters[1].output
        }))
        
        alert.addAction(UIAlertAction(title: converters[2].label, style: UIAlertAction.Style.default, handler: { (UIAlertAction) in
            self.InputDisplay.text = self.converters[2].input
            self.OutputDisplay.text = self.converters[2].output
        }))
        
        alert.addAction(UIAlertAction(title: converters[3].label, style: UIAlertAction.Style.default, handler: { (UIAlertAction) in
            self.InputDisplay.text = self.converters[3].input
            self.OutputDisplay.text = self.converters[3].output
        }))
            
        
        self.present(alert, animated: true, completion: nil)
        
        
        
        
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
