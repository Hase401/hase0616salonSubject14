//
//  Fruit.swift
//  subject_14
//
//  Created by 長谷川孝太 on 2021/06/18.
//

import Foundation
// 【エラー】Xcode12.3までしかRealmSwiftのFrameworkに対応していないみたい。CocoaPodsから導入するしかないのかも
//import RealmSwift

struct Fruit: Codable {
    var isChecked: Bool
    var name: String
}
