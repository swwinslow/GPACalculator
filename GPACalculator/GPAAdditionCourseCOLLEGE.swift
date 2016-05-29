//
//  GPAAdditionCourse.swift
//  GPACalculator
//
//  Created by Dennis Winslow on 1/2/16.
//  Copyright © 2016 Seth Winslow. All rights reserved.
//

import UIKit
import iAd

class GPAAdditionCourseCOLLEGE: UIViewController, ADBannerViewDelegate, UIPickerViewDataSource, UIPickerViewDelegate{
    
    var classNumber:String = "0"
    var totalRaw:Double = 0
    var totalCredits:Double = 0

    @IBOutlet weak var adBanner: ADBannerView?
    
    @IBOutlet weak var C1Grade: UITextField!
    @IBOutlet weak var C1Label: UILabel!
    @IBOutlet weak var C1Credit: UITextField!
    
    @IBOutlet weak var C2Label: UILabel!
    @IBOutlet weak var C2Grade: UITextField!
    @IBOutlet weak var C2Credit: UITextField!
    
    @IBOutlet weak var C3Label: UILabel!
    @IBOutlet weak var C3Grade: UITextField!
    @IBOutlet weak var C3Credit: UITextField!
    
    @IBOutlet weak var C4Label: UILabel!
    @IBOutlet weak var C4Grade: UITextField!
    @IBOutlet weak var C4Credit: UITextField!
    
    @IBOutlet weak var C5Label: UILabel!
    @IBOutlet weak var C5Grade: UITextField!
    @IBOutlet weak var C5Credit: UITextField!
    
    @IBOutlet weak var C6Label: UILabel!
    @IBOutlet weak var C6Grade: UITextField!
    @IBOutlet weak var C6Credit: UITextField!
    
    @IBOutlet weak var C7Label: UILabel!
    @IBOutlet weak var C7Grade: UITextField!
    @IBOutlet weak var C7Credit: UITextField!
    
    @IBOutlet weak var C8Label: UILabel!
    @IBOutlet weak var C8Grade: UITextField!
    @IBOutlet weak var C8Credit: UITextField!
    
   
    
    var getCredit: [Double] = []
    var getScores: [String] = []
    var calc = []
    
    var picker = UIPickerView()
    var picker1 = UIPickerView()
    
    override func viewDidLoad() {
        getCredit.removeAll()
        getScores.removeAll()
        self.canDisplayBannerAds = true
        self.adBanner?.delegate = self
        self.adBanner?.hidden = true
        
        self.navigationItem.title = "Semester"
        
        picker.delegate = self
        picker.dataSource = self
        
        picker1.delegate = self
        picker1.dataSource = self
    
        C1Grade.inputView = picker
        C2Grade.inputView = picker
        C3Grade.inputView = picker
        C4Grade.inputView = picker
        C5Grade.inputView = picker
        C6Grade.inputView = picker
        C7Grade.inputView = picker
        C8Grade.inputView = picker
        
        C1Credit.inputView = picker1
        C2Credit.inputView = picker1
        C3Credit.inputView = picker1
        C4Credit.inputView = picker1
        C5Credit.inputView = picker1
        C6Credit.inputView = picker1
        C7Credit.inputView = picker1
        C8Credit.inputView = picker1
        
        picker1.selectRow(0, inComponent: 0, animated: true)
        
        if(C1Grade.editing || C2Grade.editing || C3Grade.editing || C4Grade.editing || C5Grade.editing || C6Grade.editing || C7Grade.editing || C8Grade.editing){
            changed = true
            reset()
        }
        
        
    
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        
        
    }
    
