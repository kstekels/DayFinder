//
//  ViewController.swift
//  DayFinder
//
//  Created by karlis.stekels on 01/02/2021.
//

import UIKit
import Foundation
import AVFoundation

var counter: Int = 1
var timer = Timer()
let labelText = "Day of the week, inside your finder"

class ViewController: UIViewController {
    
    //
    @IBOutlet weak var moonButton: UIBarButtonItem!
    @IBOutlet weak var infoButton: UIBarButtonItem!
    //
    
    @IBOutlet weak var dayTextField: UITextField!
    
    @IBOutlet weak var monthTextField: UITextField!
    
    @IBOutlet weak var yearTextField: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var findButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any add ?? default valueitional setup after loading the view.
        print("Viewcontroller first run...")
        topButtonColor()

    }
    
    @IBAction func findWeekDayTapped(_ sender: Any) {
        timer.invalidate()
        
         
        if findButton.title(for: .normal) == "Find"{
            // get values from button
            let day: String = dayTextField.text!
            let month: String = monthTextField.text!
            let year: String = yearTextField.text!
            
            // Check if values are valid valid
            
            guard let _ = Int(dayTextField.text!), let _ = Int(monthTextField.text!), let _ = Int(yearTextField.text!) else {
                //Alert
                warningPopup(withTitle: "Input Error!", withMessage: "Date Text Fileds can't be empty.")
                return
            }
            
            if Int(day)! >= 1 && Int(day)! <= 31 && Int(month)! >= 1 && Int(month)! <= 12 {
                dateFinderCalculation(day: day, month: month, year: year)
            }else{
                warningPopup(withTitle: "Wrong Date!", withMessage: "Please enter the correct Date.")
            }
            
            
            
            
            
            
        }else if findButton.title(for: .normal) == "Clear"{
            
            findButton.setTitle("Find", for: .normal)
            resultLabel.text = labelText
            resultLabel.alpha = 1
            dayTextField.text = ""
            monthTextField.text = ""
            yearTextField.text = ""
        }
        
        
    }
    
    
    func dateFinderCalculation(day: String?, month: String?, year: String?) {
        var yourDate = DateComponents()
        

        
        var date: Date? = nil
        
        // Assigning day,month and year in DateComponent()
        yourDate.day = Int(day ?? "1")
        yourDate.month = Int(month ?? "2")
        yourDate.year = Int(year ?? "2000")
        yourDate.hour = 0
        yourDate.minute = 0
        yourDate.second = 0
        
        
        // Store dateComponent values in constants
        let day_ = yourDate.day ?? 1
        let month_ = yourDate.month ?? 1
        let year_ = yourDate.year ?? 2021
        let hour_ = yourDate.hour
        let minute_ = yourDate.minute
        let second_ = yourDate.second
        
        // Date Formatter
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 2)
        dateFormatter.dateFormat = "dd/MM/yyyy hh:mm:ss"
        let calendar = Calendar.current // gregorian (current)
        
        
        // format date from String
        date = dateFormatter.date(from: "\(day_)/\(month_)/\(year_) \(hour_ ?? 0):\(minute_ ?? 0):\(second_ ?? 0)")
        
        
        // get day of week from calendar: Int
        let weekday = calendar.component(.weekday, from: date!)
        
        // name for dayOfWeek (function) -> Int to String
        let result = dayTranslator(weekDayNumber: weekday)
        
        
        // Chenge the result label text
        findButton.setTitle("Clear", for: .normal)
        findButton.alpha = 0.8
        return resultLabel.text = String(result)
        
        
    }
    
    
    func dayTranslator(weekDayNumber: Int) -> String {
        var dayResult: String
        switch weekDayNumber {
        case 1:
            dayResult = "Sunday"
        case 2:
            dayResult = "Monday"
        case 3:
            dayResult = "Tuesday"
        case 4:
            dayResult = "Wednesday"
        case 5:
            dayResult = "Thursday"
        case 6:
            dayResult = "Friday"
        case 7:
            dayResult = "Saturday"
        default:
            dayResult = "Wrong number!"
            
        }
        return dayResult
    }
    
    @objc func updateCounter(){
        if counter <= 3{
            print("\(counter) s")
            counter += 1
        }else{
            timer.invalidate()
            resultLabel.text = labelText
            resultLabel.alpha = 1
            resultLabel.backgroundColor = UIColor.tertiaryLabel
            counter = 1
        }
    }
    
    func myTimer() {
        
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func warningPopup(withTitle title: String?, withMessage message: String?){
            DispatchQueue.main.async {
                let popUp = UIAlertController(title: title, message: message, preferredStyle: .alert)
                let okButton = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                popUp.addAction(okButton)
                self.present(popUp, animated: true, completion: nil)
            }
        }
    // not Complete ...........
    func topButtonColor() {
        if self.traitCollection.userInterfaceStyle == .dark{
            moonButton.tintColor = UIColor.white
            infoButton.tintColor = UIColor.white
        }else{
            moonButton.tintColor = UIColor.black
            infoButton.tintColor = UIColor.black
        }
    }
    
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "dayFinder"{
        // Get the new view controller using segue.destination.
            let vc = segue.destination as! AppInfoViewController
        // Pass the selected object to the new view controller.
            vc.infoText = "DayFinder helps to find exact weekday for given date."
        }
    }
    

}





    
