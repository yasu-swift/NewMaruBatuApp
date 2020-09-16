//
//  ViewController.swift
//  NewMaruBatuApp
//
//  Created by 高橋康之 on 2020/09/15.
//  Copyright © 2020 yasu.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //初期画面に問題を表示
        showQuestion()
    }
    
    //
    override func viewWillAppear(_ animated: Bool) {
        //まずquestionsの配列を空に
        questions = []
        
        //UserDefaultsがnilでなければ
        if UserDefaults.standard.object(forKey: "questions") != nil{
            //questionsに  型の指定String:Any  で取ってこれた
            questions = UserDefaults.standard.object(forKey: "questions") as! [[String:Any]]
        }
        //初期画面に問題を表示
        showQuestion()
        
    }
    
    //問題表示
    @IBOutlet var questionLabel: UILabel!
    
    //問題番号INT型の変数
    var currentQuestionNum = 0
    
    var questions : [[String:Any]] = []
    //辞書型 true.falseに分ける
//    let questions:[[String:Any]] = [
//        ["question":"コーラは美味い","answer":true],
//        ["question":"鶏肉は美味い","answer":true],
//        ["question":"パセリは美味い","answer":false]
//    ]
    
    func showQuestion(){
        
        //もし 問題の数 > 問題番号INT型の変数 なら
        if questions.count > currentQuestionNum{
            
            //問題文[何番目]ですか？
            let question = questions[currentQuestionNum]
            
            //もしquestionがStringならばQuetionLabelにTextを表示しなさい
            //as?Stringはお作法
            if let que = question["question"] as? String {
                //問題文の表示
                questionLabel.text = que
                //ボタン使える
                batuButton.isEnabled = true
                maruButton.isEnabled = true
            }
            
        }else{
            //問題文が表示されない
            
            questionLabel.text = "問題を作ってください"
            //ボタン使えない
            batuButton.isEnabled = false
            maruButton.isEnabled = false
            
        }
        
    }
    
    //答えがあっているかの確認するための関数(ボタンに引用する)  引数
    func checAnswer(userAnswer:Bool){
        //格納して
        let question = questions[currentQuestionNum]
        if let ans = question["answer"] as? Bool {
            //userAnswerとansが同じなら次に進める
            //正解
            if userAnswer == ans{
                currentQuestionNum += 1
                //下の関数
                shwoAlert(message: "正解")
                
            }else{
                //不正解
                currentQuestionNum += 1
                //下の関数
                shwoAlert(message: "不正解")
            }
        }else{
            //それ以外
            print("答えがありません")
            return
        }
        //もしcurrentQuestionNum >= questions.countなら
        if currentQuestionNum >= questions.count {
            //currentQuestionNumを0にします
//            currentQuestionNum = 0
        }
        
        //問題の表示
        //正解だったら次の問題が表示される
        //不正解だったら、そのまま同じ問題が表示される
        showQuestion()
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
    
    
    @IBOutlet var batuButton: UIButton!
    
    
    @IBOutlet var maruButton: UIButton!
    
    
    
    @IBAction func batuButton(_ sender: Any) {
        //上の関数を入れてBool値設定
        checAnswer(userAnswer: false)
        
    }
    
    @IBAction func maruButton(_ sender: Any) {
        //上の関数を入れてBool値設定
        checAnswer(userAnswer: true)
    }
    
    
    @IBAction func backButton(_ sender: Any) {
        //戻る
        self.dismiss(animated: true, completion: nil)

    }
    
    
    @IBAction func questionCreate(_ sender: Any) {
        //画面遷移
        let storyboard: UIStoryboard = self.storyboard!
        let addQ = storyboard.instantiateViewController(withIdentifier: "questionView")
        self.present(addQ,animated: true,completion: nil)
        
    }
    

}

