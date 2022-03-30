//
//  ContactModel.swift
//  TableViewHomeWork
//
//  Created by u on 28.03.2022.
//

import Foundation

struct ContactModel {
    
    private let fullName = DataManager.getFullNames()
    let phone = DataManager.getPhoneNumber()
    
    var name: String {
        fullName.name
    }
    
    var lastName: String {
        fullName.lastName
    }
    
    var eMail: String {
        "\(fullName.name)\(fullName.lastName)@mail.ru"
    }
    
    static func getListOfContacts() -> [ContactModel] {
        var listOfContacts: [ContactModel] = []
        
        var counts = 0
        
        while counts < 10 {
            listOfContacts.append(ContactModel())
            counts += 1
        }
        
        return listOfContacts
    }
    
}
