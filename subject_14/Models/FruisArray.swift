//
//  FruisArray.swift
//  subject_14
//
//  Created by 長谷川孝太 on 2021/06/18.
//

import Foundation

// 【疑問】なぜfinalつけてもエラーにならない？
final class FruitsArray {
    var fruits = [
        Fruit(checkMark: false, name: "りんご"),
        Fruit(checkMark: true, name: "みかん"),
        Fruit(checkMark: false, name: "バナナ"),
        Fruit(checkMark: true, name: "パイナップル")
    ]
}
