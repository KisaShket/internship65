//
//  ContactTableViewCell.swift
//  65-2internship
//
//  Created by Kisa Shket on 29.10.2020.
//  Copyright © 2020 Kisa Shket. All rights reserved.
//

import UIKit
import SDWebImage
class ContactTableViewCell: UITableViewCell {
    @IBOutlet weak var bodyView: UIView!
    @IBOutlet weak var shadowView: UIView!
    
    @IBOutlet weak var contactMail: UILabel!
    @IBOutlet weak var contactNumber: UILabel!
    @IBOutlet weak var contactName: UILabel!
    @IBOutlet weak var contactImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupShadowView()
        setupBodyView()
    }
    
    override func layoutSubviews() {
        shadowView.layer.shadowPath = UIBezierPath(
            roundedRect: shadowView.bounds,
            cornerRadius: 14.0
        ).cgPath
    }
    
    private func setupShadowView() {
        shadowView.backgroundColor = UIColor.clear
        shadowView.layer.shadowOpacity = 0.1
        shadowView.layer.shadowColor = UIColor.gray.cgColor
        shadowView.layer.shadowRadius = 2.6
        shadowView.layer.shadowOffset = CGSize(width: 3, height: 3)
    }
    
    private func setupBodyView() {
        bodyView.layer.cornerRadius = 14.0
        bodyView.clipsToBounds = true
    }
    
    public func configureCell(withContactModel model: ContactsData) {
        contactMail.text = model.eMail
        contactNumber.text = model.phoneNumber
        contactName.text = model.fullName
        contactImage.sd_setImage(with: model.imgUrl,
                                 placeholderImage: UIImage(named: "Image"),
                                 options: .allowInvalidSSLCertificates,
                                 completed: nil)
    }

}
