//
//  StationsServices.swift
//  StationsMapApp
//
//  Created by Ahmet Utlu on 15.02.2023.
//

import Foundation

protocol StationsServiceInterface {
    func getStations(latitude: Double, longitude: Double, distance: Int, complete: @escaping(([StationsModel]?, String?) -> ()))
}

class StationsService: StationsServiceInterface {
    static let shared = StationsService()
    private init() {}
    
    func getStations(latitude: Double, longitude: Double, distance: Int, complete: @escaping(([StationsModel]?, String?) -> ())) {
        let url = "\(APIConstants.baseUrl)\(APIConstants.endPoint)?key=\(APIConstants.apiKey)&latitude=\(latitude)&longitude=\(longitude)&distance=\(distance)"
        
        NetworkManager.shared.request(type: [StationsModel].self,
                                      url: url,
                                      method: .get) { response in
            switch response{
            case .success(let items):
                complete(items,nil)
            case .failure(let error):
                complete(nil,error.rawValue)
            }
        }
    }
}
