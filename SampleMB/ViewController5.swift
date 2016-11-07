//
//  ViewController5.swift
//  SampleMB
//
//  Created by KSF on 2016/10/20.
//  Copyright © 2016年 KSF. All rights reserved.
//

import UIKit

class ViewController5: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let fruits = ["りんご", "みかん", "ぶどう"] //ここに処方箋送信と薬登録を行った薬局履歴データを入れれば良い？
    
    // セルの個数を指定するデリゲートメソッド（必須）
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruits.count
    }

    // セルに値を設定するデータソースメソッド（必須）
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // セルを取得する（""の中はstoryboardでTable View CellのIdentifierに設定した値を入れる！！）
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        
        // セルに表示する値を設定する
        cell.textLabel!.text = fruits[indexPath.row]
        
        return cell
    }
    
    // セルが選択された時に呼ばれるデリゲードメソッド
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("セル番号: \(indexPath.row) セルの内容: \(fruits[indexPath.row])")
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
