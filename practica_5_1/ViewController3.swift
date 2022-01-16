//
//  ViewController3.swift
//  practica_5_1
//
//  Created by Noe Romano Vazquez on 14/01/22.
//  Copyright © 2022 noeromano. All rights reserved.
//

import UIKit
import MapKit
class ViewController3: UIViewController {

    var latitud:CLLocationDegrees? = 0.0
    var longitud:CLLocationDegrees? = 0.0
    var notas:String?=""
    var direccion:String?=""
    var latDelta: CLLocationDegrees = 0.2
    var lonDelta: CLLocationDegrees = 0.2
    @IBOutlet weak var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        map.delegate = self
        let span = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lonDelta)
        let coordinates = CLLocationCoordinate2D(latitude: latitud!, longitude: longitud!)
        let region = MKCoordinateRegion(center: coordinates, span: span)
        
        map.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.title = direccion
        annotation.subtitle = notas
        annotation.coordinate = coordinates
        map.addAnnotation(annotation)
        
        map.selectAnnotation(annotation, animated: true)
        
        let cordinates2 = CLLocationCoordinate2D(latitude: 19.3041764, longitude: -99.1922307)
        
        let sourcePlacemark = MKPlacemark(coordinate: coordinates)
        let sourceMapItem = MKMapItem (placemark: sourcePlacemark)
        
        
        let destinationPlacemark = MKPlacemark(coordinate: cordinates2)
        let destinationMapItem = MKMapItem (placemark: destinationPlacemark)
        
        let directionRequest = MKDirections.Request()
        directionRequest.source = sourceMapItem
        directionRequest.destination = destinationMapItem
        directionRequest.transportType = .automobile
        
        let directions = MKDirections(request: directionRequest)
        directions.calculate{respueta , error in
            if let error = error {
                print("error -> \(error)")
            }
            if let response = respueta{
                let rute = response.routes[0]
                self.map.addOverlay(rute.polyline, level: .aboveRoads)
                let rect = rute.polyline.boundingMapRect
                self.map.setRegion(MKCoordinateRegion(rect), animated: true)
                
            }
        }
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ViewController3: MKMapViewDelegate{
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let render = MKPolylineRenderer(overlay: overlay)
        render.strokeColor = UIColor.blue
        render.lineWidth=2.0
        render.lineDashPattern = [2,4]
        render.alpha = 0.8
        return render
    }
}
