//
//  WeightCategory.swift
//  GPACalculator
//
//  Created by Dennis Winslow on 12/29/15.
//  Copyright © 2015 Seth Winslow. All rights reserved.
//

import UIKit

class WeightCategory: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    
    var objects: NSMutableArray! = NSMutableArray()
    var objects1: NSMutableArray! = NSMutableArray()
    var objects2: NSMutableArray! = NSMutableArray()
    var objects3: NSMutableArray! = NSMutableArray()
    var color:Bool = false
    
    var newValue:String = ""
    var newNumber:Int = 0
    var drops:Int = 0
    var score:Int = 9
    
    var editName:String = ""
    var editPercentage:Int = 0
    var editDrops:Int = 0
    
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        
        self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        self.title = "Weight Category"
        super.viewDidLoad()
        
        objects.addObject("asdf")
        
        objects.addObject("asdfg")
        
        objects.addObject("asdfgh")

        
        
        objects1.addObject(1)
        objects1.addObject(2)
        objects1.addObject(3)
        
        objects2.addObject(20)
        
        objects2.addObject(20)
        objects2.addObject(20)
        
        objects3.addObject(19)
        objects3.addObject(17)
        objects3.addObject(10)
        
        objects.addObject("asdf")
        
        objects.addObject("asdfg")
        
        objects.addObject("asdfgh")
        
        
        
        objects1.addObject(1)
        objects1.addObject(2)
        objects1.addObject(3)
        
        objects2.addObject(20)
        
        objects2.addObject(20)
        objects2.addObject(20)
        
        objects3.addObject(19)
        objects3.addObject(17)
        objects3.addObject(10)
        
        objects.addObject("asdf")
        
        objects.addObject("asdfg")
        
        objects.addObject("asdfgh")
        
        
        
        objects1.addObject(1)
        objects1.addObject(2)
        objects1.addObject(3)
        
        objects2.addObject(20)
        
        objects2.addObject(20)
        objects2.addObject(20)
        
        objects3.addObject(19)
        objects3.addObject(17)
        objects3.addObject(10)
        
        
        if(newValue != ""){
        objects.addObject(newValue)
        objects1.addObject(drops)
        objects2.addObject(newNumber)
        objects3.addObject(score)
        }
        
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.objects.count
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
//    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        
//        editName = self.objects.objectAtIndex(indexPath.row) as! String
//        editDrops = self.objects1.objectAtIndex(indexPath.row) as! Int
//        editPercentage = self.objects2.objectAtIndex(indexPath.row) as! Int
//    
//    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if(editingStyle == .Delete){
            objects.removeObjectAtIndex(indexPath.row)
            objects1.removeObjectAtIndex(indexPath.row)
            objects2.removeObjectAtIndex(indexPath.row)
            objects3.removeObjectAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if (editingStyle == .Insert){
            
        }
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "edit"){
            
        let nextView = segue.destinationViewController as! CategoryAddition
            
            let indexPath = self.tableView.indexPathForSelectedRow!
            
            editName = self.objects.objectAtIndex(indexPath.row) as! String
            editDrops = self.objects1.objectAtIndex(indexPath.row) as! Int
            editPercentage = self.objects2.objectAtIndex(indexPath.row) as! Int
            
            nextView.editName = editName
            let intPrect = String(editPercentage)
            let intDrops = String(editDrops)
            nextView.editPer = intPrect
            nextView.editDrops = intDrops
        }
    }
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]?
    {
        let delete = UITableViewRowAction(style: .Normal, title: "Delete") { action, index in
            print("delete button tapped")
            self.objects.removeObjectAtIndex(indexPath.row)
             self.objects1.removeObjectAtIndex(indexPath.row)
             self.objects2.removeObjectAtIndex(indexPath.row)
             self.objects3.removeObjectAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            tableView.reloadData()
        }
        
        let edit = UITableViewRowAction(style: .Normal, title: "Edit"){ action, index in
            print("edit button tapped")
            
            
        }

        return [delete ,edit]
    }
    
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
    
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! TableViewCell
        if(color == false){
            cell.backgroundColor = UIColor.lightGrayColor()
            color = true
        } else {
            cell.backgroundColor = UIColor.clearColor()
            color = false
        }
        
        cell.label1.text = self.objects.objectAtIndex(indexPath.row) as! String
        
        let x = self.objects1[indexPath.row] as! Int
        let xx:String = String("Drops: \(x)")
        
        let b = self.objects2[indexPath.row] as! Int
        let bb:String = String(b)
        
        let c = self.objects3[indexPath.row] as! Int
        let cc:String = String(c)
       
        
        cell.label2.text = xx
        cell.label3.text = bb
        cell.label4.text = cc
        
        
        return cell
        
    }

    @IBAction func clearTable(sender: UIButton) {
        
        objects.removeAllObjects()
        objects1.removeAllObjects()
        objects2.removeAllObjects()
        objects3.removeAllObjects()
        tableView.reloadData()
    }
    
    
    
}
