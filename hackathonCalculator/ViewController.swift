//
//  ViewController.swift
//  hackathonCalculator
//
//  Created by Jada White on 4/20/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var outputLabel: UILabel!
    
    var firstNum = 0.0
    var secondNum = 0.0
    var result = 0.0
    var operation = ""
    
    @IBAction func numberButtonPressed(_ sender: UIButton) {
        switch sender.currentTitle! {
        case "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", ".":
            return outputLabel.text = outputLabel.text!.appending(sender.currentTitle!)
        default:
            print("Cannot access number button.")
        }
    }
    
    
    @IBAction func dataButtonPressed(_ sender: UIButton) {
        switch sender.currentTitle! {
        case "AC":
            outputLabel.text!.removeAll()
        case "+/-":
            if outputLabel.text!.hasPrefix("-") {
                outputLabel.text!.remove(at: outputLabel.text!.startIndex)
            }
            else {
                outputLabel.text!.insert("-", at: outputLabel.text!.startIndex)
            }
        default:
            print("Cannot access data button.")
        }
    }

    @IBAction func operatorButtonPressed(_ sender: UIButton) {
        switch sender.currentTitle! {
        case "÷":
            operation = "division"
            firstNum = Double(outputLabel.text!)!
            outputLabel.text!.removeAll()
        case "×":
            operation = "multiplication"
            firstNum = Double(outputLabel.text!)!
            outputLabel.text!.removeAll()
        case "−":
            operation = "subtraction"
            firstNum = Double(outputLabel.text!)!
            outputLabel.text!.removeAll()
        case "+":
            operation = "addition"
            firstNum = Double(outputLabel.text!)!
            outputLabel.text!.removeAll()
        case "%":
            firstNum = Double(outputLabel.text!)!
            outputLabel.text = String(firstNum / 100)
        default:
            print("Cannot access operator button.")
        }
    }

    @IBAction func equalButtonPressed(_ sender: UIButton) {
        secondNum = Double(outputLabel.text!)!
        
        switch operation {
        case "division":
            result = firstNum / secondNum
            outputLabel.text = String(result)
        case "multiplication":
            result = firstNum * secondNum
            outputLabel.text = String(result)
        case "subtraction":
            result = firstNum - secondNum
            outputLabel.text = String(result)
        case "addition":
            result = firstNum + secondNum
            outputLabel.text = String(result)
        default:
            print("Cannot perform operation.")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        outputLabel.text = ""
    }


}

