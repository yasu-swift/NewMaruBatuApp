//
//  AnswerViewController.swift
//  NewMaruBatuApp
//
//  Created by 高橋康之 on 2020/09/16.
//  Copyright © 2020 yasu.com. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
     
    }
    var trueNum:Int = 0
    var falseNum:Int = 0
    
    override func viewWillAppear(_ animated: Bool) {
    
        
    let userDefaults = UserDefaults.standard

        if userDefaults.object(forKey: "countKey") != nil{
            trueNum = userDefaults.object(forKey: "countKey") as! Int
        }
        
//        if userDefaults.object(forKey: "countKey") != nil{
//            falseNum = userDefaults.object(forKey: "countKey") as! Int
//        }
        
        print(trueNum)
        resultLabel.text = "\(trueNum)問正解"
        
    }
    
    @IBOutlet var resultLabel: UILabel!
    
//    var resultLabel = ["\(trueNum),門中,\(currentQuestionNum)門正解"]
         
    @IBAction func backButton(_ sender: Any) {
        //戻るボタンには必要
        self.dismiss(animated: true, completion: nil)
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
