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

    func save(newFruitsArray: [Fruit]) -> Bool {
        let jsonEncoder = JSONEncoder()
        jsonEncoder.keyEncodingStrategy = .convertToSnakeCase
        guard let newFA = try? jsonEncoder.encode(newFruitsArray) else {
            return false
        }
        UserDefaults.standard.set(newFA, forKey: Self.fruitsArrayKey)
        return true
    }

    func load() -> [Fruit]? {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        guard let newFA = UserDefaults.standard.data(forKey: Self.fruitsArrayKey),
              let newFruitsArray = try? jsonDecoder.decode([Fruit].self, from: newFA) else {
            return nil
        }
        return newFruitsArray
    }
}
