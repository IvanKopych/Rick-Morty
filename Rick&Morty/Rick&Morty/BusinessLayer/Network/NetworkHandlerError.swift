//
//  NetworkHandlerError.swift
//  Rick&Morty
//
//  Created by admin on 18.05.2024.
//

import Foundation

enum NetworkHandlerError: Error {
    case InvalidURL
    case JSONDecodingError
    case RequestError(String)
    case UnknownError
}
