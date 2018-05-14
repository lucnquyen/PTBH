//
//  ViewController.swift
//  PTBH
//
//  Created by lucnguyen on 5/13/18.
//  Copyright © 2018 lucnguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfA: UITextField!
    @IBOutlet weak var tfB: UITextField!
    @IBOutlet weak var tfC: UITextField!
    @IBOutlet weak var lblResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnKetQua(_ sender: UIButton) {
        lblResult.text=calculate(a: <#T##Double#>(tfA.text!)!, b: <#T##Double#>(tfB.text)!, c: <#T##Double#>(tfC.text!)!)
    }
    
    func calculate(a: Double, b: Double, c: Double) -> String{
        var result1: Double!
        var result2: Double!
        
        if a == 0 {
            result1 = round(((-c)/b) * 1000) / 1000
        }
        else {
            let delta = b * b - 4 * a * c
            if delta < 0 {
                result1 = nil
                result2 = nil
                return "Vô nghiệm"
            } else if delta == 0 {
                result1 = -b/(2*a)
                result2 = result1
                return "Nghiệm kép x1= x2= \(result1)"
            } else {
                result1 = round( ((-b + sqrt(delta))/(2*a)) * 1000)/1000
                result2 = round( ((-b - sqrt(delta))/(2*a)) * 1000)/1000
                return "x1 \(result1); x2 \(result2)"
            }
        }
    }
    
    
    @IBAction func aNegative(_ sender: UISwipeGestureRecognizer) {
        tfA.text = makeNagative(num: tfA.text!)
    }
    @IBAction func bNegative(_ sender: UISwipeGestureRecognizer) {
        tfB.text = makeNagative(num: tfB.text!)
    }
    @IBAction func cNegative(_ sender: UISwipeGestureRecognizer) {
        tfC.text = makeNagative(num: tfC.text!)
    }
    func makeNagative(num: String) -> String{
        if !num.isEmpty {
            let index = num.index(num.startIndex, offsetBy: 1)
            print("num[0]="+num.substring(to: index))
            if num.substring(to: index) != "-" {
                return "-" + num
            } else{
                var temp = num
                return temp.chomp
            }
        }
        return ""
    }

}

extension String {
    var chomp : String {
        mutating get {
            self.remove(at: startIndex)
            return self
        }
    }
}
