//
//  NetworkService.swift
//  Rick&Morty
//
//  Created by admin on 17.05.2024.
//

import Foundation
import Dependencies

final class NetworkService {
    
    let baseURL = "https://rickandmortyapi.com/api"
    
    func getAllCharacters(page: Int) async throws -> CharacterInfoModel {
        if let url = URL(string: baseURL+"/character"+"?page="+String(page)) {
            print("Request: \(baseURL)\("/character")"+"?page="+String(page))
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let statusCode = (response as? HTTPURLResponse)?.statusCode, 200..<299 ~= statusCode else {
                let error: ResponseErrorMessage = try decodeJSONData(data: data)
                throw NetworkHandlerError.RequestError(error.error)
            }
            
            let responseData: CharacterInfoModel = try decodeJSONData(data: data)
            return responseData
        } else {
            throw(NetworkHandlerError.InvalidURL)
        }
    }
    
    func decodeJSONData<T: Codable>(data: Data) throws -> T {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(T.self, from: data)
            return decodedData
        } catch {
            throw NetworkHandlerError.JSONDecodingError
        }
    }
}

extension NetworkService: DependencyKey {
    static let liveValue = NetworkService()
}
