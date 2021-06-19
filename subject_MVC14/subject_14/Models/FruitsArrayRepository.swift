//
//  FruitArrayRepository.swift
//  subject_14
//
//  Created by 長谷川孝太 on 2021/06/18.
//

import Foundation

// 【エラー】'final' modifier cannot be applied to this declaration
//struct FruitsArrayRepository {
//    private static let fruitsArrayKey = "fruitsArray"
//
//    // [Fruit]型のデータを保存する
//    func save(_ newFruitsArray: [Fruit]) {
//        UserDefaults.standard.set(newFruitsArray, forKey: Self.fruitsArrayKey)
//    }
//
//    // 定義されていない型を取得する
//    func load() -> [Fruit] {
//        let value = UserDefaults.standard.object(forKey: Self.fruitsArrayKey)
//        guard let newfruitsArray = value as? [Fruit] else {
//            return []
//        }
//        return newfruitsArray
//    }
//}
