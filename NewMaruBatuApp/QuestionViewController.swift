//
//  QuestionViewController.swift
//  NewMaruBatuApp
//
//  Created by 高橋康之 on 2020/09/16.
//  Copyright © 2020 yasu.com. All rights reserved.
//

import UIKit
                                //UITextFieldDelegateを追加
class QuestionViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //UITextFieldDelegateを追加したら、どこで使うか書く
        questionField.delegate = self
        
    }
    
    //問題と○☓を保存するため空の配列作る
    // useyが保存した時に内容を入れる配列
    var questions:[[String:Any]] = []
    
    
    
    //問題作る
    @IBOutlet var questionField: UITextField!
    
    
    //○☓選択
    @IBOutlet var marubatuController: UISegmentedControl!
    
    
    //保存ボタン
    @IBAction func tapSaveButton(_ sender: Any) {
        //もしquestionFieldのTextが空で無ければ
        if questionField.text != "" {
            //userが作成した問題と答えを格納するための変数(置き皿)
            var marubatuAnswer:Bool = true
            //selectedSegmentIndexは○☓左が0右が1を指定する 左だったら
            if marubatuController.selectedSegmentIndex == 0 {
                // ✗falseにします
                marubatuAnswer = false
            }else{
                //  ○trueにします
                marubatuAnswer = true
            }
            //変数名UserDefaults.standardを短くするため
            let userDefaults = UserDefaults.standard
            //objectで取ってきてる、現在保存されている配列をquestionsに格納
            if userDefaults.object(forKey: "questions") != nil{
                //useyが保存した時に内容を入れる配列を
                questions = userDefaults.object(forKey: "questions")
                    //
                    as! [[String: Any]]
            }
            //配列にアペンド
            questions.append(
                //questionとanswerに分けている
                ["question": questionField.text!, "answer":marubatuAnswer
                ])
            //保存
            userDefaults.set(questions,forKey: "questions")
            //ユーザーにアラートを表示
            shwoAlert(message: "問題が保存されました")
            //questionFieldを空にする
            questionField.text = ""
            
            print(questions)
            
        }else{
            //問題が入ってなかった時用
            shwoAlert(message: "問題を作成してください")
        }
    }
    
    
    
    //全て削除ボタン
    @IBAction func tapALLDeleteButton(_ sender: Any) {
        //変数名UserDefaults.standardを短くするため
        let userDefaults = UserDefaults.standard
        //保存している内容を削除
        userDefaults.removeObject(forKey: "questions")
        //空の配列で保存するために[]使用
        userDefaults.set([],forKey: "questions")
        //アラートを表示
        shwoAlert(message: "問題を全て削除します")
        
        
    }
    //戻るボタン
    @IBAction func tapBackButton(_ sender: Any) {
        //戻るボタンには必要
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    //アラートの関数
       func shwoAlert(message : String){
           //アラートのタイトル・messageはボタンの所で決めるためmessageにしてる、最後のはアラートのスタイル決めalertはシンプルなもの
           let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
           //アラートのアクション決め、ここは固定
           let close = UIAlertAction(title: "閉じる", style: .cancel, handler: nil)
           //
           alert.addAction(close)
           //アニメーション決め
           present(alert, animated: true, completion: nil)
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
