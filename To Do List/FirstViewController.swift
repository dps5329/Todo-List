//
//  FirstViewController.swift
//  To Do List
//
//  Created by Daniel Schartner on 6/4/15.
//  Copyright (c) 2015 Daniel Schartner. All rights reserved.
//

import UIKit

var allReminders = [String]()

class FirstViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var reminderTable: UITableView!
    
    //set the reminders array to array in memory
    func reloadData(){
    if(NSUserDefaults.standardUserDefaults().objectForKey("reminders") != nil){
            allReminders = NSUserDefaults.standardUserDefaults().objectForKey("reminders") as [String]
        }
    }
    
    //use the number of elements in array as the number of rows
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return allReminders.count
    }
    
    //load the data in the array into the table cells
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "reminderCell")
        
        cell.textLabel?.text = allReminders[indexPath.row]

        return cell
    }
    
    //allow editing
    func tableView(tableView: UITableView!, canEditRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        return true
    }
    
    //handle delete
    func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            // handle delete
            println(indexPath.row)
            
            if(indexPath.row < allReminders.count){
                allReminders.removeAtIndex(indexPath.row)
            }
            
            NSUserDefaults.standardUserDefaults().setObject(allReminders, forKey: "reminders")
            
            reminderTable.reloadData()
        }
    }
    
    //reload when user switches back to first page
    override func viewDidAppear(animated: Bool) {
        reloadData()
        reminderTable.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

