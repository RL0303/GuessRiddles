//
//  ResultViewController.swift
//  GuessRiddles
//
//  Created by 林辰澤 on 2022/8/5.
//

import UIKit

class ResultViewController: UIViewController {
    
    //用來顯示選擇的選項及結果的Label，一樣用陣列的方式，把Segue依序拉到每個Label上
    
    @IBOutlet var choiceLabel: [UILabel]!
    @IBOutlet var resultLabel: [UILabel]!
    
    //儲存傳輸過來的選項及結果文字的陣列，需要給個範圍，因為各有4個值所以count = 4
    var choiceArray = [String](repeating: "", count: 4)
    var resultArray = [String](repeating: "", count: 4)
    
    //需要的參數包含coder，跟用來儲存傳輸過來的資料的property
    init?(coder: NSCoder, choiceArray: [String], resultArray: [String]){
        
        //因為有4個選項跟結果，用for迴圈執行
        for i in 0...3{
            self.choiceArray[i] = choiceArray[i]
            self.resultArray[i] = resultArray[i]
        }
        super.init(coder: coder)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func initialUI(){
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor(red: 1, green: 251/255, blue: 167/255, alpha: 1).cgColor,
                                UIColor(red: 1, green: 145/255, blue: 167/255, alpha: 1).cgColor]
        view.layer.insertSublayer(gradientLayer, at: 0)
        
    }
    
    
    func loadResult(){
        //分別有4個選項跟結果，用for迴圈執行4次
        for i in 0...3{
            choiceLabel[i].text = "你的答案是：\(choiceArray[i])"
            resultLabel[i].text = resultArray[i]
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialUI()
        loadResult()
        
        // Do any additional setup after loading the view.
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
