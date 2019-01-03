//
//  AppError.swift
//  DnDSpellTomb
//
//  Created by Pritesh Nadiadhara on 12/25/18.
//  Copyright © 2018 Pritesh Nadiadhara. All rights reserved.
//

import Foundation

enum AppError: Error {
    case badURL(String)
    case networkError(Error)
    case noResponse
    case decodingError(Error)
    case badData(Error)
    
    public func errorMessage() -> String{
        switch self{
        case .badURL(let str):
            return "badUrl: \(str)"
        case .networkError(let error):
            return "networkError: \(error)"
        case .noResponse:
            return "No Network Connection"
        case .decodingError(let error):
            return "decoding error: \(error)"
        case .badData(let error):
            return "Bad Data: \(error)"
        }
    }
}
