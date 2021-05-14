//
//  SortTableViewCell.swift
//  SweetShop
//
//  Created by Александр Галкин on 04.05.2021.
//

import UIKit

class SortTableViewCell: UITableViewCell {

    var sort: Sort? {
        didSet {
            selectImage.image = sort?.image
            sortLabel.text = sort?.rule
        }
    }
    
    let selectImage: UIImageView = {
        var img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.clipsToBounds = true
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    private let sortLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .sortFont
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        addSubview(selectImage)
        addSubview(sortLabel)
        
        sortLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 7).isActive = true
        sortLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 2).isActive = true
        sortLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -2).isActive = true
        selectImage.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        selectImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        selectImage.heightAnchor.constraint(equalToConstant: 35).isActive = true
        selectImage.widthAnchor.constraint(equalToConstant: 35).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
