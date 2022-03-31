//
//  ListOfContactsViewController.swift
//  TableViewHomeWork
//
//  Created by u on 28.03.2022.
//

import UIKit

class ListOfContactsViewController: UITableViewController {
    
    var listOfContacts = ContactModel.getListOfContacts()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.leftBarButtonItem = self.editButtonItem
    }
    
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
    
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        listOfContacts.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
    }
    
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let moved = listOfContacts.remove(at: sourceIndexPath.row)
        listOfContacts.insert(moved, at: destinationIndexPath.row)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let actionDone = doneAction(at: indexPath)
        return UISwipeActionsConfiguration(actions: [actionDone])
    }
    
    func doneAction(at indexPath: IndexPath) -> UIContextualAction {
        let action = UIContextualAction(style: .destructive, title: "Done") { (action, view, completion) in
            self.listOfContacts.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            completion(true)
        }
        action.backgroundColor = .systemBlue
        action.image = UIImage(systemName: "checkmark")
        
        return action
    }
    
}
