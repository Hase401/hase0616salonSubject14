//
//  CustomTableViewCell.swift
//  subject_14
//
//  Created by 長谷川孝太 on 2021/06/17.
//

import UIKit

final class CustomTableViewCell: UITableViewCell {

    @IBOutlet private var checkmarkImageView: UIImageView!
    @IBOutlet private var nameLabel: UILabel!

    static let identifier = "CustomTableViewCell"

    static func nib() -> UINib {
        UINib(nibName: "CustomTableViewCell", bundle: nil)
    }

    func configure(fruit: Fruit) {
        nameLabel.text = fruit.name
        checkmarkImageView.image = fruit.isChecked ? UIImage(systemName: "checkmark") : nil
    }
}
