//
//  SecondListOfContactsViewController.swift
//  TableViewHomeWork
//
//  Created by u on 28.03.2022.
//

import UIKit

class SecondListOfContactsViewController: UITableViewController {
    
    var listOfContacts = ContactModel.getListOfContacts()
    
    let cellName = UITableViewCell(style: .default, reuseIdentifier: "name")
    let cellEmail = UITableViewCell(style: .default, reuseIdentifier: "email")
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        listOfContacts.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let person = listOfContacts[section]
        return "\(person.name) \(person.lastName)"
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellInSecond", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        
        let phoneImage = UIImage(named: "phone")
        let eMailImage = UIImage(named: "email")
        
        let width = CGSize.init(width: 20, height: 20)
        
        content.imageProperties.maximumSize = width
        
        let person = listOfContacts[indexPath.section]
        
        switch indexPath.row {
        case 0:
            content.text = person.phone
            content.image = phoneImage
            cell.contentConfiguration = content
            return cell
        default:
            content.text = person.eMail
            content.image = eMailImage
            cell.contentConfiguration = content
            return cell
        }
    }
}
