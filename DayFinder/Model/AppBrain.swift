//
//  AppBrain.swift
//  DayFinder
//
//  Created by karlis.stekels on 03/02/2021.
//

import Foundation

struct AppBrain {
    
    // Calendar
    let calendar = Calendar.current
    
    // DateComponent()
    var dateComponents = DateComponents()
    
    mutating func dateTextInputCheck(_ day: String?, _ month: String?, _ year: String?, _ button: String?) {
        
        guard let dayToInt = Int(day!), let monthToInt = Int(month!), let yearToInt = Int(year!) else {
            //-Alert
            print("Something wrong")
            return
        }
        
        //dateComponent.day = dayTextField.text
        dateComponents.day = dayToInt
        dateComponents.month = monthToInt
        dateComponents.year = yearToInt
        
        //calendar.date(from: dateComponents)
        guard let date = calendar.date(from: dateComponents) else {
            return
        }
        
        //DateFormatter()
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_EN")
        dateFormatter.dateFormat = "EEEE"
        
        
        func findButtonLabel(_ title: String?) -> String {
            if dayToInt >= 1 && dayToInt <= 31 && monthToInt >= 1 && monthToInt <= 12{
                let weekday = dateFormatter.string(from: date)
                let capitalizedWeekday = weekday.capitalized
                return capitalizedWeekday
            }else{
                return "Something wrong"
            }
            
        }
        
        findButtonLabel(button)
        
    }
    

    

}
