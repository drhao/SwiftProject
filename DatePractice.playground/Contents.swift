import UIKit
import Foundation

let bDay = "2015-5-15"

let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "yyyy-MM-dd"

let bDate = dateFormatter.date(from: bDay)

var scheduleByMonth = [2,4,6,18]

let calendar = NSCalendar.current
let bDateComponent = calendar.dateComponents([.year, .month, .day], from: bDate!)


//convert scheduled month to DateComponents
var interval = [DateComponents]()
//interval.month = 2
//interval.year = 1
for scheduledMonth in scheduleByMonth {
    let intervalToNext = DateComponents(month: scheduledMonth)
    //intervalToNext.month = scheduledMonth
    interval.append(intervalToNext)
    
}
print(interval)

var scheduledDate = [Date?]()

//init of scheduledDate
for scheduledMonth in scheduleByMonth {
    let nextVaccinationDate = calendar.date(byAdding: .month, value: scheduledMonth, to: bDate!)
    //intervalToNext.month = scheduledMonth
    scheduledDate.append(nextVaccinationDate)
    
}
print(scheduledDate)

//renew scheduledDate
//1. if scheduledDate <= lastDate
//2-1. if scheduledDate - lastDate <= shorterstInterval -> re-calculate schedualedDate
    // minimum age < lastvaccinationdate + shortest interval? minimumage: expDate
//2-2. else scheduleddate remains, return

//var nextVaccinationDate = calendar.date(byAdding: interval, to: bDate!)
    
print(interval)
//print(bDateComponent)
print(bDate!)
//print(nextVaccinationDate!)
print(NSLocale.current)


//Add minimumVaccinatedAge: DateComponents?

//Vaccine: vaccinatedVaccines: [VaccineIdv?], unvaccinatedVaccines [VaccineIdv?], unnecessayVaccines[]
//button: CheckVaccinated -> 按了會move from unvaccinagtedVaccines to vaccinated or unnecessaryVaccines
//







