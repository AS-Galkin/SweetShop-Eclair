//
//  VerbTableViewController.swift
//  SweetShop
//
//  Created by Александр Галкин on 26.03.2021.
//

import Foundation
import UIKit

class VerbTableViewController: UITableViewController {
    @IBOutlet weak var addAddressButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var myAddressTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var cashPaymentSwitch: UISwitch!
    @IBOutlet weak var cardPaymentSwitch: UISwitch!
    @IBOutlet weak var soonPossibleSwitch: UISwitch!
    @IBOutlet weak var inTimeSwitch: UISwitch!

    internal var submitButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5.0
        button.backgroundColor = .mainColorWithAplha
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(submitButtonHandler(sender:)), for: .touchUpInside)
        return button
    }()
    
    internal var commitButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Применить", for: .normal)
        button.backgroundColor = .mainColor
        button.tintColor = .white
        button.addTarget(self, action: #selector(commitButtomHandler(sender:)), for: .touchUpInside)
        button.layer.cornerRadius = 5.0
        button.layer.masksToBounds = true
        
        return button
    }()
    internal var alphaLayerView: UIView?
    var editAddressView: UIView?
    var editTextField: UITextField?
    
    var editViewIsHidden: Bool = true {
        didSet {
            alphaLayerView?.isHidden = editViewIsHidden
            editAddressView?.isHidden = editViewIsHidden
        }
    }
    
    internal weak var cartVC: CartViewController?
    internal var userViewModel: UserViewModel = UserViewModel()
    
    override func loadView() {
        super.loadView()
        setupUserViewModel()
        if let userid = cartVC?.userId {
            downloadUserData(userID: userid)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        editViewIsHidden = true
        self.tableView.bringSubviewToFront(submitButton)
        if let userid = cartVC?.userId {
            downloadUserData(userID: userid)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.addSubview(submitButton)
        createConstrainstSubmintButton()
        alphaLayerView = UIView()
        alphaLayerView?.backgroundColor = UIColor(red: 79/255, green: 79/255, blue: 83/355, alpha: 0.4)
        alphaLayerView?.isHidden = editViewIsHidden
        alphaLayerView?.translatesAutoresizingMaskIntoConstraints = false
        editAddressView = UIView()
        editTextField = UITextField()
        editTextField?.translatesAutoresizingMaskIntoConstraints = false
        editAddressView?.translatesAutoresizingMaskIntoConstraints = false
        editAddressView?.isHidden = editViewIsHidden
        self.tableView.addSubview(alphaLayerView!)
        alphaLayerView?.addSubview(editAddressView!)
        alphaLayerView?.addSubview(commitButton)
        editAddressView?.addSubview(editTextField!)
        myAddressTextField.isEnabled = false
        addAddressButton.addTarget(self, action: #selector(addressButtonHandler(sender:)), for: .touchUpInside)
        inTimeSwitch.addTarget(self, action: #selector(inTimeSwitchHandler(sender:)), for: .valueChanged)
        soonPossibleSwitch.addTarget(self, action: #selector(soonPossibleSwitchHanlder(sender:)), for: .valueChanged)
        cashPaymentSwitch.addTarget(self, action: #selector(cashPaymentSwitchHandler(sender:)), for: .valueChanged)
        cardPaymentSwitch.addTarget(self, action: #selector(cardPaymentSwitchHandler(sender:)), for: .valueChanged)
    }
    
    @objc func soonPossibleSwitchHanlder(sender: UISwitch) {
        inTimeSwitch.isOn = false
    }
    
    @objc func cashPaymentSwitchHandler(sender: UISwitch) {
        cardPaymentSwitch.isOn = false
    }
    
    @objc func cardPaymentSwitchHandler(sender: UISwitch) {
        cashPaymentSwitch.isOn = false
    }
    
    @objc func inTimeSwitchHandler(sender: UISwitch) {
        soonPossibleSwitch.isOn = false
    }
}
