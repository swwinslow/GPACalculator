//
//  WeightedCateogry.swift
//  GPACalculator
//
//  Created by Dennis Winslow on 12/28/15.
//  Copyright © 2015 Seth Winslow. All rights reserved.
//

import UIKit

class WeightedCateogry: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    var catArray = [String]()
    var weightedArray = [Int]()
    var dropsArray = [Int]()
    var newValue:String = "rest2"
    var newNumber:Int = 0
    

    @IBOutlet weak var catgoryTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        catArray.append("HELLO")
        weightedArray.append(30)
        dropsArray.append(2)
        catArray.append(newValue)
        weightedArray.append(newNumber)
        dropsArray.append(0)
        
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return catArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = self.catgoryTable.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! TableViewCell
        
       
      //  cell.nameCat.text = catArray[indexPath.row]
        let drops = String(dropsArray[indexPath.row])
       // cell.numberDrop.text = drops
        let weightToString = String(weightedArray[indexPath.row])
       // cell.percentage.text = weightToString
        
       
        
        
//        let cell = catgoryTable.dequeueReusableCellWithIdentifier("categoryCell", forIndexPath: indexPath)
//        
//        cell.textLabel?.text = catArray[indexPath.row]
//        let weightToString = String(weightedArray[indexPath.row])
//        cell.detailTextLabel?.text = weightToString
//        
//        
//        cell.textLabel?.textColor = UIColor.blueColor()
        return cell
        
    }




}

