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
    @IBOutlet weak var orderButton: UIButton!
    @IBOutlet weak var cashPaymentSwitch: UISwitch!
    @IBOutlet weak var cardPaymentSwitch: UISwitch!
    @IBOutlet weak var soonPossibleSwitch: UISwitch!
    @IBOutlet weak var inTimeSwitch: UISwitch!
    @IBOutlet weak var summPriceLabel: UILabel!
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
        if let userid = cartVC?.userId {
            downloadUserData(userID: userid)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        editViewIsHidden = true
        if let userid = cartVC?.userId {
            downloadUserData(userID: userid)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        orderButton.layer.cornerRadius = 5.0
        orderButton.layer.masksToBounds = true
        orderButton.backgroundColor = .mainColorWithAplha
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
        setupUserViewModel()
    }
}
