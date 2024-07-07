//
//  Constants.swift
//  PaymobMovie
//
//  Created by Ahmed Emad on 07/07/2024.
//

import Foundation

enum Constants {
    static let baseURL: URL = {
        guard let url = URL(string: "https://api.themoviedb.org/3") else {
            preconditionFailure("Invalid URL")
        }

        return url
    }()

    static let imageBase: String = {
        return "https://image.tmdb.org/t/p/w500"
    }()
    
    static let apiKey: String = {
        return "674699b94fa639aa1d949a3ddd471dea"
    }()
}
