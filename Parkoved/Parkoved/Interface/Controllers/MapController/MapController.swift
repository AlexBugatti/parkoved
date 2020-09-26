//
//  MapController.swift
//  Parkoved
//
//  Created by Александр on 26.09.2020.
//  Copyright © 2020 AlexBugatti. All rights reserved.
//

import UIKit
import MapKit

class MapController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    var annotations = Amusement.mock()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let initialLocation = CLLocation(latitude: 52.60522, longitude: 39.602102)
//        mapView.se
        mapView.delegate = self
        let region = MKCoordinateRegion.init(center: CLLocationCoordinate2D.init(latitude: 52.60522, longitude: 39.602102), span: MKCoordinateSpan.init(latitudeDelta: 0.004, longitudeDelta: 0.004))
        mapView.setRegion(region, animated: true)
        mapView.addAnnotations(self.annotations)
        // Do any additional setup after loading the view.
    }

    @IBAction func onDidQuestTapped(_ sender: Any) {

    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        guard let an = view.annotation as? Amusement else {
            return
        }
        
        if an.isPresent {
            let quest = QuestController.init(nibName: nil, bundle: nil)
            self.navigationController?.pushViewController(quest, animated: true)
        }
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard let annotation = annotation as? Amusement else {
          return nil
        }
        
        let annotationIdentifier = "AnnotationIdentifier"

        var annotationView: MKAnnotationView?
        if let dequeuedAnnotationView = mapView.dequeueReusableAnnotationView(withIdentifier: annotationIdentifier) {
            annotationView = dequeuedAnnotationView
            annotationView?.annotation = annotation
        }
        else {
            let av = MKAnnotationView(annotation: annotation, reuseIdentifier: annotationIdentifier)
            av.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            annotationView = av
        }

        if let annotationView = annotationView {
            // Configure your annotation view here
//            annotationView.canShowCallout = true
            annotationView.image = annotation.icon
        }

        return annotationView
        
//        let identifier = "artwork"
//         var view: MKMarkerAnnotationView
//         // 4
//         if let dequeuedView = mapView.dequeueReusableAnnotationView(
//           withIdentifier: identifier) as? MKMarkerAnnotationView {
//           dequeuedView.annotation = annotation
//           view = dequeuedView
//         } else {
//           // 5
//           view = MKMarkerAnnotationView(
//             annotation: annotation,
//             reuseIdentifier: identifier)
////           view.canShowCallout = true
////           view.calloutOffset = CGPoint(x: -5, y: 5)
//           view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
//         }
//        view.image = annotation.icon
//        
//         return view
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
