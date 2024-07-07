//
//  MovieDetailsRequest.swift
//  PaymobMovie
//
//  Created by Ahmed Emad on 07/07/2024.
//

import Foundation

struct MovieDetailsRequest: RequestType {
    typealias ResponseType = MovieDetailsResponse

    let id: String
    
    init(id: String) {
        self.id = id
    }
    
    var baseUrl: URL { Constants.baseURL }
    var path: String { "/movie/\(id)" }
    var method: HttpMethod = .get
    var queryParameters: [String: String] {  ["api_key" : Constants.apiKey ] }

    let responseDecoder: (Data) throws -> MovieDetailsResponse = { data in
        try JSONDecoder().decode(ResponseType.self, from: data)
    }
}
