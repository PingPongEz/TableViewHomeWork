//
//  ViewController.swift
//  TableViewHomeWork
//
//  Created by u on 28.03.2022.
//

import UIKit
import SwiftUI

class AboutContactViewController: UIViewController {
    
    @IBOutlet var fullNameLabel: UILabel!
    
    @IBOutlet var phoneLabel: UILabel!
    @IBOutlet var eMailLabel: UILabel!
    @IBOutlet var picture: UIImageView!
    
    
    var fullNameDelegator: String?
    var phoneNumberDelegator: String?
    var eMailDelegator: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fullNameLabel.text = fullNameDelegator
        phoneLabel.text = phoneNumberDelegator
        eMailLabel.text = eMailDelegator
        
        picture.layer.cornerRadius = picture.frame.height / 2
        
    }
    
}
