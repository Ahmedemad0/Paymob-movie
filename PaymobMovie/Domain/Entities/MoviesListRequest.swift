//
//  MoviesListRequest.swift
//  PaymobMovie
//
//  Created by Ahmed Emad on 07/07/2024.
//

import Foundation

struct MoviesListRequest: RequestType {
    typealias ResponseType = MoviesResponse

    var baseUrl: URL { Constants.baseURL }
    var path: String { "/discover/movie" }
    var method: HttpMethod = .get
    var queryParameters: [String: String] {
        [
            "api_key" : Constants.apiKey,
            "primary_release_year": "2024",
            "sort_by": "vote_average.desc"
        ]
    }

    let responseDecoder: (Data) throws -> MoviesResponse = { data in
        
        try JSONDecoder().decode(ResponseType.self, from: data)
    }
}

extension Encodable {
    func asString() -> String? {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted // Optional: Makes the JSON output pretty printed
        do {
            let jsonData = try encoder.encode(self)
            return String(data: jsonData, encoding: .utf8)
        } catch {
            print("Failed to encode object to JSON: \(error)")
            return nil
        }
    }
}
