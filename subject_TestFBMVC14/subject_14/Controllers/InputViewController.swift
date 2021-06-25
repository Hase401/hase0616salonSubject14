//
//  ModalViewController.swift
//  subject_14
//
//  Created by 長谷川孝太 on 2021/06/17.
//

import UIKit

final class InputViewController: UIViewController {

    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var nameTextField: UITextField!

    static func instantiate(didSaveFruits: @escaping (String) -> Void,
                            didCancel: @escaping () -> Void ) -> InputViewController {
//         【Qiitaメモエラー】
//        　let modalVC = UIStoryboard(name: "Main", bundle: nil)
//                            .instantiateInitialViewController() as! ModalViewController
        let modalVC = UIStoryboard(name: "Main", bundle: nil)
                        // 【Qiitaメモ】storyboardIDを用いる
                        // swiftlint:disable:next force_cast
                        .instantiateViewController(identifier: "InputViewController") as! InputViewController
        modalVC.didSaveFruitsHandler = didSaveFruits
        modalVC.didCancelHandler = didCancel
        return modalVC
    }

    private var didSaveFruitsHandler: (String) -> Void = { _ in }
    private var didCancelHandler: () -> Void = {}

    @IBAction func cancelDidTapped(_ sender: UIBarButtonItem) {
        didCancelHandler()
    }
    @IBAction func saveCellDataDidTapped(_ sender: UIBarButtonItem) {
        let text = nameTextField.text ?? ""
        didSaveFruitsHandler(text)
    }
}
