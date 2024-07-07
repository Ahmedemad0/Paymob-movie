//
//  Movie.swift
//  PaymobMovie
//
//  Created by Ahmed Emad on 07/07/2024.
//

import Foundation

struct Movie {
    var id: Int
    var name: String
    var poster: String
    var rate: String
    var date: String
    var language: String
    var isFavorite: Bool
}

typealias Movies = [Movie]
