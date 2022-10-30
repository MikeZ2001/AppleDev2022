//
//  DateExtension.swift
//  TestApp2
//
//  Created by Michele Zurlo on 29/10/22.
//

import Foundation

extension Date {

  func getCurrentDate() -> String {

        let dateFormatter = DateFormatter()

        dateFormatter.dateFormat = "dd/MM/yyyy"

        return dateFormatter.string(from: Date())

    }
    
    func getDateToString(date: Date) -> String {

          let dateFormatter = DateFormatter()

          dateFormatter.dateFormat = "dd/MM/yyyy"

          return dateFormatter.string(from: date)

      }
    
    
     func getCurrentDateFormatted() -> Date {

           let dateFormatter = DateFormatter()

          // dateFormatter.dateFormat = "dd/MM/yyyy"
        
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
         let data = dateFormatter.string(from: Date())

         return dateFormatter.date(from: data)!

       }
    
    func diff(numDays: Int) -> Date {
        Calendar.current.date(byAdding: .day, value: numDays, to: self)!
    }

    
    var startOfDay: Date {
        Calendar.current.startOfDay(for: self)
    }
}
