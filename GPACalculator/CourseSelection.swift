//
//  CourseSelection.swift
//  GPACalculator
//
//  Created by Dennis Winslow on 1/2/16.
//  Copyright © 2016 Seth Winslow. All rights reserved.
//

import UIKit

class CourseSelection: UIViewController, UIPickerViewDelegate  {
    
    var courses = ["0","1","2","3","4", "5", "6", "7", "8"]

    @IBOutlet weak var picker: UIPickerView!
    var value:String = "0"
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return courses.count
    }
    
    func pickerView(pickerView: UIPickerView!, titleForRow row: Int, forComponent component: Int) -> String! {
        
        return courses[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        value = courses[row]
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let nextView = segue.destinationViewController as! GPAAdditionCourseCOLLEGE
        
        //var selectedValue = pickerViewContent[pickerView.selectedRowInComponent(0)]

        
        nextView.classNumber = value
    }
}
