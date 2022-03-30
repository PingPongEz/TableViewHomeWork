//
//  ListOfContactsViewController.swift
//  TableViewHomeWork
//
//  Created by u on 28.03.2022.
//

import UIKit

class ListOfContactsViewController: UITableViewController {
    
    var listOfContacts = ContactModel.getListOfContacts()

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? AboutContactViewController else { return }
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        
        let contact = listOfContacts[indexPath.row]
        
        destination.fullNameDelegator = "\(contact.name) \(contact.lastName)"
        destination.phoneNumberDelegator = contact.phone
        destination.eMailDelegator = contact.eMail
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listOfContacts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellInFirst", for: indexPath)
        var content = cell.defaultContentConfiguration()
        
        let person = listOfContacts[indexPath.row]
        
        content.text = "\(person.name) \(person.lastName)"
        content.secondaryText = person.phone
    
        cell.contentConfiguration = content
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToFirst", sender: nil)
    }
    
}
