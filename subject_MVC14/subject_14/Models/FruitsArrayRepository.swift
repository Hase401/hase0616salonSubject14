//
//  FruitArrayRepository.swift
//  subject_14
//
//  Created by 長谷川孝太 on 2021/06/18.
//

import Foundation

// 【疑問エラー】'final' modifier cannot be applied to this declaration
struct FruitsArrayRepository {
    private static let fruitsArrayKey = "fruitsArray"
    private let fruitsArray = FruitsArray()

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

    func load() -> [Fruit] {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        print("loadBefore")
        guard let newFA = UserDefaults.standard.data(forKey: Self.fruitsArrayKey),
              let newFruitsArray = try? jsonDecoder.decode([Fruit].self, from: newFA) else {
            return []
        }
        print("loadAfter")
        return newFruitsArray
    }
}
