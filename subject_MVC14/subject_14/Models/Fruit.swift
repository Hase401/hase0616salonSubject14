//
//  Fruit.swift
//  subject_14
//
//  Created by 長谷川孝太 on 2021/06/18.
//

import Foundation

// 【エラー】'final' modifier cannot be applied to this declaration
//  struct Fruit: Encodable {
//    var checkMark: Bool
//    var name: String
//  }

struct Fruit: Codable {
    var checkMark: Bool
    var name: String
}
