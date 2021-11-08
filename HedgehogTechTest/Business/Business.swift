//
//  Business.swift
//  HedgehogTechTest
//
//  Created by Филяев Илья on 08.11.2021.
//

import Foundation

class Business {
    
    // MARK: - Data Formater

    func setDateFormat(date: String) ->String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ssZZZ"
        guard let albumDate = dateFormatter.date(from: date) else { return "" }
        let formatDate = DateFormatter()
        formatDate.dateFormat = "dd-MM-yyyy"
        let date = formatDate.string(from: albumDate)
        return date
    }
}
