//
//  main.swift
//  byssmobile
//
//

import Foundation

protocol CheckListElementDelegate{
    func changeTaskStatus(element: CheckListElement, changeStatus: Int)->(CheckListElement)
}

class CheckListElement: CheckListElementDelegate{
    
    var task: String
    var taskStatus: String
    var dayOfTheWeek:String
    
    
    init(dayOfTheWeek: String = "Dzień tygodnia: " ,task: String = "zadanie", taskStatus: String = " :status") {
        self.task = task
        self.taskStatus = taskStatus
        self.dayOfTheWeek = dayOfTheWeek
    }
    
    
    func description(element: CheckListElement)->(String, String, String) {
        return (element.dayOfTheWeek, element.task, element.taskStatus);
    }
    
    // status 0 - Do wykonania, status 1 - Gotowe
    func changeTaskStatus(element: CheckListElement,changeStatus: Int) -> CheckListElement {
        var statusLibrary = [": Do wykonania", ": Gotowe"]
        element.taskStatus = statusLibrary[changeStatus]
        return element
    }
    
    
}

extension CheckListElement: CustomStringConvertible {
    var description: String {
        return "\(dayOfTheWeek)\(task)\(taskStatus)"
    }
}


protocol ShowAllElememts{
    func showAllElements(Array: Array<CheckListElement>)
}

class CheckList: ShowAllElememts{
    func showAllElements(Array allElements: Array<CheckListElement>) {
        for CheckListElement in allElements
        {
            print(CheckListElement)
        }
    }
    
    
    var table: Array <CheckListElement>
    init(tablica: Array<CheckListElement> = []) {
        self.table=tablica
    }
    
    
    func getEveryThirdElement(table: Array<CheckListElement>) -> Array<CheckListElement> {
        var tableFiltred = Array <CheckListElement>()
        for i in stride(from: 0, to: table.count, by: 2) {
            tableFiltred.append(table[i])
        }
        
        return tableFiltred        }
    
}




let element0 = CheckListElement(dayOfTheWeek: "Poniedziałek ", task: "Posprzątać", taskStatus: ": Do wykonania")
let element1 = CheckListElement(dayOfTheWeek: "Wtorek ", task: "Ugotować", taskStatus: " Gotowe")
let element2 = CheckListElement(dayOfTheWeek: "Środa ", task: "Umyć samochód", taskStatus: " Gotowe")
let element3 = CheckListElement(dayOfTheWeek: "Czwartek ", task: "Pobiegać", taskStatus: " Gotowe")
let element4 = CheckListElement(dayOfTheWeek: "Piątek ", task: "Przeczytać książkę", taskStatus: " Gotowe")
let element5 = CheckListElement(dayOfTheWeek: "Sobota ", task: "Party", taskStatus: " Do wykonania")
let element6 = CheckListElement(dayOfTheWeek: "Niedziela ", task: "Party", taskStatus: " Gotowe")



var checkList = CheckList()
checkList.table.append(element0)
checkList.table.append(element1)
checkList.table.append(element2)
checkList.table.append(element3)
checkList.table.append(element4)
checkList.table.append(element5)
checkList.table.append(element6)

print(checkList.table)
print(checkList.getEveryThirdElement(table: checkList.table))


checkList.showAllElements(Array: checkList.table)
print(checkList.table[3])

print(element2)
// status 0 - Do wykonania, status 1 - Gotowe
element2.changeTaskStatus(element: element2, changeStatus: 0)
print(element2)

checkList.showAllElements(Array: checkList.table)
