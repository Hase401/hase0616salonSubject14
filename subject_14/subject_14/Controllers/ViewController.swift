//
//  ViewController.swift
//  subject_14
//
//  Created by 長谷川孝太 on 2021/06/16.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    let keyCheckMark = "checkMark"
    let keyName = "name"
    //　【メモ】private var fruits: [Dictionary<String, Any>] = []
    var fruits: [[String: Any]] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        fruits = [
            [keyCheckMark: false, keyName: "りんご"],
            [keyCheckMark: true, keyName: "みかん"],
            [keyCheckMark: false, keyName: "バナナ"],
            [keyCheckMark: true, keyName: "パイナップル"]
        ]
        tableView.register(CustomTableViewCell.nib(), forCellReuseIdentifier: CustomTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
    }

    @IBAction func addCellDidTapped(_ sender: UIBarButtonItem) {
        let modalViewController = ModalViewController.instantiate(
            didSelectPrefecture: { [weak self] text in
                // 【疑問】なぜselfを明示しないといけないのか
                // 【疑問】なぜself!でもいいのか、nilの場合エラーの可能性があるではないか
                let partCell: [String: Any] = [self!.keyCheckMark: false, self!.keyName: text]
                self?.fruits.append(partCell)
                self?.tableView.reloadData()
                self?.dismiss(animated: true, completion: nil)
            },
            didCancel: { [weak self] in
                self?.dismiss(animated: true, completion: nil)
            }
        )
        // 【疑問】Storyboardで生成したNCを取得する方のやり方は？
        let navigationController = UINavigationController(
            rootViewController: modalViewController
        )
        present(navigationController, animated: true)
    }

    // 【メモ】
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

extension ViewController: UITableViewDelegate {
}

extension ViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.fruits.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 【疑問】このメソッドで"guard let -- else { return }"はできないのでダウンキャストas!を使うしか他に方法はないのか？
        let customCell = tableView.dequeueReusableCell(
                            // swiftlint:disable:next force_cast
                            withIdentifier: CustomTableViewCell.identifier, for: indexPath) as! CustomTableViewCell
        customCell.configure(with: (fruits[indexPath.row][keyName] as? String) ?? "",
                             imageName: "checkmark",
                             isCheckMark: (fruits[indexPath.row][keyCheckMark] as? Bool) ?? false)
        return customCell
    }
}
