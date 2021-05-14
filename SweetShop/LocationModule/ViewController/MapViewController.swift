//
//  MapViewController.swift
//  SweetShop
//
//  Created by Александр Галкин on 30.03.2021.
//

import UIKit
import MapKit

struct Location {
    var latitude: String?
    var longitude: String?
    var name: String?
}

class MapViewController: UIViewController, MKMapViewDelegate {
    var location = Location()
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print(location)
        let map = MKMapView()
        map.delegate = self
        let initialLocation = CLLocation(latitude: Double(location.latitude ?? "0.00") ?? 0.00, longitude: Double(location.longitude ?? "0.00") ?? 0.00)
        map.centerToLocation(initialLocation)
        let home = MKPointAnnotation()
        home.title = "Эклер"
        home.coordinate = CLLocationCoordinate2D(latitude: Double(location.latitude ?? "0.00") ?? 0.00, longitude: Double(location.longitude ?? "0.00") ?? 0.00)
        map.addAnnotation(home)
        view.addSubview(map)
        createMapContraints(map: map)
    }
    
    private func createMapContraints(map: MKMapView) {
        map.translatesAutoresizingMaskIntoConstraints = false
        map.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        map.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        map.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
    }
}

private extension MKMapView {
    func centerToLocation(_ location: CLLocation,regionRadius: CLLocationDistance = 3000) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        setRegion(coordinateRegion, animated: true)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is MKPointAnnotation else { return nil }

        let identifier = "Annotation"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)

        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView!.canShowCallout = true
        } else {
            annotationView!.annotation = annotation
        }

        return annotationView
    }
}
