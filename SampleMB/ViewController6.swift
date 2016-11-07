//
//  ViewController6.swift
//  SampleMB
//
//  Created by KSF on 2016/10/20.
//  Copyright © 2016年 KSF. All rights reserved.
//

import UIKit

class ViewController6: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let image1 = UIImage(named: "dog.jpg")
    let image2 = UIImage(named: "cat.jpg")
    let image3 = UIImage(named: "piyo.jpg")
    let image4 = UIImage(named: "seal.jpg")

    // 画像のファイル名
    let imageNames = ["dog.jpg", "cat.jpg", "piyo.jpg", "seal.jpg"]
    
    // 画像のタイトル
    let imageTitles = ["いぬ", "ねこ", "ひよこ", "あざらし"]
    
    // 画像の説明
    let imageDescriptions = [
        "きょうのわんこ",
        "どようびのにゃんこ",
        "ぴよ大行進",
        "癒し系ごまちゃん",
    ]
    // セルの個数を指定するデリゲートメソッド（必須）
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageNames.count
    }
    
    // セルに値を設定するデータソースメソッド（必須）
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // セルを取得する（""の中はstoryboardでTable View CellのIdentifierに設定した値を入れる！！）
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell") as! CustomTableViewCell
        
        // セルに値を設定する
        cell.myImageView.image = UIImage(named: imageNames[indexPath.row])
        cell.myTitleLabel.text = imageTitles[indexPath.row]
        cell.myDescriptionLabel.text = imageDescriptions[indexPath.row]
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
