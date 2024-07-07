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
    var rate: String
    var image: String = "https://www.google.com/imgres?q=movie&imgurl=https%3A%2F%2Fresizing.flixster.com%2FLjP_YBdwVIehvFE04lJgajPtOoc%3D%2Fems.cHJkLWVtcy1hc3NldHMvbW92aWVzLzU5M2FmN2I4LTBjYTQtNDI2NS05MTJkLTg4MWZiOGI2MDRhNi5qcGc%3D&imgrefurl=https%3A%2F%2Fwww.rottentomatoes.com%2Fm%2Fif_2024&docid=3JDe0t3Fb5axEM&tbnid=HcnYqZlyTxISAM&vet=12ahUKEwiC0dWT3ZSHAxXbR6QEHc20Cs0QM3oECEkQAA..i&w=2037&h=3000&hcb=2&ved=2ahUKEwiC0dWT3ZSHAxXbR6QEHc20Cs0QM3oECEkQAA"
    var isFavorite: Bool
    
}

typealias Movies = [Movie]
