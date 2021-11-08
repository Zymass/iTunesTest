//
//  NetworkService.swift
//  HedgehogTechTest
//
//  Created by Филяев Илья on 05.11.2021.
//

import UIKit

class NetworkService {
    
    // MARK: - Get Data
    
    func getData <T:Decodable>(url: String, completion: @escaping (T) -> ()) {
            URLSession.shared.dataTask(with: URL(string: url)!) { data, resp, error in
                guard let data = data else {
                    return
                }
                do {
                    let obj = try JSONDecoder().decode(T.self, from: data)
                    completion(obj)
                    print(url)
                } catch let error {
                    print("Failed to decode", error)
                }
            }.resume()
    }
}