    var changed:Bool = false
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
        reset()
    }
    
    var grades = ["", "A+", "A", "A-", "B+", "B", "B-", "C+", "C", "C-","D+", "D", "D-", "F"]
    var hour = [0,1,2,3,4,5,6]
    
    func isGrade(currentGrade: String) -> Bool {
        for grade in grades{
            if(currentGrade == grade){
                return true
            }
        }
        return false
    }

    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {

        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if(changed == false){
        
            
            if(C1Grade.editing || C2Grade.editing || C3Grade.editing || C4Grade.editing || C5Grade.editing || C6Grade.editing || C7Grade.editing || C8Grade.editing){
                changed = true
                return grades.count
            }
            else{
                return hour.count
            }
        }
        else{
            
            
            if(C1Grade.editing || C2Grade.editing || C3Grade.editing || C4Grade.editing || C5Grade.editing || C6Grade.editing || C7Grade.editing || C8Grade.editing){
                changed = false
                return grades.count
            }
            else{
                return hour.count
            }
            
        }
    }
    
    func reset(){
        picker.reloadAllComponents()
        picker.selectRow(0, inComponent: 0, animated: true)
        picker1.reloadAllComponents()
        picker1.selectRow(0, inComponent: 0, animated: true)
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if(C1Grade.editing){
            C1Grade.text = grades[row]
        }
        if(C2Grade.editing){
            C2Grade.text = grades[row]
        }
        if(C3Grade.editing){
            C3Grade.text = grades[row]
        }
        if(C4Grade.editing){
            C4Grade.text = grades[row]
        }
        if(C5Grade.editing){
            C5Grade.text = grades[row]
        }
        if(C6Grade.editing){
            C6Grade.text = grades[row]
        }
        if(C7Grade.editing){
            C7Grade.text = grades[row]
        }
        if(C8Grade.editing){
            C8Grade.text = grades[row]
        }
        
        //hours
        if(C1Credit.editing){
            C1Credit.text = String(hour[row])
        }
        if(C2Credit.editing){
            C2Credit.text = String(hour[row])
        }
        if(C3Credit.editing){
            C3Credit.text = String(hour[row])
        }
        if(C4Credit.editing){
            C4Credit.text = String(hour[row])
        }
        if(C5Credit.editing){
            C5Credit.text = String(hour[row])
        }
        if(C6Credit.editing){
            C6Credit.text = String(hour[row])
        }
        if(C7Credit.editing){
            C7Credit.text = String(hour[row])
        }
        if(C8Credit.editing){
            C2Credit.text = String(hour[row])
        }
        
        
        
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        
      
        if(C1Grade.editing || C2Grade.editing || C3Grade.editing || C4Grade.editing || C5Grade.editing || C6Grade.editing || C7Grade.editing || C8Grade.editing){
            
            return grades[row]
            
        }
        else{
            return String(hour[row])
        }
        
    }
    
    
    
    func checkGrade(grade: String)->Bool{
        
        print(grade)
        if(grade == "A+" || grade == "A" || grade == "A-"){
            return true
        }
        else if(grade == "B+" || grade == "B" || grade == "B-"){
            return true
        }
        else if(grade == "C+" || grade == "C" || grade == "C-"){
            return true
        }
        
        else if(grade == "D+" || grade == "D" || grade == "D-"){
            return true
        }
        else if(grade == "F"){
            return true
        }
        else{
            let alertView = UIAlertController(title: "No Grade", message: "Course 1 critera is not valid", preferredStyle: .Alert)
            alertView.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
            presentViewController(alertView, animated: true, completion: nil)
            return false
        }
        
        
    }
    
    func isNumeric(credit: String) -> Bool {
        return Double(credit) != nil
    }
    
    func checkCredit(credit: Double)->Bool{
        

        if(credit >= 1 && credit < 8){
            return true
        }
        else{
            return false
        }
        
    }
    
    func collectData(){
        let valueCredit = C1Credit.text
        let valueGrade = C1Grade.text
        let vC1 = isNumeric(valueCredit!)
        let vG1 = isNumeric(valueGrade!)
        
        
        //box number 1
        if(vC1 == true && vG1 == false){
            let grade = C1Grade.text! as String
            let credit = (Double(C1Credit.text!)!)
            
            print(grade)
            
            let gradeB:Bool = checkGrade(grade)
            let creditB:Bool = checkCredit(credit)
            
            if(gradeB == true && creditB == true){
                getScores.append(grade)
                getCredit.append(credit)
            }
            
        }
        else if(vC1 == false || vG1 == true || (C1Credit.text != "" || C1Grade.text != "")){
            let alertView = UIAlertController(title: "No Grade", message: "Course 1 critera is not valid", preferredStyle: .Alert)
            alertView.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
            presentViewController(alertView, animated: true, completion: nil)
        }
        
        
        let valueCredit2 = C2Credit.text
        let valueGrade2 = C2Grade.text
        let vC2 = isNumeric(valueCredit2!)
        let vG2 = isNumeric(valueGrade2!)
            
        //box number 2
        if( vC2 == true && vG2 == false){
            let grade = C2Grade.text! as String
            let credit = (Double(C2Credit.text!)!)
            
            let gradeB:Bool = checkGrade(grade)
            let creditB:Bool = checkCredit(credit)
            
            if(gradeB == true && creditB == true){
                getScores.append(grade)
                getCredit.append(credit)
            }
            
        }
        else if(vC2 == false && vG2 == true  || (C2Credit.text != "" || C2Grade.text != "")){
            let alertView = UIAlertController(title: "No Grade", message: "Course 2 critera is not valid", preferredStyle: .Alert)
            alertView.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
            presentViewController(alertView, animated: true, completion: nil)
        }
        
        let valueCredit3 = C3Credit.text
        let valueGrade3 = C3Grade.text
        let vC3 = isNumeric(valueCredit3!)
        let vG3 = isNumeric(valueGrade3!)
        
        
        
        
        //box number 3
        if( vC3 == true && vG3 == false){
            let grade = C3Grade.text! as String
            let credit = (Double(C3Credit.text!)!)
            
            let gradeB:Bool = checkGrade(grade)
            let creditB:Bool = checkCredit(credit)
            
            if(gradeB == true && creditB == true){
                getScores.append(grade)
                getCredit.append(credit)
            }
           
        }
        else if(vC3 == false && vG3 == true || (C3Credit.text != "" || C3Grade.text != "")){
            let alertView = UIAlertController(title: "No Grade", message: "Course 3 critera is not valid", preferredStyle: .Alert)
            alertView.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
            presentViewController(alertView, animated: true, completion: nil)
        }
        
        let valueCredit4 = C4Credit.text
        let valueGrade4 = C4Grade.text
        let vC4 = isNumeric(valueCredit4!)
        let vG4 = isNumeric(valueGrade4!)
        
        
        
            
        //box number 4
        if( vC4 == true && vG4 == false){
            let grade = C4Grade.text! as String
            let credit = (Double(C4Credit.text!)!)
            
            let gradeB:Bool = checkGrade(grade)
            let creditB:Bool = checkCredit(credit)
            
            if(gradeB == true || creditB == true){
                getScores.append(grade)
                getCredit.append(credit)
            }
           
        }
        else if(vC4 == false && vG4 == true || (C4Credit.text != "" || C4Grade.text != "")){
            let alertView = UIAlertController(title: "No Grade", message: "Course 3 critera is not valid", preferredStyle: .Alert)
            alertView.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
            presentViewController(alertView, animated: true, completion: nil)
        }
        
        
        
        let valueCredit5 = C5Credit.text
        let valueGrade5 = C5Grade.text
        let vC5 = isNumeric(valueCredit5!)
        let vG5 = isNumeric(valueGrade5!)
        
        
            
        //box number 5
        if( vC5 == true && vG5 == false){
            let grade = C5Grade.text! as String
            let credit = (Double(C5Credit.text!)!)
        
            let gradeB:Bool = checkGrade(grade)
            let creditB:Bool = checkCredit(credit)
                    
            if(gradeB == true && creditB == true){
                getScores.append(grade)
                getCredit.append(credit)
            }
        }
        else if(vC5 == false && vG5 == true || (C5Credit.text != "" || C5Grade.text != "")){
            let alertView = UIAlertController(title: "No Grade", message: "Course 5 critera is not valid", preferredStyle: .Alert)
            alertView.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
            presentViewController(alertView, animated: true, completion: nil)
        }

        
        let valueCredit6 = C6Credit.text
        let valueGrade6 = C6Grade.text
        let vC6 = isNumeric(valueCredit6!)
        let vG6 = isNumeric(valueGrade6!)
        
        
            //box number 6
        if( vC6 == true && vG6 == false){
            let grade = C6Grade.text! as String
            let credit = (Double(C6Credit.text!)!)
            
            let gradeB:Bool = checkGrade(grade)
            let creditB:Bool = checkCredit(credit)
            
            if(gradeB == true && creditB == true){
                getScores.append(grade)
                getCredit.append(credit)
            }
        }
        else if(vC6 == false && vG6 == true || (C6Credit.text != "" || C6Grade.text != "")){
            let alertView = UIAlertController(title: "No Grade", message: "Course 6 critera is not valid", preferredStyle: .Alert)
            alertView.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
            presentViewController(alertView, animated: true, completion: nil)
        }
        
        
        let valueCredit7 = C7Credit.text
        let valueGrade7 = C7Grade.text
        let vC7 = isNumeric(valueCredit7!)
        let vG7 = isNumeric(valueGrade7!)
        
        
        //box number 7
        if(vC7 == true && vG7 == false){
            let grade = C7Grade.text! as String
            let credit = (Double(C7Credit.text!)!)
            
            let gradeB:Bool = checkGrade(grade)
            let creditB:Bool = checkCredit(credit)
            
            if(gradeB == true && creditB == true){
                getScores.append(grade)
                getCredit.append(credit)
            }
        }
        else if(vC7 == false && vG7 == true || (C7Credit.text != "" || C7Grade.text != "")){
            let alertView = UIAlertController(title: "No Grade", message: "Course 7 critera is not valid", preferredStyle: .Alert)
            alertView.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
            presentViewController(alertView, animated: true, completion: nil)
        }
        
        let valueCredit8 = C8Credit.text
        let valueGrade8 = C8Grade.text
        let vC8 = isNumeric(valueCredit8!)
        let vG8 = isNumeric(valueGrade8!)
        
        
        //box number 8
        if( vC8 == true && vG8 == false){
            let grade = C8Grade.text! as String
            let credit = (Double(C8Credit.text!)!)
            
            let gradeB:Bool = checkGrade(grade)
            let creditB:Bool = checkCredit(credit)
            
            if(gradeB == true && creditB == true){
                getScores.append(grade)
                getCredit.append(credit)
            }
        }
        else if(vC8 == false && vG8 == true || (C8Credit.text != "" || C8Grade.text != "")){
            let alertView = UIAlertController(title: "No Grade", message: "Course 8 critera is not valid", preferredStyle: .Alert)
            alertView.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
            presentViewController(alertView, animated: true, completion: nil)
        }
        
    }
    
    
    
   
    
    @IBAction func CalculateGPA(sender: UIButton) {
        
       collectData()
        
        totalRaw = 0
        totalCredits = 0
    
        
        var xx:Double = 0.0
        totalCredits = 0
        totalRaw = 0
      
        print("this is the results")
        print(totalCredits)
        print(totalRaw)
        for var index = 0; index < getScores.count; index++ {
            
            let n = getScores[index]
            let n1 = basicScale(n)
            
            let n3 = getCredit[index]
            let n2 = Double(n3)
            
            
            
            let xx = n1 * n2
            
            totalCredits += n2
            totalRaw += xx
            
            
            
            print(" \(xx)")
            
        }
        print(totalCredits)
        print("this is the end")
        
        
    
        
        
        
        
    }
    
    func basicScale(grade: String) -> Double{
        if(grade == "A+"){
            return 4.00
        }
       
        if(grade == "A"){
            return 4
        }
        if(grade == "A-"){
            return 3.667
        }
        if(grade == "B+"){
            return 3.33
        }
        if(grade == "B"){
            return 3
        }
        if(grade == "B-"){
            return 2.667
        }
        if(grade == "C+"){
            return 2.33
        }
        if(grade == "C"){
            return 2
        }
        if(grade == "C-"){
            return 1.667
        }
        if(grade == "D+"){
            return 1.33
        }
        if(grade == "D"){
            return 1
        }
        if(grade == "D-"){
            return 0.667
        }
        else{
            return 0
        }
        
       
    }
    
    func clearFields(){
        totalRaw = 0
        totalCredits = 0
    }
    
    func bannerViewWillLoadAd(banner: ADBannerView!) {
        
    }
    
    func bannerViewDidLoadAd(banner: ADBannerView!) {
        
        self.adBanner?.hidden = false
        
    }
    
    func bannerViewActionDidFinish(banner: ADBannerView!) {
        
    }
    
    func bannerViewActionShouldBegin(banner: ADBannerView!, willLeaveApplication willLeave: Bool) -> Bool {
        return true
    }
    
    func bannerView(banner: ADBannerView!, didFailToReceiveAdWithError error: NSError!) {
        
        self.adBanner?.hidden = true
        
    }

    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let nextView = segue.destinationViewController as! DisplayGPA
        
        nextView.totalRawScore = totalRaw
        
        nextView.totalCredits = totalCredits
        clearFields()
    }
    
   

    
}
