//
//  Restaurant.swift
//  MVVmRxSwiftUiKit
//
//  Created by Kaushal Kumbagowdana on 6/4/23.
//

import Foundation

struct Restaurant: Decodable {
    let name: String
    let cuisine: Cuisine
}

enum Cuisine: String, Decodable {
    case european
    case american
    case mexican
    case mediterranean
    case portuguese
}
