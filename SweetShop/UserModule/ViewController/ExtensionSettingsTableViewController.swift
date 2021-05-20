//
//  ExtensionTableViewController.swift
//  SweetShop
//
//  Created by Александр Галкин on 17.05.2021.
//

import Foundation
import UIKit

extension SettingsTableViewController {
    
    func settingCells() {
        emailTextField.isUserInteractionEnabled = false
        birthdayDatePicker.addTarget(self, action: #selector(birthdayDatePickerHandler(sender:)), for: .editingDidEnd)
    }
    
    @objc func birthdayDatePickerHandler(sender: UIDatePicker) {
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "dd MM yyyy"
        date = timeFormatter.string(from: sender.date).filter {!" \n\r\t".contains($0)}
    }
    
    func setFields() {
        switch viewData {
        case .initial:
            break
        case .success(let result):
            var country: String = "", city: String = "", street: String = ""
            nameTextField.text = result[0].f_name
            sNameTextField.text = result[0].s_name
            lNameTexField.text = result[0].l_name
            emailTextField.text = result[0].email
            mobileTextField.text = result[0].phone
            addressTextField.text = result[0].address
                        
            if let date = result[0].birthday {
                let timeIntreval = DateComponents(timeZone: .current, year: date % 10000, month: (date / 10000) % 100, day:(date / 1000000) % 100)
                var calendar = Calendar(identifier: .gregorian)
                calendar.timeZone = .current
                let date = calendar.date(from: timeIntreval)
                birthdayDatePicker.setDate(date!, animated: true)
            }
            
            switch result[0].gender {
            case "Мужской":
                genderSegmentControll?.selectedSegmentIndex = 0
                break
            case "Женский":
                genderSegmentControll?.selectedSegmentIndex = 1
                break
            default:
                break
            }
            break
        case .loading(let _):
            break
        case .failure(let _):
            break
        }
    }
}
