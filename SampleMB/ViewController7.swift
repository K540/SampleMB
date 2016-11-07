//
//  ViewController.swift
//  SampleMB
//
//  Created by KSF on 2016/10/11.
//  Copyright © 2016年 KSF. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController7: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var myMapView: MKMapView!
    
    var locationManager:CLLocationManager?
    
    var dic:[String:Double] = [:]
    
//    var longitude: CLLocationDegrees!
//    var latitude: CLLocationDegrees!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager = CLLocationManager()
        
            locationManager?.delegate = self
            
        // 位置情報取得確認のメッセージを表示。必須。
        locationManager?.requestAlwaysAuthorization()
        
        
        let status = CLLocationManager.authorizationStatus()
        // 位置情報取得の認証状態で分岐
        switch status{
        case .restricted, .denied:
            break
        case .notDetermined:
            if ((locationManager?.responds(to: #selector(CLLocationManager.requestWhenInUseAuthorization))) != nil){
                // iOS8ではinfo.plistに"requestWhenInUseAuthorization"か、"requestAlwaysAuthorization"を記載しないといけない
                // requestWhenInUseAuthorization:起動中のみ使用、requestAlwaysAuthorization:いつでも使用できる。
                
                // 精度の指定
                locationManager?.desiredAccuracy = kCLLocationAccuracyBestForNavigation
                locationManager?.requestWhenInUseAuthorization()
                // 位置情報取得の開始
                locationManager?.startUpdatingLocation()
            }else{
                locationManager?.desiredAccuracy = kCLLocationAccuracyBestForNavigation
                locationManager?.startUpdatingLocation()
            }
        case .authorizedWhenInUse, .authorizedAlways:
            // 従来の位置情報追跡リクエストの方法
            locationManager?.startUpdatingLocation()
        default:
            break
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        locationManager?.startUpdatingLocation()
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

 
    // 位置情報を取得したときに呼ばれる。Androidでのコールバックかも。
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // 取得した位置情報の緯度経度
        let latitude = locations.last!.coordinate.latitude
        let longitude = locations.last!.coordinate.longitude
        let location = CLLocationCoordinate2DMake(latitude,longitude)
        
        // 表示するマップの中心を、取得した位置情報のポイントに指定
        myMapView.setCenter(location, animated: true)
        
        // 表示する領域を設定する
        var region: MKCoordinateRegion = myMapView.region
        // 領域設定の中心
        region.center = location
        // 表示する領域の拡大・縮小の係数
        region.span.latitudeDelta = dic["mylat"]!
        region.span.longitudeDelta = dic["mylon"]!
        
        // ピンのオブジェクトを生成
        let pointAnnotation: MKPointAnnotation = MKPointAnnotation()
        
        // ピンの位置を取得した位置情報の位置に設定
        pointAnnotation.coordinate = location
        // ピンをタップした際に表示される吹き出しの内容
        pointAnnotation.title = "現在地"
        
        // 設定したピンをマップ上に反映
        myMapView.addAnnotation(pointAnnotation)
        // 決定した表示設定をMapViewに適用
        myMapView.setRegion(region, animated: true)
        
        // 地図の形式。Standardがデフォルトの地図。Satteliteが航空地図。
        myMapView.mapType = MKMapType.standard
        // 位置情報は既に取得したので、これ以降取得を行わないように位置情報取得を停止
        locationManager?.stopUpdatingLocation()
    }

    // 位置情報取得が失敗した際に呼ばれる。
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
    }
    
}

