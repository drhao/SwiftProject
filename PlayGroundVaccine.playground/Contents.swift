//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

let calendar = Calendar.current

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white

        let label = UILabel()
        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
        label.text = "Hello World!"
        label.textColor = .black
        
        view.addSubview(label)
        self.view = view
    }
}
// Present the view controller in the Live View window
//PlaygroundPage.current.liveView = MyViewController()


protocol VaccinationDateArranger {
    func checkNumOfVaccinated()
    func checkLastVaccinationDate()
    func updateSchedule(LastVaccinationDate last: Date, NextVaccinationDate next: Date, intervalFromLast interval: DateComponents) -> Date?
    func renewScheduledDate()
    func checkNextVaccinationDate()
    
}

protocol UpdateVaccinationStatus {
    func changeVaccinationStatus()
    func recordVaccinationDate()
}

class Child  {
    var lastVaccinationDate: NSDate?
    var nextVaccinationDate: NSDate?
    //var requiredVaccine = [Vaccine?]()
    
    func checkLastVaccinationDate() {
        <#code#>
    }
    
    func renewScheduledDate() {
        
    }
    func checkNextVaccinationDate() {
        <#code#>
    }
}

//requiredVaccines = [""]

class Vaccine: VaccinationDateArranger {
    var name: String
    var numOfDoses: Int
    var vaccines = [VaccineIdv?]()
    var lastVaccinationDate: Date?
    var nextVaccinationDate: Date?
    var isLiveVaccine = false
    var numOfVaccinated = 0
    
    func checkNumOfVaccinated() {
        for (num, v) in self.vaccines.enumerated() {
            if v?.vaccinated == false {
                self.numOfVaccinated = num
                return
            }
        }
    }
    
    func checkLastVaccinationDate() {
        if numOfVaccinated > 0 {
            self.lastVaccinationDate = self.vaccines[numOfVaccinated-1]?.didVaccinateDate
        }
        //var lastDate: NSDate?
        /*for v in vaccines {
            if v?.vaccinated == true {
                self.lastVaccinationDate = v?.didVaccinateDate
            } else {
                return
            }
        }*/
    }
    
    func updateSchedule(LastVaccinationDate last: Date, NextVaccinationDate next: Date, intervalFromLast interval: DateComponents) -> Date? {
        let earliest = calendar.date(byAdding: interval, to: last)
        if earliest! <= next {
            //no need to change scheduled date
            return next
        } else {
            //re-schedule according to the shortest interval (and minimum age)
            return earliest
        }
    }
    
    func renewScheduledDate() {
        //check the 1st unvaccinated
        if (self.name == "HBV") && (numOfVaccinated == 2) {
            let earliestFromOne = calendar.date(byAdding: DateComponents(day: 112), to: self.vaccines[0]!.didVaccinateDate!)
            let earliestFromTwo = calendar.date(byAdding: DateComponents(day: 56), to: self.vaccines[1]!.didVaccinateDate!)
            if (self.vaccines[2]?.scheduledDate)! < earliestFromOne!, earliestFromOne! < earliestFromTwo! {
                self.vaccines[2]?.scheduledDate = earliestFromTwo!
            } else if (self.vaccines[2]?.scheduledDate)! < earliestFromOne! {
                self.vaccines[2]?.scheduledDate = earliestFromOne!
            } else {
                return
            }
        } else {
            if let v = self.vaccines[numOfVaccinated], let schedule = v.scheduledDate, let last = self.lastVaccinationDate, let interval =  v.shortestIntervalFromLast  {
                self.vaccines[numOfVaccinated]?.scheduledDate = updateSchedule(LastVaccinationDate: last, NextVaccinationDate: schedule, intervalFromLast: interval)
                
            }
        
            for d in numOfVaccinated+1..<numOfDoses {
                if let v = self.vaccines[d], let schedule = v.scheduledDate, let interval =  v.shortestIntervalFromLast, let last =  self.vaccines[d-1]?.scheduledDate {
                    self.vaccines[d]?.scheduledDate = updateSchedule(LastVaccinationDate: last, NextVaccinationDate: schedule, intervalFromLast: interval)
                }
            }
        }
        //renew scheduledDate
        //1. if scheduledDate <= lastDate
        //2-1. if scheduledDate - lastDate <= shorterstInterval -> re-calculate schedualedDate
        // minimum age < lastvaccinationdate + shortest interval? minimumage: expDate
        //2-2. else scheduleddate remains, return
        
        //var nextVaccinationDate = calendar.date(byAdding: interval, to: bDate!)
    }
    
   
    func checkNextVaccinationDate() {
        self.nextVaccinationDate = self.vaccines[numOfVaccinated]?.scheduledDate

        /*for v in vaccines {
            if v?.vaccinated == false {
                self.nextVaccinationDate = v?.scheduledDate
            }
        }*/
    }
    
    func update() {
        checkNumOfVaccinated()
        checkLastVaccinationDate()
        renewScheduledDate()
        checkNextVaccinationDate()
    }
    
