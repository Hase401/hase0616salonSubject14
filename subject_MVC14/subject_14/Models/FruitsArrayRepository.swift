//
//  FruitArrayRepository.swift
//  subject_14
//
//  Created by 長谷川孝太 on 2021/06/18.
//

import Foundation

// 【エラー】'final' modifier cannot be applied to this declaration
struct FruitsArrayRepository {
    private static let fruitsArrayKey = "fruitsArray"
    private let fruitsArray = FruitsArray()

    // [Fruit]型のデータを保存する
    func save(newFruitsArray: [Fruit]) {
        let jsonEncoder = JSONEncoder()
        jsonEncoder.keyEncodingStrategy = .convertToSnakeCase
        print("saveBefore")
        guard let newFA = try? jsonEncoder.encode(newFruitsArray) else {
            return
        }
        print("saveAfter")
        UserDefaults.standard.set(newFA, forKey: Self.fruitsArrayKey)
    }

    // 定義されていない型を取得する
    func load() -> [Fruit] {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        print("loadBefore")
        guard let newFA = UserDefaults.standard.data(forKey: Self.fruitsArrayKey),
               // 【エラー】Use '.self' to reference the type object
              let newFruitsArray = try? jsonDecoder.decode([Fruit].self, from: newFA) else {
            return []
        }
        print("loadAfter")
        return newFruitsArray
    }
}
