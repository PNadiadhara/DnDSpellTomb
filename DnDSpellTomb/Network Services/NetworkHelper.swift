//
//  NetworkHelper.swift
//  DnDSpellTomb
//
//  Created by Pritesh Nadiadhara on 1/2/19.
//  Copyright © 2019 Pritesh Nadiadhara. All rights reserved.
//

import Foundation

final class NetworkHelper {
    static func performDataTask(urlString: String,
                                httpMethod: String,
                                completionHandler: @escaping(AppError?, Data?, HTTPURLResponse?) -> Void){
        guard let url = URL(string: urlString) else {
            completionHandler(AppError.badURL("Invalid \(urlString)"), nil, nil)
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let response = response as? HTTPURLResponse else {
                completionHandler(AppError.noResponse, nil, nil)
                return
            }
            if let error = error {
                completionHandler(AppError.networkError(error), nil, response)
            } else if let data = data{
                completionHandler(nil, data, response)
            }
        }.resume()
    }
}
