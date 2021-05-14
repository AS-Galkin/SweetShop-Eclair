//
//  ExtensionVerbTableViewController.swift
//  SweetShop
//
//  Created by Александр Галкин on 26.03.2021.
//

import Foundation
import UIKit

extension VerbTableViewController {
    func setupUserViewModel() {
        userViewModel.updateData = {[weak self] userData in
            self?.updateDataOnView(data: userData)
        }
    }
    
    func downloadUserData(userID: Int) {
        let param = ["table":"User", "id": userID, "all":""] as [String : Any]
        userViewModel.downloadJson(parameters: param, url: URIString.downloadURL.rawValue + URIString.apiGetDataURN.rawValue)
    }
    
    func calculateSummPrice(cart: [CartModel.CartData]) -> String {
        var price: Float = 0
        for i in cart {
            price += Float(i.price!)! * Float(i.amount!)
        }
        return String("\(price) \u{20BD}")
    }
    
    func updateDataOnView(data: DataStates<[UserModel.UserData]>) {
        switch data {
        case .initial:
            break
        case .loading(let result):
            break
        case .success(let result):
            for i in result {
                myAddressTextField.text = i.address
                nameTextField.text = "\(i.f_name ?? "NO NAME") \(i.l_name ?? "NO NAME")"
                phoneTextField?.text = i.phone
            }
            
            let price = calculateSummPrice(cart: (cartVC?.viewModel.productsInCartArray)!)
            submitButton.setTitle("Итого: \(price)", for: .normal)
            self.tableView.reloadData()
            self.tableView.setNeedsLayout()
            break
        case .failure(let result):
            break
        }
    }
    
    private func createConstraintsEditView() {
        editAddressView?.layer.borderWidth = 0.8
        editAddressView?.layer.cornerRadius = 5.0
        editAddressView?.layer.masksToBounds = true
        editAddressView?.backgroundColor = .white
        editTextField?.textAlignment = .center
        editTextField?.backgroundColor = .white
        
        alphaLayerView?.heightAnchor.constraint(equalTo: self.tableView.heightAnchor).isActive = true
        alphaLayerView?.widthAnchor.constraint(equalTo: self.tableView.widthAnchor).isActive = true
        editAddressView?.topAnchor.constraint(equalTo: self.alphaLayerView!.topAnchor, constant: 150).isActive = true
        editAddressView?.heightAnchor.constraint(equalToConstant: 150).isActive = true
        editAddressView?.leadingAnchor.constraint(equalTo: alphaLayerView!.leadingAnchor, constant: 10).isActive = true
        editAddressView?.trailingAnchor.constraint(equalTo: alphaLayerView!.trailingAnchor, constant: -10).isActive = true
        editTextField?.topAnchor.constraint(equalTo: editAddressView!.topAnchor).isActive = true
        editTextField?.heightAnchor.constraint(equalTo: editAddressView!.heightAnchor).isActive = true
        editTextField?.leadingAnchor.constraint(equalTo: editAddressView!.leadingAnchor).isActive = true
        editTextField?.trailingAnchor.constraint(equalTo: editAddressView!.trailingAnchor).isActive = true
        commitButton.topAnchor.constraint(equalTo: editAddressView!.bottomAnchor, constant: 8).isActive = true
        commitButton.leadingAnchor.constraint(equalTo: editAddressView!.leadingAnchor, constant: 30).isActive = true
        commitButton.trailingAnchor.constraint(equalTo: editAddressView!.trailingAnchor, constant: -30).isActive = true
        commitButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    internal func createConstrainstSubmintButton() {
        submitButton.bottomAnchor.constraint(equalTo: self.tableView.safeAreaLayoutGuide.bottomAnchor, constant: -8).isActive = true
        submitButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        submitButton.widthAnchor.constraint(equalTo: self.tableView.widthAnchor, constant: -30).isActive = true
        submitButton.centerXAnchor.constraint(equalTo: self.tableView.centerXAnchor).isActive = true
    }
    
    @objc func addressButtonHandler(sender: UIButton) {
        editViewIsHidden = false
        self.tableView.bringSubviewToFront(alphaLayerView!)
        self.tableView.setNeedsLayout()
        createConstraintsEditView()
        editTextField?.text = myAddressTextField.text
        editTextField?.addTarget(self, action: #selector(editTextFieldHandler(sender:)), for: .editingDidEnd)
    }
    
    @objc func commitButtomHandler(sender: UIButton) {
        myAddressTextField.text = editTextField?.text
        editViewIsHidden = true
    }
    
    @objc func editTextFieldHandler(sender: UITextField) {

    }
    
    @objc func submitButtonHandler(sender: UIButton) {
        let alert = UIAlertController(title: "Подтверждение", message: "Заказ успешно создан", preferredStyle: .actionSheet)
        let action = UIAlertAction(title: "OK", style: .cancel) { action in
            self.cartVC?.sucessOrder()
        }
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}
