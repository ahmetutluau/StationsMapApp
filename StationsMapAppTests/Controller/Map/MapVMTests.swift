//
//  MapVMTests.swift
//  StationsMapAppTests
//
//  Created by Ahmet Utlu on 18.02.2023.
//

import XCTest
@testable import StationsMapApp

final class MapVMTests: XCTestCase {
    
    private var sut: MapVM!
    private var stationsService: MockStationsService!
    
    override func setUp() {
        super.setUp()
        
        stationsService = .init()
        sut = .init(stationsService: stationsService)
    }
    
    override func tearDown() {
        super.tearDown()
        
        stationsService = nil
        sut = nil
    }
    
    func test_getStations_invokesRequiredMethods() {
        XCTAssertFalse(stationsService.invokedGetStations)
        
        sut.getStations()
        
        XCTAssertEqual(stationsService.invokedGetStationsCount, 1)
    }
}
