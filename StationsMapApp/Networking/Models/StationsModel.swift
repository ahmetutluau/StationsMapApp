//
//  StationsModel.swift
//  StationsMapApp
//
//  Created by Ahmet Utlu on 15.02.2023.
//

import Foundation

struct StationsModel: Codable {
    var addressInfo: AddressInfo?
    var numberOfPoints: Int?
    
    enum CodingKeys: String, CodingKey {
        case addressInfo = "AddressInfo"
        case numberOfPoints = "NumberOfPoints"
    }
}

struct AddressInfo: Codable {
    let title, addressLine1: String
    let addressLine2: String?
    let latitude, longitude: Double
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case addressLine1 = "AddressLine1"
        case addressLine2 = "AddressLine2"
        case latitude = "Latitude"
        case longitude = "Longitude"
    }
}