    func recordVaccination(whichDose dose: Int, vaccinationDate date: Date) {
        //if not the right next dose, alert!
        self.vaccines[dose-1]?.vaccinated = true
        self.vaccines[dose-1]?.didVaccinateDate = date
        self.numOfVaccinated += 1
        self.update()
    }
    
    init(name: String, doses: Int, schedule: [DateComponents], bDay: Date, interval: [DateComponents], isLiveVaccine: Bool) {
        self.name = name
        self.numOfDoses = doses
        self.isLiveVaccine = isLiveVaccine
        self.lastVaccinationDate = bDay
        
        //initiate with scheduled date of vaccination
        for i in 0..<doses {
            if let scheduleDate = calendar.date(byAdding: schedule[i], to: bDay) {
                self.vaccines.append(VaccineIdv(name: name, dose: i, scheduleDate: scheduleDate, interval: interval[i]))
                
            }
        }
        
        self.update()
    }
    
    
}

struct VaccineIdv {
    //var name: String?
    //var dose: Int?
    var fullName: String?
    var description: String?

    var scheduledDate : Date?
    var vaccinated : Bool?
    var didVaccinateDate : Date?
    
    //var shortestIntervalForNext: Int?
    var shortestIntervalFromLast: DateComponents?
    var minAge: DateComponents?
    
    //var lastVaccinationDate: NSDate?
    
    var type: VaccineType?
    
    
    init(name: String, dose: Int, scheduleDate: Date, interval: DateComponents) {
        //super.init(name: String)
        
        self.fullName = name + "-\(dose)"
        self.vaccinated = false
        self.scheduledDate = scheduleDate
        self.shortestIntervalFromLast = interval
        
    }
    
}

enum VaccineType {
    case live
    case nonLive
}

enum VaccinationStatus {
    case vaccinated
    case nonvaccinated
    case notrequired
}




let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "yyyy-MM-dd"
let birthday = "2015-5-15"
let bDay = dateFormatter.date(from: birthday)


//create all vaccines.
let FiveInOne = Vaccine(name: "5in1", doses: 4, schedule: [DateComponents(month: 2), DateComponents(month: 4), DateComponents(month: 6), DateComponents(month: 18)], bDay: bDay!, interval: [DateComponents(month: 2), DateComponents(month: 2), DateComponents(month: 2), DateComponents(month: 2)], isLiveVaccine: false)

print(FiveInOne.nextVaccinationDate!)
FiveInOne.vaccines[1]?.scheduledDate
FiveInOne.recordVaccination(whichDose: 1, vaccinationDate: dateFormatter.date(from: "2015-7-25")!)
FiveInOne.update()
FiveInOne.numOfVaccinated
FiveInOne.lastVaccinationDate
FiveInOne.nextVaccinationDate
FiveInOne.vaccines[0]?.vaccinated
FiveInOne.vaccines[0]?.didVaccinateDate
FiveInOne.vaccines[1]?.scheduledDate

let HBV = Vaccine(name: "HBV", doses: 3, schedule: [DateComponents(month: 0), DateComponents(month: 1), DateComponents(month: 6)], bDay: bDay!, interval: [DateComponents(day: 0), DateComponents(day: 28), DateComponents(day: 56)], isLiveVaccine: false)

print(HBV.nextVaccinationDate!)
HBV.recordVaccination(whichDose: 1, vaccinationDate: dateFormatter.date(from: "2015-8-15")!)
HBV.recordVaccination(whichDose: 2, vaccinationDate: dateFormatter.date(from: "2015-9-15")!)
print(HBV.nextVaccinationDate!)
HBV.vaccines[2]?.scheduledDate


//print(FiveInOne.vaccines[1]?.vaccinated!)
print(FiveInOne.nextVaccinationDate!)

//let MMR = Vaccine(name: <#T##String#>, doses: <#T##Int#>, schedule: <#T##[Int]#>, bDay: <#T##NSDate#>, interval: <#T##[Int]#>)

//func creatRequiredVaccines(required)

/*
//Create and assign parameters for each kind of vaccine
func creatVaccines(name: String, doses: Int, schedule: [Int], bDay: NSDate, interval: [Int]) ->  [VaccineIdv?] {
    var vaccine = [VaccineIdv?]()
    //var scheduleDate = [NSDate?]()
    
    for i in 1...doses {
        let scheduleDate = bDay.addingTimeInterval(TimeInterval(schedule[i]*30*24*60*60))
        vaccine.append(VaccineIdv(name: name, dose: i, scheduleDate: scheduleDate, interval: interval[i]))
    }
    return vaccine
}

func checkLastVaccinationDate(vaccine: [VaccineIdv?]) -> NSDate? {
    var lastDate: NSDate?
    for v in vaccine {
        if v?.vaccinated == true {
            lastDate = v?.didVaccinateDate
        } else {
            return lastDate
        }
    }
    return lastDate
}

func checkNextVaccinationDate(vaccine: [Vaccine?]) -> NSDate? {
    
    for (num, date) in vaccine.scheduledDate.enumerated() {
        if vaccine.vaccinated[num] == false {
            if vaccine.scheduleDate[num] - vaccine.lastVaccinationDate
        }
    }
    return nil
}
*/





