//
//  ViewController.swift
//  subject_14
//
//  Created by 長谷川孝太 on 2021/06/16.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    // 【削除】
//    private let fruitsArray = FruitsArray()
    private var fruitsArray: [Fruit] = []
    private static let initialFruitsArray = [
        Fruit(isChecked: false, name: "りんご"),
        Fruit(isChecked: true, name: "みかん"),
        Fruit(isChecked: false, name: "バナナ"),
        Fruit(isChecked: true, name: "パイナップル")
    ]
    private let fruitsArrayRepository = FruitsArrayRepository()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(CustomTableViewCell.nib(), forCellReuseIdentifier: CustomTableViewCell.identifier)
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        // 【削除】
//        self.fruitsArray.fruits = self.fruitsArrayRepository.load()
        fruitsArray = self.fruitsArrayRepository.load() ?? Self.initialFruitsArray
    }

    @IBAction func addCellDidTapped(_ sender: UIBarButtonItem) {
        let inputViewController = InputViewController.instantiate(
            didSaveFruits: { [weak self] text in
                // 【疑問】なぜselfを明示しないといけないのか, なぜself!でもいいのか、nilの場合エラーの可能性があるではないか
                // 【削除】
//                let newFruit = Fruit(isChecked: false, name: text)
//                self?.fruitsArray.append(newFruit)
//                self?.fruitsArrayRepository.save(newFruitsArray: (self?.fruitsArray.fruits)!)
//                self?.tableView.reloadData()
//                self?.dismiss(animated: true, completion: nil)

                // 【メモ】guard let 文でself?を書かないで済むようにする
                guard let strongSelf = self else { return }
                let newFruit = Fruit(isChecked: false, name: text)
                strongSelf.fruitsArray.append(newFruit)
                _ = strongSelf.fruitsArrayRepository.save(newFruitsArray: strongSelf.fruitsArray)
                strongSelf.tableView.reloadData()
                strongSelf.dismiss(animated: true, completion: nil)

            },
            didCancel: { [weak self] in
                self?.dismiss(animated: true, completion: nil)
            }
        )
        let navigationController = UINavigationController(
            rootViewController: inputViewController
        )
        present(navigationController, animated: true)
    }

}

extension ViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 【削除】
//        fruitsArray.fruits.count
        fruitsArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 【疑問エラー】このメソッドで"guard let -- else { return }"はできないのでダウンキャストas!を使うしか他に方法はないのか？
        let customCell = tableView.dequeueReusableCell(
                            // swiftlint:disable:next force_cast
                            withIdentifier: CustomTableViewCell.identifier, for: indexPath) as! CustomTableViewCell
         // 【削除】
//        customCell.configure(fruit: fruitsArray.fruits[indexPath.row])
        customCell.configure(fruit: fruitsArray[indexPath.row])
        return customCell
    }
}
