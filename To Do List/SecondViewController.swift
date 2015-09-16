//
//  SecondViewController.swift
//  To Do List
//
//  Created by Daniel Schartner on 6/4/15.
//  Copyright (c) 2015 Daniel Schartner. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var userInput: UITextField!
    
    //add new item to reminders array
    @IBAction func newReminder(sender: AnyObject) {
        if(userInput.text != ""){
            
            allReminders.append(userInput.text)
            
            NSUserDefaults.standardUserDefaults().setObject(allReminders, forKey: "reminders")
        }
        
        userInput.text = ""
    }
   
    //handle keyboard
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.userInput.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

