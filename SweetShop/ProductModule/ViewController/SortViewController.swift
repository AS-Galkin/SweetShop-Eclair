//
//  SortViewController.swift
//  SweetShop
//
//  Created by Александр Галкин on 04.05.2021.
//

import UIKit

struct Sort {
    var rule: String
    var isSelect: Bool
    var image: UIImage
}

class SortViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let cellID = "SortCell"
    var sorts:[Sort] = [Sort]()
    
    let sortTableView = UITableView()
    let tableElements = ["Сначала дорогие", "Сначала дешевые", "По алфавиту", "По популянрности"]
    weak var parentVC: ProductViewController?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 31/255, green: 31/255, blue: 36/255, alpha: 0.2)
        let tap = UITapGestureRecognizer(target: self, action: #selector(outsideTapHandler))
        tap.numberOfTapsRequired = 2
        view.addGestureRecognizer(tap)
        self.definesPresentationContext = true
        sortTableView.delegate = self
        sortTableView.dataSource = self
        setupViews()
    }
    
    @objc func outsideTapHandler() {
        for i in sorts {
            if i.isSelect {
                parentVC?.sortVCHandler(sortData: i)
            }
        }
        parentVC?.sortVCHandler(sortData: Sort(rule: "", isSelect: false, image: UIImage()))
    }

    func createSorts() {
        sorts.append(Sort(rule: "Сначала дороже", isSelect: false, image: UIImage(named: Icons.unCheckIcon.rawValue)!))
        sorts.append(Sort(rule: "Сначала дешевле", isSelect: false, image: UIImage(named: Icons.unCheckIcon.rawValue)!))
        sorts.append(Sort(rule: "По алфавиту", isSelect: false, image: UIImage(named: Icons.unCheckIcon.rawValue)!))
        sorts.append(Sort(rule: "По популярности", isSelect: false, image: UIImage(named: Icons.unCheckIcon.rawValue)!))
    }
    
    func setupViews() {
        createSorts()
        sortTableView.backgroundColor = .white
        sortTableView.layer.cornerRadius = 10.0
        //sortTableView.layer.borderWidth = 0.
        sortTableView.register(SortTableViewCell.self, forCellReuseIdentifier: "SortCell")
        sortTableView.translatesAutoresizingMaskIntoConstraints = false
        sortTableView.separatorColor = .lightGray
        
        view.addSubview(sortTableView)
        view.bringSubviewToFront(sortTableView)
        
        sortTableView.heightAnchor.constraint(equalToConstant: 130).isActive = true
        sortTableView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        sortTableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 55).isActive = true
        sortTableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sorts.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath as IndexPath) as! SortTableViewCell
        cell.sort = sorts[indexPath.row]
        cell.preservesSuperviewLayoutMargins = false
        cell.separatorInset = UIEdgeInsets.zero
        cell.layoutMargins = UIEdgeInsets.zero
        if (indexPath.row == self.sorts.count-1) {
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! SortTableViewCell
        sorts[indexPath.row].isSelect = !sorts[indexPath.row].isSelect
        if sorts[indexPath.row].isSelect {
            cell.selectImage.image = UIImage(named: Icons.checkIcon.rawValue)
        } else {
            cell.selectImage.image = UIImage(named: Icons.unCheckIcon.rawValue)

        }
    }
}
