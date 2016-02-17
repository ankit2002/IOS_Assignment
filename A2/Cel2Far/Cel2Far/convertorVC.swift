//
//  convertorVC.swift
//  Cel2Far
//
//  Created by Ankit Mishra on 17/02/16.
//  Copyright © 2016 Ankit Mishra. All rights reserved.
//

import UIKit

class convertorVC: UIViewController {

    @IBOutlet weak var txt1ForCel: UITextField!
    @IBOutlet weak var txt2ForFar: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        txt2ForFar.userInteractionEnabled = false
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // Method to convert Celcius to Fahrenheit
    @IBAction func convertCel2Far(sender: AnyObject) {
        
        if(txt1ForCel.text != ""){
            let a = (txt1ForCel.text! as NSString).floatValue
            if a == 0{
                txt1ForCel.text = "\(a)"
            }
            let c = (a * 9)/5 + 32;
            txt2ForFar.text = "\(c)"
        }
        else{
            let alert = UIAlertController(title: "No Data", message: "Please enter Value", preferredStyle: .Alert)
            let action = UIAlertAction(title: "OK", style: .Default, handler: { (alert:UIAlertAction!) -> Void in
                    // Can make Focus on First TextField
                self.txt1ForCel.becomeFirstResponder();
            })
            alert.addAction(action)
            presentViewController(alert, animated: true, completion: nil)
        }
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
