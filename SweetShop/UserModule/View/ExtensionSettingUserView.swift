//
//  ExtensionUserView.swift
//  SweetShop
//
//  Created by Александр Галкин on 24.02.2021.
//
extension SettingUserView {
    func makeConstraintsScrollView() {
        scrollView?.translatesAutoresizingMaskIntoConstraints = false
        scrollView?.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView?.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        scrollView?.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
    }
    
    func makeConstraintsTexFields() {
        personalDataLabel.topAnchor.constraint(equalTo: (scrollView?.topAnchor)!, constant: 5).isActive = true
        personalDataLabel.widthAnchor.constraint(equalTo: (scrollView?.widthAnchor)!).isActive = true
        personalDataLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        name.topAnchor.constraint(equalTo: personalDataLabel.bottomAnchor, constant: 5).isActive = true
        name.widthAnchor.constraint(equalTo: (scrollView?.widthAnchor)!).isActive = true
        name.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        surName.topAnchor.constraint(equalTo: name.bottomAnchor).isActive = true
        surName.widthAnchor.constraint(equalTo: (scrollView?.widthAnchor)!).isActive = true
        surName.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        birthDate.topAnchor.constraint(equalTo: surName.bottomAnchor).isActive = true
        birthDate.widthAnchor.constraint(equalTo: (scrollView?.widthAnchor)!).isActive = true
        birthDate.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        segmentControl!.translatesAutoresizingMaskIntoConstraints = false
        segmentControl!.centerXAnchor.constraint(equalTo: (scrollView?.centerXAnchor)!).isActive = true
        segmentControl!.topAnchor.constraint(equalTo: birthDate.bottomAnchor, constant: 10).isActive = true
        segmentControl!.widthAnchor.constraint(equalTo: (scrollView?.widthAnchor)!, constant: -100).isActive = true
        segmentControl!.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        contactLabel.topAnchor.constraint(equalTo: (segmentControl?.bottomAnchor)!, constant: 10).isActive = true
        contactLabel.widthAnchor.constraint(equalTo: (scrollView?.widthAnchor)!).isActive = true
        contactLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        email.topAnchor.constraint(equalTo: contactLabel.bottomAnchor, constant: 5).isActive = true
        email.widthAnchor.constraint(equalTo: (scrollView?.widthAnchor)!).isActive = true
        email.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        phone.topAnchor.constraint(equalTo: email.bottomAnchor).isActive = true
        phone.widthAnchor.constraint(equalTo: (scrollView?.widthAnchor)!).isActive = true
        phone.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        address.topAnchor.constraint(equalTo: phone.bottomAnchor).isActive = true
        address.widthAnchor.constraint(equalTo: (scrollView?.widthAnchor)!).isActive = true
        address.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}
