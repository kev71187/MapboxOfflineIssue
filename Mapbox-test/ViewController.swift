//
//  ViewController.swift
//  Mapbox-test
//
//  Created by Alex Rouse on 7/10/19.
//  Copyright © 2019 Indigo. All rights reserved.
//

import UIKit
import Mapbox

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let dir = try! FileManager.default.url(for: .libraryDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        print("Path: \(dir.appendingPathComponent("Application Support").absoluteString)")

        let url = URL(string: "mapbox://styles/mapbox/satellite-streets-v9")!

        // SW [-122.41418550703368, 37.77815322805782]
        // NE [-122.39864849295364, 37.79351397378018]

        let bounds = MGLCoordinateBounds(
          sw: CLLocationCoordinate2D(latitude: 37.77815322805782, longitude: -122.41418550703368),
          ne: CLLocationCoordinate2D(latitude: 37.79351397378018, longitude: -122.39864849295364)
        )

        let region = MGLTilePyramidOfflineRegion(styleURL: url, bounds: bounds, fromZoomLevel: 14, toZoomLevel: 14)

        let data = Data()

        MGLOfflineStorage.shared.addPack(for: region, withContext: data) { (pack, error) in
            if let error = error {
                print("Error downloading the offline pack: \(error)")
            }
            else {
                print("Successfully downloaded the pack: \(String(describing: pack))")
                pack?.resume()
            }

        }

        let mapView = MGLMapView(frame: view.bounds)
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        mapView.setCenter(CLLocationCoordinate2D(latitude: 40.7326808, longitude: -73.9843407), zoomLevel: 12, animated: false)
        view.addSubview(mapView)
    }
}

