//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

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
PlaygroundPage.current.liveView = MyViewController()

class Child: VaccinationDateArranger {
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
    var name: String?
    var doses: Int?
    var vaccines = [VaccineIdv?]()
    var lastVaccinationDate: NSDate?
    var nextVaccinationDate: NSDate?
    var isLiveVaccine = false
    
    
    func checkLastVaccinationDate() {
        //var lastDate: NSDate?
        for v in vaccines {
            if v?.vaccinated == true {
                self.lastVaccinationDate = v?.didVaccinateDate
            } else {
                return
            }
        }
    }
    
    func renewScheduledDate() {
        for v in vaccines {
            if v?.vaccinated == false {
                if let nextDate = v?.scheduledDate, let lastDate = v?.lastVaccinationDate, let interval = v?.shortestIntervalFromLast {
                    if  nextDate.timeIntervalSince(lastDate as Date) >= TimeInterval(interval) {
                        return
                    } else {
                        v?.scheduledDate = lastDate.addingTimeInterval(TimeInterval(interval*30*24*60*60))
                    }
                }
            }
        }
    }
    
    func checkNextVaccinationDate() {
        for v in vaccines {
            if v?.vaccinated == false {
                self.nextVaccinationDate = v?.scheduledDate
            }
        }
    }
    
    init(name: String, doses: Int, schedule: [Int], bDay: NSDate, interval: [Int], isLiveVaccine: Bool) {
        self.name = name
        self.doses = doses
        self.isLiveVaccine = isLiveVaccine
        self.lastVaccinationDate = bDay
        
        for i in 1...doses {
            let scheduleDate = bDay.addingTimeInterval(TimeInterval(schedule[i]*30*24*60*60))
            self.vaccines.append(VaccineIdv(name: name, dose: i, scheduleDate: scheduleDate, interval: interval[i]))
        }
        
        self.renewScheduledDate()
        self.checkNextVaccinationDate()
        
    }
    
    
}

class VaccineIdv: Vaccine {
    //var name: String?
    var dose: Int?
    var fullName: String?
    var vaccinated : Bool?
    var scheduledDate : NSDate?
    var didVaccinateDate : NSDate?
    
    
    //var shortestIntervalForNext: Int?
    var shortestIntervalFromLast: Int?
    var description: String?
    
    //var lastVaccinationDate: NSDate?
    
    var type: VaccineType?
    
    init(name: String, dose: Int, scheduleDate: NSDate, interval: Int) {
        self.fullName = name+" \(dose)"
        self.vaccinated = false
        self.scheduledDate = scheduleDate
        self.shortestIntervalFromLast = interval
        
    }
    
}

protocol VaccinationDateArranger {
    func checkLastVaccinationDate()
    func renewScheduledDate()
    func checkNextVaccinationDate()
    
}


enum VaccineType {
    //var live: String?
    //var nonLive: String?
}


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

//create all vaccines.
let FiveInOne = Vaccine(name: "5in1", doses: 4, schedule: [2,4,6,18], bDay: <#T##NSDate#>, interval: [2,])
let MMR = Vaccine(name: <#T##String#>, doses: <#T##Int#>, schedule: <#T##[Int]#>, bDay: <#T##NSDate#>, interval: <#T##[Int]#>)

//func creatRequiredVaccines(required)


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



var fiveInOne = [Vaccine(), Vaccine(), Vaccine()]



