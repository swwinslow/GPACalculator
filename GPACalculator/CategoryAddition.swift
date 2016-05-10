//
//  CategoryAddition.swift
//  GPACalculator
//
//  Created by Dennis Winslow on 12/28/15.
//  Copyright © 2015 Seth Winslow. All rights reserved.
//

import UIKit

class CategoryAddition: UIViewController {
    
    
    @IBOutlet weak var categoryTextBox: UITextField!
    
    @IBOutlet weak var weightTextBox: UITextField!
    
    @IBOutlet weak var dropTextBox: UITextField!
    
    var editName = ""
    var editDrops = ""
    var editPer = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        nameArray.append("HET")
        self.title = "Add Category"
        
        
        print(editName)
        print(editPer)
        print(editDrops)
       
        if(editName != "")
        {
            categoryTextBox.text = editName
            weightTextBox.text = editPer
            dropTextBox.text = editDrops
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   var nameArray = [String]()
    var addName: String = ""
   
    
  
    
    
    
    
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    
    
    
            let svc = segue.destinationViewController as! WeightCategory
            print("this is the name of the passesd varabibel")
            print(categoryTextBox.text!)
            svc.newValue = categoryTextBox.text!
            let weightString = weightTextBox.text!
            let weightNumber = Int(weightString)
            svc.newNumber = weightNumber!
            let dropString = dropTextBox.text!
            let dropNumber = Int(dropString)
            svc.drops = dropNumber!
            svc.score = 0
    
    
    
    }
}

