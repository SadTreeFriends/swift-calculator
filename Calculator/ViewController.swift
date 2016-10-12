//
//  ViewController.swift
//  Calculator
//
//  Created by Chuning Song on 11/08/2016.
//  Copyright © 2016 Chuning Song. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet fileprivate weak var display: UILabel!
    
    fileprivate var userInTheMiddleOfTyping = false
    
    @IBAction fileprivate func touchDigit(_ sender: UIButton){
        let digit = sender.currentTitle!
        if userInTheMiddleOfTyping == true {
            let textCurrentlyInDisplay = display.text!
            display.text = textCurrentlyInDisplay + digit
        } else {
            display.text = digit
        }
        
        userInTheMiddleOfTyping = true
    }

    fileprivate var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
    }
    
    fileprivate var brain = CalculatorBrain()
    
    @IBAction fileprivate func performAction(_ sender: UIButton) {
        if userInTheMiddleOfTyping {
            brain.setOperand(displayValue)
            userInTheMiddleOfTyping = false
        }
        if let mathematicalSymbol = sender.currentTitle {
            brain.performOperation(mathematicalSymbol)
        }
        displayValue = brain.result
    
    }
    

}

