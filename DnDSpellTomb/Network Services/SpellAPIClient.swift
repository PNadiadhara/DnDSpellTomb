//
//  SpellAPIClient.swift
//  DnDSpellTomb
//
//  Created by Pritesh Nadiadhara on 12/25/18.
//  Copyright © 2018 Pritesh Nadiadhara. All rights reserved.
//

import Foundation

final class SpellAPIClient{
    static func getAllSpells(completionHandler: @escaping ([Spells]?, AppError?) -> (Void)) {
        guard let url = URL.init(string: "http://www.dnd5eapi.co/api/spells") else {
            completionHandler(nil, AppError.badURL("URL error"))
            return }
    
        let urlRequest = URLRequest.init(url: url)
        URLSession.shared.dataTask(with: urlRequest) { (data, respone, error) in
            if let error = error {
                completionHandler(nil, AppError.badData(error))
            }
            if let data = data {
                do{
                    let spellData = try JSONDecoder().decode(Spell.self, from: data)
                    completionHandler(spellData.results, nil)
                } catch {
                    completionHandler(nil, AppError.decodingError(error))
                }
            }
        }.resume()
    }
    
    static func getSpellDetail(passedURL:String, completionHandler: @escaping (SpellDetail?, AppError?) -> (Void)) {
        guard let url = URL.init(string: passedURL) else {
            completionHandler(nil, AppError.badURL("URL Error"))
            return
        }
        let urlRequest = URLRequest.init(url: url)
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                completionHandler(nil, AppError.badData(error))
            }
            if let data = data {
                do{
                    let spellDetail = try JSONDecoder().decode(SpellDetail.self, from: data)
                    completionHandler(spellDetail, nil)
                } catch {
                    completionHandler(nil, AppError.decodingError(error))
                }
            }
        }.resume()
    }
    
}




