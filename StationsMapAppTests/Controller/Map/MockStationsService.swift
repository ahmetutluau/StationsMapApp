//
//  MockStationsService.swift
//  StationsMapAppTests
//
//  Created by Ahmet Utlu on 18.02.2023.
//

@testable import StationsMapApp

final class MockStationsService: StationsServiceInterface {
    var invokedGetStations = false
    var invokedGetStationsCount = 0
    var invokedStationsModel: [StationsModel] = [StationsModel()]
    
    func getStations(latitude: Double, longitude: Double, distance: Int, complete: @escaping (([StationsMapApp.StationsModel]?, String?) -> ())) {
        invokedGetStations = true
        invokedGetStationsCount += 1
        complete(invokedStationsModel, nil)
    }
    
    
}
