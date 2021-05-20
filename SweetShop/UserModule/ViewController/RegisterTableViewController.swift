//
//  RegisterTableViewController.swift
//  SweetShop
//
//  Created by Александр Галкин on 23.03.2021.
//

import Foundation
import UIKit

class RegisterTableViewController: UITableViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var lNameTextField: UITextField!
    @IBOutlet weak var sNameTextField: UITextField!
    @IBOutlet weak var birthdayDatePicker: UIDatePicker!
    @IBOutlet weak var genderSegmentControl: UISegmentedControl!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatePasswordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    internal weak var parentVC: UserViewController?
    internal var date: String?

    
    @IBAction func registerButtonHandler(_ sender: UIButton) {
        register()
    }
    
    internal var userViewModel: UserViewModel?
    
    override func loadView() {
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingCells()
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.font = .tableHeaderFont
        header.textLabel?.textColor = .black
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
