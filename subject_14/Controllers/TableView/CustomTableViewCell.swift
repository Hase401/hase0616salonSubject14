//
//  CustomTableViewCell.swift
//  subject_14
//
//  Created by 長谷川孝太 on 2021/06/17.
//

import UIKit

final class CustomTableViewCell: UITableViewCell {

    // 【疑問】なぜかimageViewという名前はどこかで使っているのか（参照しているのか）エラーになる
    @IBOutlet private var customImageView: UIImageView!
    @IBOutlet private var customLabel: UILabel!

    static let identifier = "CustomTableViewCell"

    static func nib() -> UINib {
        return UINib(nibName: "CustomTableViewCell", bundle: nil)
    }
    // 【SwiftLint行間エラー対策】
//    public func configure(with title: String, imageName: String, isCheckMark: Bool) {
    func configure(fruit: Fruit) {
//        customLabel.text = title
//        if isCheckMark {
//            customImageView.image = UIImage(systemName: imageName)
//        } else { return }
        customLabel.text = fruit.name
        customImageView.image = fruit.checkMark ? UIImage(systemName: "checkmark") : nil
    }
}
