//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Laurence Wingo on 10/25/17.
//  Copyright © 2017 Laurence Wingo. All rights reserved.
//


import UIKit

class ConversionViewController: UIViewController, UITextFieldDelegate {
    
    let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    @IBOutlet var celsiusLabel: UILabel!
    @IBOutlet var textField: UITextField!
    
    //Property to hold the fahrenheit value typed in, it's optional because it could have nothing...
    var fahrenheitValue: Double? {
        didSet {
            updateCelsiusLabel()
        }
    }
    //computed property for the Celsius value based on the fahrenheit value...
    var celsiusValue: Double? {
        if let value = fahrenheitValue {
            return (value - 32) * (5/9)
        } else {
            return nil
        }
    }
    
    
    
    @IBAction func fahrenheitFieldEditingChanged(textField: UITextField){
        celsiusLabel.text = textField.text
        if let text = textField.text, let value = Double(text) {
            fahrenheitValue = value
        } else {
            fahrenheitValue = nil
        }
    }
    @IBAction func getRidOfTheKeyboard(sender: AnyObject){
        textField.resignFirstResponder()
    }
    //you want this method to be called whenever the fahrenheit value changes, we do this using a property observer
    func updateCelsiusLabel(){
        if let value = celsiusValue {
            celsiusLabel.text = numberFormatter.string(for: value)
        } else {
            celsiusLabel.text = "???"
        }
    }
    
    //implementing delegate method from UITexfFieldDelegate protocol to gain more control or customization...
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let existingTextHasDecimalSeperator = textField.text?.range(of: ".")
        let replacementTextHasDecimalSeperator = string.range(of: ".")
        let letterCharacters = NSCharacterSet.letters
        let foundCharacter = string.rangeOfCharacter(from: letterCharacters)
        
        if existingTextHasDecimalSeperator != nil && replacementTextHasDecimalSeperator != nil {
            return false
        } else if foundCharacter != nil {
            return false
        } else {
            return true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("CoversationViewController has loaded into the view hiearchy")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("ConversionViewController's views have re-appeared")
        view.backgroundColor = generateRandomColor()
    }
    
    func generateRandomColor() -> UIColor {
        let hue : CGFloat = CGFloat(arc4random() % 256) / 256 // use 256 to get full range from 0.0 to 1.0
        let saturation : CGFloat = CGFloat(arc4random() % 128) / 256 + 0.5 // from 0.5 to 1.0 to stay away from white
        let brightness : CGFloat = CGFloat(arc4random() % 128) / 256 + 0.5 // from 0.5 to 1.0 to stay away from black
        
        return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1)
    }
}
