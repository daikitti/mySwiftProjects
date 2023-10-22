//
//  ViewController.swift
//  colculator
//
//  Created by Have Dope on 21.12.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!{
        didSet {
            resultLabel.text = ""
        }
    }
    @IBOutlet weak var dualLabel: UILabel!{
        didSet{
            dualLabel.text = ""
        }
    }
    var firstNumber: Int = 0
    var secondNumber: Int = 0
    var operations = 0
    var mathSign = false;
    
    
    @IBAction func battons(_ sender: UIButton) {
        
        if mathSign == true {
            resultLabel.text = String(sender.tag)
            mathSign = false
        }
        
        else {
            resultLabel.text = resultLabel.text! + String(sender.tag)
        }
        firstNumber = Int(resultLabel.text!)!
    }
    
    @IBAction func culTapped(_ sender: UIButton) {
        
        
        if resultLabel.text != nil && sender.tag != 16 && sender.tag != 15 {
            secondNumber = Int(resultLabel.text!)!
            
           
             if  sender.tag == 11{ // -
                
                resultLabel.text = "-"
            }
            else if sender.tag == 12 { // +
               
                resultLabel.text = "+"
            }
            else if sender.tag == 13 { // x
                
                resultLabel.text = "x"
            }
            else if sender.tag == 14 {// /
            
                resultLabel.text = "/"
            
            }
            
            if secondNumber != 0{
                dualLabel.text = String(secondNumber)
            }
            else{
                dualLabel.text = String(firstNumber)
                }
            operations = sender.tag
            mathSign = true;
            
        }
        else if sender.tag == 15{
            if operations == 11{
                resultLabel.text = String(secondNumber - firstNumber)
                dualLabel.text = resultLabel.text
            }
            else if operations == 12{
                dualLabel.text = "\(firstNumber) + \(secondNumber)"
                resultLabel.text = String(firstNumber + secondNumber)
                dualLabel.text = resultLabel.text
            }
            else if operations == 13{
                dualLabel.text = "\(firstNumber) x \(secondNumber)"
                resultLabel.text = String(firstNumber * secondNumber)
                dualLabel.text = resultLabel.text
                
            }
            else if operations == 14{
                dualLabel.text = "\(firstNumber) / \(secondNumber)"
                resultLabel.text = String( secondNumber/firstNumber)
                dualLabel.text = resultLabel.text
            }}
            else if sender.tag == 16 {
                resultLabel.text = ""
                dualLabel.text = ""
                firstNumber = 0
                secondNumber = 0
                operations = 0
            }
           
            
        }
        
        
    }
    
