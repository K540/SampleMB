//
//  ViewController3.swift
//  SampleMB
//
//  Created by KSF on 2016/10/11.
//  Copyright © 2016年 KSF. All rights reserved.
//

import UIKit
import MapKit

class ViewController3: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var testMapView: MKMapView!
    
    @IBOutlet weak var testTextField: UITextField!
    
    @IBOutlet weak var label1: UILabel!
    
    var param: String = "init param"

    //最初からあるメソッド
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //デリゲート先に自分を設定する。
        testTextField.delegate = self
        
        self.label1.text = self.param

        self.view.endEditing(true)
        
        let myGeocoder:CLGeocoder = CLGeocoder()
        
        //住所
        let searchStr = self.param
        
        //住所を座標に変換する。
        myGeocoder.geocodeAddressString(searchStr, completionHandler: {(placemarks, error) in
            
            if(error == nil) {
                for placemark in placemarks! {
                    let location:CLLocation = placemark.location!
                    
                    //中心座標
                    let center = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
                    
                    //表示範囲
                    let span = MKCoordinateSpanMake(0.001, 0.001)
                    
                    //中心座標と表示範囲をマップに登録する。
                    let region = MKCoordinateRegionMake(center, span)
                    self.testMapView.setRegion(region, animated:true)
                    
                    //地図にピンを立てる。
                    let annotation = MKPointAnnotation()
                    annotation.coordinate = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
                    self.testMapView.addAnnotation(annotation)
                    
                }
            } else {
                self.label1.text = "検索できませんでした。"
            }
        })
    }
    
    
    //Returnキー押下時の呼び出しメソッド
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        
        let myGeocoder:CLGeocoder = CLGeocoder()
        
        //住所
        let searchStr = testTextField.text
        
        //住所を座標に変換する。
        myGeocoder.geocodeAddressString(searchStr!, completionHandler: {(placemarks, error) in
            
            if(error == nil) {
                for placemark in placemarks! {
                    let location:CLLocation = placemark.location!
                    
                    //中心座標
                    let center = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
                    
                    //表示範囲
                    let span = MKCoordinateSpanMake(0.001, 0.001)
                    
                    //中心座標と表示範囲をマップに登録する。
                    let region = MKCoordinateRegionMake(center, span)
                    self.testMapView.setRegion(region, animated:true)
                    
                    //地図にピンを立てる。
                    let annotation = MKPointAnnotation()
                    annotation.coordinate = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
                    self.testMapView.addAnnotation(annotation)
                    
                }
            } else {
                self.testTextField.text = "検索できませんでした。"
            }
        })
        
        //改行を入れない。
        return false
    }
}

