//
//  ViewController.swift
//  subject_14
//
//  Created by 長谷川孝太 on 2021/06/16.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    private let fruitsArray = FruitsArray()
    private let fruitsArrayRepository = FruitsArrayRepository()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(CustomTableViewCell.nib(), forCellReuseIdentifier: CustomTableViewCell.identifier)
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        self.fruitsArray.fruits = self.fruitsArrayRepository.load()
    }

    @IBAction func addCellDidTapped(_ sender: UIBarButtonItem) {
        let modalViewController = ModalViewController.instantiate(
            didSaveFruits: { [weak self] text in
                // 【疑問】なぜselfを明示しないといけないのか, なぜself!でもいいのか、nilの場合エラーの可能性があるではないか
                let newCell = Fruit(checkMark: false, name: text)
                self?.fruitsArray.fruits.append(newCell)
                self?.fruitsArrayRepository.save(newFruitsArray: (self?.fruitsArray.fruits)!)
                self?.tableView.reloadData()
                self?.dismiss(animated: true, completion: nil)
            },
            didCancel: { [weak self] in
                self?.dismiss(animated: true, completion: nil)
            }
        )
        // 【Qiitaメモ】Storyboardで生成したNCを取得する方のやり方は？
        let navigationController = UINavigationController(
            rootViewController: modalViewController
        )
        present(navigationController, animated: true)
    }

    // 【Qiitaメモ】
//    let secondVC = SecondViewController.instantiate(
//        didSelectPrefecture: { [weak self] name in
//            self?.prefectureLabel.text = name
//            self?.dismiss(animated: true, completion: nil)
//        },
//        didCancel: { [weak self] in
//            self?.dismiss(animated: true, completion: nil)
//        }
//    )
//    let navigationController = UINavigationController(
//        rootViewController: secondVC
//    )
//    present(navigationController, animated: true)
}

extension ViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        fruitsArray.fruits.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 【疑問エラー】このメソッドで"guard let -- else { return }"はできないのでダウンキャストas!を使うしか他に方法はないのか？
        let customCell = tableView.dequeueReusableCell(
                            // swiftlint:disable:next force_cast
                            withIdentifier: CustomTableViewCell.identifier, for: indexPath) as! CustomTableViewCell
        customCell.configure(fruit: fruitsArray.fruits[indexPath.row])
        return customCell
    }
}
