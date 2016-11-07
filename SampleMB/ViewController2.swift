//
//  ViewController2.swift
//  SampleMB
//
//  Created by KSF on 2016/10/11.
//  Copyright © 2016年 KSF. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController2: UIViewController, CLLocationManagerDelegate {
    
    // 現在地の位置情報の取得にはCLLocationManagerを使用
    var lm: CLLocationManager!
    // 取得した緯度を保持するインスタンス
    var latitude: CLLocationDegrees!
    // 取得した経度を保持するインスタンス
    var longitude: CLLocationDegrees!
    
    var dic = ["mylat":0.01, "mylon":0.01]
    
    @IBOutlet weak var testLabel: UILabel!
    
    @IBAction func unownedToTop(_ segue: UIStoryboardSegue) {}
    
    @IBAction func testSegmentedControl(_ sender: UISegmentedControl) {
        
        // セグメント番号で条件分岐させる
        switch sender.selectedSegmentIndex {
        case 0:
            testLabel.text = "1kmを選択！"
            dic["mylat"] = 0.01
            dic["mylon"] = 0.01
        case 1:
            testLabel.text = "3kmを選択！"
            dic["mylat"] = 0.03
            dic["mylon"] = 0.03
        case 2:
            testLabel.text = "5kmを選択！"
            dic["mylat"] = 0.05
            dic["mylon"] = 0.05
        case 3:
            testLabel.text = "10kmを選択！"
            dic["mylat"] = 0.1
            dic["mylon"] = 0.1
        default:
            testLabel.text = "選択なし！"
        }
    }
    
    @IBAction func ButoonTouchUpInside(_ sender: AnyObject) {
        // フィールドの初期化
        lm = CLLocationManager()
        longitude = CLLocationDegrees()
        latitude = CLLocationDegrees()
        
        // CLLocationManagerをDelegateに指定
        lm.delegate = self
        
        // 位置情報取得の許可を求めるメッセージの表示．必須．
        lm.requestAlwaysAuthorization()
        // 位置情報の精度を指定．任意，
        // lm.desiredAccuracy = kCLLocationAccuracyBest
        // 位置情報取得間隔を指定．指定した値（メートル）移動したら位置情報を更新する．任意．
        // lm.distanceFilter = 100
        
        // GPSの使用を開始する
        lm.startUpdatingLocation()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ShowMapView" {
            
            let secondViewController:ViewController7 = segue.destination as! ViewController7
            
            // 変数:遷移先ViewController型 = segue.destinationViewController as 遷移先ViewController型
            // segue.destinationViewController は遷移先のViewController
            
            secondViewController.dic = self.dic
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /* 位置情報取得成功時に実行される関数 */
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // 取得した緯度がnewLocation.coordinate.longitudeに格納されている
        latitude = locations.last!.coordinate.latitude
        // 取得した経度がnewLocation.coordinate.longitudeに格納されている
        longitude = locations.last!.coordinate.longitude
        // 取得した緯度・経度をLogに表示
        NSLog("latiitude: \(latitude) , longitude: \(longitude)")
        
        // GPSの使用を停止する．停止しない限りGPSは実行され，指定間隔で更新され続ける．
        // lm.stopUpdatingLocation()
    }
    
    /* 位置情報取得失敗時に実行される関数 */
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        // この例ではLogにErrorと表示するだけ．
        NSLog("Error")
    }
}

