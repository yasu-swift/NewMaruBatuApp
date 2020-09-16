//
//  TopViewController.swift
//  NewMaruBatuApp
//
//  Created by 高橋康之 on 2020/09/16.
//  Copyright © 2020 yasu.com. All rights reserved.
//

import UIKit

class TopViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func questionPageButton(_ sender: Any) {
        //画面遷移
        let storyboard: UIStoryboard = self.storyboard!
        let addQ = storyboard.instantiateViewController(withIdentifier: "questionView")
        self.present(addQ,animated: true,completion: nil)
        
    }
    
    
    @IBAction func gameStartButton(_ sender: Any) {
        //画面遷移
        let storyboard: UIStoryboard = self.storyboard!
        let addQ = storyboard.instantiateViewController(withIdentifier: "view")
        self.present(addQ,animated: true,completion: nil)
        
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
