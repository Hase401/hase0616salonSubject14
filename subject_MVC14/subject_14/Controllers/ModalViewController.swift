//
//  ModalViewController.swift
//  subject_14
//
//  Created by 長谷川孝太 on 2021/06/17.
//

import UIKit

final class ModalViewController: UIViewController {

    @IBOutlet private weak var modalLabel: UILabel!
    @IBOutlet private weak var modalTextField: UITextField!

    static func instantiate(didSaveFruits: @escaping (String) -> Void,
                            didCancel: @escaping () -> Void ) -> ModalViewController {
//         【Qiitaメモエラー】
//        　let modalVC = UIStoryboard(name: "Main", bundle: nil)
//                            .instantiateInitialViewController() as! ModalViewController
        let modalVC = UIStoryboard(name: "Main", bundle: nil)
                        // 【Qiitaメモ】storyboardIDを用いる
                        // swiftlint:disable:next force_cast
                        .instantiateViewController(identifier: "ModalViewController") as! ModalViewController
        modalVC.didSaveFruitsHandler = didSaveFruits
        modalVC.didCancelHandler = didCancel
        return modalVC
    }

    private var didSaveFruitsHandler: (String) -> Void = { _ in }
    private var didCancelHandler: () -> Void = {}

    override func viewDidLoad() {
        super.viewDidLoad()
        modalLabel.text = "名前"
    }

    @IBAction func cancelDidTapped(_ sender: UIBarButtonItem) {
        didCancelHandler()
    }
    @IBAction func saveCellDataDidTapped(_ sender: UIBarButtonItem) {
        let text = modalTextField.text ?? ""
        didSaveFruitsHandler(text)
    }
}
