//
//  ViewController.swift
//  RxCalculator
//
//  Created by home on 10/12/15.
//  Copyright © 2015 home. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: Properties
    @IBOutlet weak var DoctorAmount: UITextField!
    @IBOutlet weak var PharmacistAmount: UITextField!
    @IBOutlet weak var DoctorRefills: UITextField!
    @IBOutlet weak var PharmacistRefills: UILabel!
    @IBOutlet weak var PrescriptionDays: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Handle the text field’s user input through delegate callbacks.
        DoctorAmount.delegate = self
        PharmacistAmount.delegate = self
        DoctorRefills.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    // MARK: Actions
    
    @IBAction func Calc(sender: AnyObject) {
        if DoctorAmount.text == "" {
            let alertController = UIAlertController(title: "RxCalculator", message: "Fill in the Doctor Amount.", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
            return
        }
        if PharmacistAmount.text == "" {
            let alertController = UIAlertController(title: "RxCalculator", message: "Fill in the Pharmacist Amount.", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
            return
        }
        if DoctorRefills.text == "" {
            let alertController = UIAlertController(title: "RxCalculator", message: "Fill in the Doctor Refills.", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
            return
        }
        let refills : Float = Float(DoctorAmount.text!)! * (Float(DoctorRefills.text!)! + 1) / Float(PharmacistAmount.text!)! - 1
        PharmacistRefills.text = String(refills)
        PrescriptionDays.text = String(30 * (refills + 1))
        }
    }


