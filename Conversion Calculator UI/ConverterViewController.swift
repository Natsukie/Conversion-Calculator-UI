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
    
    var numberOfScreen:String = "";
    var numbers:Double = 0;
    var choose:Int = 0;
    
    var converters = [Converter(label:"fahrenheit to celcius",input: "°F",output: "°C" ),
                      Converter(label:"celcius to fahrenheit",input: "°C",output: "°F" ),
                      Converter(label:"miles to kilometers",input: "mi",output: "km" ),
                      Converter(label:"kilometers to miles",input: "km",output: "mi" )]
    
    
    @IBAction func numbers(_ sender: UIButton) {
        
        if 0 < sender.tag  && sender.tag < 11{
            numberOfScreen = numberOfScreen + String(sender.tag-1)
            numbers = Double (numberOfScreen)!
        }
        InputDisplay.text = numberOfScreen + converters[choose].input
        OutputDisplay.text = getNumber(inputNumber: numbers, choose: choose) + converters[choose].output
        
        if sender.tag == 11{
            InputDisplay.text = converters[choose].input
            OutputDisplay.text = converters[choose].output
            numberOfScreen = "";
            numbers = 0;
        } else if sender.tag == 12 {
          numbers = numbers * -1
          InputDisplay.text = String(numbers) + converters[choose].input
          OutputDisplay.text = getNumber(inputNumber: numbers, choose: choose) + converters[choose].output
        } else if sender.tag == 13 {
            let character: Character = "."
            let isDecimal = numberOfScreen.contains(character)
            if(isDecimal == true){
                return
            } else {
                numberOfScreen.append(".")
            }
            numbers = Double(numberOfScreen)!
            InputDisplay.text = numberOfScreen + converters[choose].input
            OutputDisplay.text = getNumber(inputNumber: numbers, choose: choose) + converters[choose].output
        }
        
        
        
        
    }
    
    
    func getNumber(inputNumber: Double, choose: Int) -> String{
        switch choose{
        case 0:
            let answer = (inputNumber - 32)*5/9
            let result = String(format:"%.2f", answer)
            return result
        case 1:
            let answer = inputNumber*9/5 + 32
            let result = String(format:"%.2f", answer)
            return result
        case 2:
            let answer = inputNumber*1.60934
            let result = String(format:"%.2f", answer)
            return result
        case 3:
            let answer = inputNumber/1.60934
            let result = String(format:"%.2f", answer)
            return result
        default:
            return "not working properly"
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        InputDisplay.text = "°F"
        OutputDisplay.text = "°C"

        // Do any additional setup after loading the view.
    }
    
    @IBAction func Choose(_ sender: AnyObject) {
        let alert = UIAlertController(title: "Choose Converter", message: "", preferredStyle: UIAlertController.Style.actionSheet)
        
        
        alert.addAction(UIAlertAction(title: converters[0].label, style: UIAlertAction.Style.default, handler: { (UIAlertAction) in
            self.choose = 0
            let check = self.numberOfScreen.rangeOfCharacter(from: .decimalDigits)
            if (check == nil){
            self.InputDisplay.text = self.converters[self.choose].input
            self.OutputDisplay.text = self.converters[self.choose].output
            } else {
                self.OutputDisplay.text = self.getNumber(inputNumber: self.numbers, choose: self.choose) + self.converters[self.choose].output
                self.InputDisplay.text = self.numberOfScreen + self.converters[self.choose].input
            }
        }))
        
        alert.addAction(UIAlertAction(title: converters[1].label, style: UIAlertAction.Style.default, handler: { (UIAlertAction) in
            self.choose = 1
            let check = self.numberOfScreen.rangeOfCharacter(from: .decimalDigits)
            if (check == nil){
                self.InputDisplay.text = self.converters[self.choose].input
                self.OutputDisplay.text = self.converters[self.choose].output
            } else {
                self.OutputDisplay.text = self.getNumber(inputNumber: self.numbers, choose: self.choose) + self.converters[self.choose].output
                self.InputDisplay.text = self.numberOfScreen + self.converters[self.choose].input
            }
        }))
        
        alert.addAction(UIAlertAction(title: converters[2].label, style: UIAlertAction.Style.default, handler: { (UIAlertAction) in
            self.choose = 2
            let check = self.numberOfScreen.rangeOfCharacter(from: .decimalDigits)
            if (check == nil){
                self.InputDisplay.text = self.converters[self.choose].input
                self.OutputDisplay.text = self.converters[self.choose].output
            } else {
                self.OutputDisplay.text = self.getNumber(inputNumber: self.numbers, choose: self.choose) + self.converters[self.choose].output
                self.InputDisplay.text = self.numberOfScreen + self.converters[self.choose].input
            }
        }))
        
        alert.addAction(UIAlertAction(title: converters[3].label, style: UIAlertAction.Style.default, handler: { (UIAlertAction) in
            self.choose = 3
            let check = self.numberOfScreen.rangeOfCharacter(from: .decimalDigits)
            if (check == nil){
                self.InputDisplay.text = self.converters[self.choose].input
                self.OutputDisplay.text = self.converters[self.choose].output
            } else {
                self.OutputDisplay.text = self.getNumber(inputNumber: self.numbers, choose: self.choose) + self.converters[self.choose].output
                self.InputDisplay.text = self.numberOfScreen + self.converters[self.choose].input
            }
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
