//
//  NamesAndLastnamesRandomizer.swift
//  TableViewHomeWork
//
//  Created by u on 28.03.2022.
//

import Foundation

struct DataManager {
    
    let listOfNames = ["Sergey", "Nikolai", "Einstein", "Rodion", "Leeroy", "Alexey", "Andry", "Arthur", "George", "Roman", "Eugenya"]
    let listOfLastNames = ["Jenkens", "Veretennikov", "Vasiliev", "Anderson", "Obeme", "Obama", "Trump", "Baiden", "Putin", "Bruyko"]
    
    static func getFullNames() -> (name: String, lastName: String) {
        
        var personNameTuple: (name: String, lastName: String)
        
        let dataOfFullNames = DataManager()
        let countOfNames = dataOfFullNames.listOfNames.count - 1
        let countOfLastNames = dataOfFullNames.listOfLastNames.count - 1
        
        personNameTuple = (dataOfFullNames.listOfNames[Int.random(in: 0...countOfNames)],
                           dataOfFullNames.listOfLastNames[Int.random(in: 0...countOfLastNames)])
        
        return personNameTuple
    }
    
    static func getPhoneNumber() -> String {
        "+7931\(Int.random(in: 4000000...9999999))"
    }
    
}
