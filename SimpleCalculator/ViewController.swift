//
//  ViewController.swift
//  SimpleCalculator
//
//  Created by Jacqueline Richard on 2016-02-04.
//  Copyright © 2016 Jacqueline Richard. All rights reserved.
//  This app a simple calculator app that is suppose to allow the user to
//  add, multiply, divide, and subtract two numbers.
// Built in WCompact HRegular

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //---------------------
    //variables/constants
    @IBOutlet weak var mainLabel: UILabel!
    //first num
    var firstNumStr: String = ""
    //second num
    var secondNumStr: String = ""
    //operand string
    var operSymbol: String  = ""
    //bools
    var isSecondNum: Bool = false //check for if on second of first number
    var isBeginNum: Bool = true //check to see if it's first number to be added
    var checkDec:Bool = false //check to see if decimal is in place
    var isNeg: Bool = false //check to see if number is negative
    var isCalAgain = false //check to see if this is a second time an operator has been hit
    
    
    //---------------------
    
    //---------------------
    //add all the click actions for the buttons
    //clear the label and vairables
    @IBAction func ClearButt(sender: UIButton) {
        //reset numbers to 0
        firstNumStr = ""
        secondNumStr = ""
        
        //reset bools
        isSecondNum = false
        isBeginNum = true
        checkDec = false
        isNeg = false
        isCalAgain = false
        
        //set label back to 0
        mainLabel.text = "0"
    }
    
    //change a number to be positive or negative
    @IBAction func posNegChange(sender: UIButton) {
        if(isNeg == true){
            //remove the - from the number ==== not currently working =====
            if(isSecondNum == false){
                firstNumStr = String(firstNumStr.characters.dropFirst())
            }
            else{
                secondNumStr = String(secondNumStr.characters.dropFirst())
            }
        }
        else{
            //add the - to the number
            if(isSecondNum == false){
                firstNumStr = "-" + firstNumStr
                mainLabel.text = firstNumStr
            }
            else{
                secondNumStr = "-" + secondNumStr
                mainLabel.text = secondNumStr
            }
        }
    }
    
    //add 0 to the num variable
    @IBAction func numZero(sender: UIButton) {
        append("0")
    }
    
    //add 1 to the num variable
    @IBAction func numOne(sender: UIButton) {
        append("1")
    }
    
    //add 2 to the variable
    @IBAction func numTwo(sender: UIButton) {
        append("2")
    }
    
    //add 3 to the variable
    @IBAction func numThree(sender: UIButton) {
        append("3")
    }
    
    //add 4 to the variable
    @IBAction func numFour(sender: UIButton) {
        append("4")
    }
    
    //add 5 to the variable
    @IBAction func numFive(sender: UIButton) {
        append("5")
    }
    
    //add 6 to the variable
    @IBAction func numSix(sender: UIButton) {
        append("6")
    }
    
    //add 7 to the variable
    @IBAction func numSeven(sender: UIButton) {
        append("7")
    }
    
    //add 8 to the variable
    @IBAction func numEight(sender: UIButton) {
        append("8")
    }
    
    //add 9 to the variable
    @IBAction func numNine(sender: UIButton) {
        append("9")
    }
    
    //add in a decimal
    @IBAction func addDec(sender: UIButton) {
        //check if decimal exists
        if(checkDec == false){
            append(".")
            checkDec = true
        }
        else{
            
        }
    }
    
    //get ready to divide
    @IBAction func divide(sender: UIButton) {
        operSymbol = "/"
        isSecondNum = true
        isBeginNum = true
        isCalAgain = true
        isNeg = false
    }
    
    //get ready to multiply
    @IBAction func multiply(sender: UIButton) {
        operSymbol = "*"
        isSecondNum = true
        isBeginNum = true
        isCalAgain = true
        isNeg = false
    }
    
    
    //get ready to subtract
    @IBAction func subtract(sender: UIButton) {
        operSymbol = "-"
        isSecondNum = true
        isBeginNum = true
        isCalAgain = true
        isNeg = false
    }
    
    //get ready to add
    @IBAction func addition(sender: UIButton) {
        operSymbol = "+"
        isSecondNum = true
        isBeginNum = true
        isCalAgain = true
        isNeg = false
    }
    
    //equals button has been pressed. Time to do the math
    @IBAction func doTheMath(sender: UIButton) {
        equals()
    }
    
    //--------------------
    
    
    //--------------------
    //Functions
    
    //appends the number to make a full inputed number
    func append(appn:Character){
        if(isSecondNum == false){
            if(isBeginNum == true){
                mainLabel.text = ""
            }
            firstNumStr.append(appn)
            mainLabel.text = firstNumStr
        }
        else{
            if(isBeginNum == true){
                mainLabel.text = ""
            }
            secondNumStr.append(appn)
            mainLabel.text = secondNumStr
        }
        
    }//end append function
    
    
    //This is the function that will actually do the math
    func equals(){
        //convert secondNumStr to float
        if(isSecondNum == true){
            let firstNum = (firstNumStr as NSString).floatValue
            let secondNum = (secondNumStr as NSString).floatValue
            var finalNum: float_t = 0
            //do the math
            if(operSymbol == "+"){
                finalNum = firstNum + secondNum
            }
            else if(operSymbol == "-"){
                finalNum = firstNum - secondNum
            }
            else if(operSymbol == "/"){
                finalNum = firstNum / secondNum
            }
            else if(operSymbol == "*"){
                finalNum = firstNum * secondNum
            }
            
            //set label
            mainLabel.text = String(finalNum)
            
            //reset bools
            checkDec = false
            isSecondNum = false
            isBeginNum = true
            isNeg = false
            
            if(isCalAgain == false){
                //reset numbers just in case
                firstNumStr = ""
                secondNumStr = ""
            }
            else{
                //set first number to be last calc's final number and reset second num
                firstNumStr = String(finalNum)
                secondNumStr = ""
                isCalAgain = false
                //rawr
            }
        }
        
        
        
    }//end function equals
    
    
    
}//end class

