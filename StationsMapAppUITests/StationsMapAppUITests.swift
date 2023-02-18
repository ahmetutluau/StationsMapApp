//
//  StationsMapAppUITests.swift
//  StationsMapAppUITests
//
//  Created by Ahmet Utlu on 13.02.2023.
//

import XCTest

final class StationsMapAppUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        let vkpointfeatureMap = app/*@START_MENU_TOKEN@*/.maps.containing(.other, identifier:"VKPointFeature").element/*[[".maps.containing(.other, identifier:\"Flughafen Tempelhof\").element",".maps.containing(.other, identifier:\"Neukölln\").element",".maps.containing(.other, identifier:\"Alt-Treptow\").element",".maps.containing(.other, identifier:\"Grün Berlin GmbH\").element",".maps.containing(.other, identifier:\"Kreuzberg\").element",".maps.containing(.other, identifier:\"Leuschnerdamm 1, Leuschnerdamm 1, Leuschnerdamm 1 \").element",".maps.containing(.other, identifier:\"Tiergarten\").element",".maps.containing(.other, identifier:\"Checkpoint Charlie\").element",".maps.containing(.other, identifier:\"Beuthstr. 2, Beuthstr. 2, Beuthstr. 2 \").element",".maps.containing(.other, identifier:\"Hotel Ibis Berlin Ostbahnhof, Hotel Ibis Berlin Ostbahnhof, An der Schillingbrücke 2 Stadtteil Friedrichshain\").element",".maps.containing(.other, identifier:\"Markgrafenstr. 33, Markgrafenstr. 33, Markgrafenstr. 33 \").element",".maps.containing(.other, identifier:\"Rungestr. 22, Rungestr. 22, Rungestr. 22 \").element",".maps.containing(.other, identifier:\"Friedrichshain\").element",".maps.containing(.other, identifier:\"Neue Jüdenstraße 1, Neue Jüdenstraße 1, Neue Jüdenstraße 1 \").element",".maps.containing(.other, identifier:\"Andreasstraße, Andreasstraße, Andreasstraße 47 \").element",".maps.containing(.other, identifier:\"Dorotheenstraße, Dorotheenstraße, Dorotheenstraße 68 \").element",".maps.containing(.other, identifier:\"Spandauer Straße, Spandauer Straße, Spandauer Straße Mitte\").element",".maps.containing(.other, identifier:\"Alexanderplatz, Alexanderplatz, Alexanderplatz \").element",".maps.containing(.other, identifier:\"Petersburger Straße 24, Petersburger Straße 24, Petersburger Straße 24 \").element",".maps.containing(.other, identifier:\"Büschingstraße, Büschingstraße, Büschingstraße 1 Friedrichshain\").element",".maps.containing(.other, identifier:\"Hannoverschestr. 28-30, Hannoverschestr. 28-30, Hannoverschestr. 28-30 \").element",".maps.containing(.other, identifier:\"Straßburger Str. 2, Straßburger Str. 2, Straßburger Str. 2 \").element",".maps.containing(.other, identifier:\"Torstraße 165, Torstraße 165, Torstraße 165 \").element",".maps.containing(.other, identifier:\"Margarete-Sommer-Straße 2-6, Margarete-Sommer-Straße 2-6 \").element",".maps.containing(.other, identifier:\"Immanuelkirchstraße, Immanuelkirchstraße, Immanuelkirchstraße 14 Prenzlauer Berg\").element",".maps.containing(.other, identifier:\"Veteranenstraße 25, Veteranenstraße 25, Veteranenstraße 25 \").element",".maps.containing(.other, identifier:\"Volkspark Prenzlauer Berg\").element",".maps.containing(.other, identifier:\"Hussitenstraße, Hussitenstraße, Hussitenstraße 76 Stadtteil Gesundbrunnen\").element",".maps.containing(.other, identifier:\"Parkhaus Kulturbrauerei, Parkhaus Kulturbrauerei, Sredzkistraße 2 \").element",".maps.containing(.other, identifier:\"Raumerstraße, Raumerstraße, Raumerstraße 31 \").element",".maps.containing(.other, identifier:\"Volkspark Humboldthain\").element",".maps.containing(.other, identifier:\"Gesundbrunnen\").element",".maps.containing(.other, identifier:\"Weißensee\").element",".maps.containing(.other, identifier:\"Kleingartenanlage Freies Land e. V\").element",".maps.containing(.other, identifier:\"Sportanlagen Rennbahnstraße\").element",".maps.containing(.other, identifier:\"Pankow\").element",".maps.containing(.other, identifier:\"Heinersdorf\").element",".maps.containing(.other, identifier:\"Ehemaliger Mauerstreifen, Schönholzer Heide und Bürgerpark\").element",".maps.containing(.other, identifier:\"KGA Dreieck Nord\").element",".maps.containing(.other, identifier:\"VKPointFeature\").element"],[[[-1,39],[-1,38],[-1,37],[-1,36],[-1,35],[-1,34],[-1,33],[-1,32],[-1,31],[-1,30],[-1,29],[-1,28],[-1,27],[-1,26],[-1,25],[-1,24],[-1,23],[-1,22],[-1,21],[-1,20],[-1,19],[-1,18],[-1,17],[-1,16],[-1,15],[-1,14],[-1,13],[-1,12],[-1,11],[-1,10],[-1,9],[-1,8],[-1,7],[-1,6],[-1,5],[-1,4],[-1,3],[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        vkpointfeatureMap/*@START_MENU_TOKEN@*/.press(forDuration: 1.9);/*[[".tap()",".press(forDuration: 1.9);"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        vkpointfeatureMap.tap()
        XCTAssertTrue(vkpointfeatureMap.exists)

    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
