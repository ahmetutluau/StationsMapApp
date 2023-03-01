//
//  MapVM.swift
//  StationsMapApp
//
//  Created by Ahmet Utlu on 15.02.2023.
//

import Foundation

protocol MapVMInterface {
    func getStations()
}

enum MapVMStateChange: StateChange {
    case getStationsSuccess
    case networkFailure(error: String)
}

final class MapVM: StatefulVM<MapVMStateChange> {
    var stations: [StationsModel]?
    let latitude = 52.526
    let longitude = 13.415
    let distance = 5
    private let stationsService: StationsServiceInterface
    
    init(stationsService: StationsServiceInterface = StationsService.shared) {
        self.stationsService = stationsService
    }
}

extension MapVM: MapVMInterface {
    func getStations() {
        stationsService.getStations(latitude: latitude,
                                    longitude: longitude,
                                    distance: distance) { [weak self] items, errorMessage in
            guard let self = self else { return }
            
            if let items = items {
                self.stations = items
                self.emit(.getStationsSuccess)
            } else {
                self.emit(.networkFailure(error: errorMessage ?? "something went wrong"))
            }
        }
    }
}
