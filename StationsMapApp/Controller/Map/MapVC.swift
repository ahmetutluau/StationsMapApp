//
//  MapVC.swift
//  StationsMapApp
//
//  Created by Ahmet Utlu on 15.02.2023.
//

import UIKit
import MapKit
import CoreLocation

final class MapVC: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    let viewModel = MapVM()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        getStations()
    }
}

extension MapVC {
    private func setup() {
        mapView.delegate = self
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        getLocation()
    }
    
    private func getStations() {
        self.viewModel.getStations()
        
        Timer.scheduledTimer(withTimeInterval: 30, repeats: true) {_ in
            self.viewModel.getStations()
        }
        
        observeViewModel()
    }
    
    private func getLocation() {
        let location = CLLocationCoordinate2D(latitude: 52.526, longitude: 13.415)
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)
    }
}

extension MapVC: MKMapViewDelegate, CLLocationManagerDelegate {
    private func addAnotation(coords: [StationsModel]) {
        for coord in coords {
            guard let lat = coord.addressInfo?.latitude,
                  let long = coord.addressInfo?.longitude,
                  let title = coord.addressInfo?.title,
                  let address = coord.addressInfo?.addressLine1 else { return }
            
            let CLLCoordType = CLLocationCoordinate2D(latitude: lat ,
                                                      longitude: long )
            let anno = MKPointAnnotation()
            anno.title = title
            anno.subtitle = "\(address) \(coord.addressInfo?.addressLine2 ?? "")"
            anno.coordinate = CLLCoordType
            mapView.addAnnotation(anno)
        }
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is MKPointAnnotation else { return nil }

        let identifier = "Annotation"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)

        if annotationView == nil {
            annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView!.canShowCallout = true
            annotationView?.tintColor = .red
            
            let button = UIButton(type: .detailDisclosure)
            annotationView?.rightCalloutAccessoryView = button
            
        } else {
            annotationView!.annotation = annotation
        }
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        
        let detailVC : DetailVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailVC") as! DetailVC
        
        guard let annotation = view.annotation,
              let title = annotation.title,
              let address = annotation.subtitle else { return }
        
        let point = viewModel.stations?.filter({
            $0.addressInfo?.title == annotation.title
        })
        
        guard let title = title,
              let address = address else { return }
        
        detailVC.getInfo(title: title, address: address, points: point?[0].numberOfPoints ?? 0)

        if #available(iOS 15.0, *) {
            if let presentationController = detailVC.presentationController as? UISheetPresentationController {
                presentationController.detents = [.medium()]
            }
        }
        self.present(detailVC, animated: true)
    }
}

extension MapVC {
    private func observeViewModel() {
        self.viewModel.subscribe { [weak self] state  in
            guard let self = self else { return }
            
            switch state {
            case .networkFailure(let message):
                DispatchQueue.main.async {
                    RedirectManager.shared.showAlert(from: self, title: "Uyarı", message: message, firstButtonTitle: "Tamam")
                }
            case .getStationsSuccess:
                guard let stations = self.viewModel.stations else { return }
                DispatchQueue.main.async {
                    self.addAnotation(coords: stations)
                }
            }
        }
    }
}
