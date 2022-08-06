//
//  QuizViewController.swift
//  GuessRiddles
//
//  Created by 林辰澤 on 2022/8/5.
//

import UIKit

class QuizViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet var optionButton: [UIButton]! //三個選項的按鈕存成陣列，Segue依序拉到按鈕上
    
    var questionIndex = 0  //用來判定顯示第幾個問題
    var chooseOptionIndex = 0  //用來判定選第幾個選項
    var choices = [String]()  //用來儲存選擇的選項文字
    var results = [String]()  //用來儲存選項對應的結果文字
    
    var questions = [
        // Q1
        Question(question: "長的少，短的多，腳去踩，手去摸。",
                 options: [Option(option: "香菸", result: "答錯了，答案是梯子"), Option(option: "冰棒", result: "答錯了，答案是梯子"), Option(option: "梯子", result: "恭喜答對！！") ]),
        // Q2
        Question(question: "兩姐妹，一樣長，酸甜苦辣她先嚐。", options: [Option(option: "太陽", result: "答錯了，答案是筷子"), Option(option: "筷子", result: "恭喜答對！！"), Option(option: "錢幣", result: "答錯了，答案是筷子") ]),
        // Q3
        Question(question: "在家臉上白，出門臉上花，遠近都能到，一去不回家。", options: [Option(option: "電話", result: "答錯了，答案是信"), Option(option: "電視", result: "答錯了，答案是信"), Option(option: "信", result: "恭喜答對！！")]),
        // Q4
        Question(question: "身小力不小，團結又勤勞。有時搬糧食，有時挖地道。", options: [Option(option: "螞蟻", result: "恭喜答對！！"), Option(option: "海馬", result: "答錯了，答案是螞蟻"), Option(option: "蜘蛛", result: "答錯了，答案是螞蟻")])
    ]
    
    
    
    func initialUI(){

        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor(red: 1, green: 251/255, blue: 167/255, alpha: 1).cgColor,
                                UIColor(red: 1, green: 145/255, blue: 167/255, alpha: 1).cgColor]
        view.layer.insertSublayer(gradientLayer, at: 0)
        
        
    }
    
    func qna(){
        //題目文字顯示，依照 questionIndex 的值判斷是第幾題
        questionLabel.text = questions[questionIndex].question
        //選項文字顯示，依照 questionIndex 的值及按鈕順序判斷要顯示哪個選項
        optionButton[0].setTitle(questions[questionIndex].options[0].option, for: .normal)
        optionButton[1].setTitle(questions[questionIndex].options[1].option, for: .normal)
        optionButton[2].setTitle(questions[questionIndex].options[2].option, for: .normal)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialUI()
        qna()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func chooseOption(_ sender: UIButton) {
        
        //用switch設定每個選項點擊時chooseOptionIndex代表的值，後續用來判斷是選第幾個選項
        switch sender{
        case optionButton[0]:
            chooseOptionIndex = 0
            print("chooseOptionIndex = 0")
        case optionButton[1]:
            chooseOptionIndex = 1
            print("chooseOptionIndex = 1")
        case optionButton[2]:
            chooseOptionIndex = 2
            print("chooseOptionIndex = 2")
        default:
            print("No option button")
        }
        
        //點擊按鈕後將選項文字及結果文字加入到陣列中儲存，questionIndex判斷是第幾題，chooseOptionIndex判斷是第幾個選項
        choices.append(questions[questionIndex].options[chooseOptionIndex].option)
        results.append(questions[questionIndex].options[chooseOptionIndex].result)
        
        //如果作答題數questionIndex<=2，表示只做了1～3題，因此questionIndex+1，繼續進入下一題，顯示題目及選項文字
        if questionIndex <= 2 {
            questionIndex += 1
            qna()
        //如果questionIndex = 3，表示已經做完4題，觸發顯示結果的Segue執行
        }else if questionIndex == 3{
            performSegue(withIdentifier: "showResult", sender: nil)
        }
    }
    
    
    @IBSegueAction func showResult(_ coder: NSCoder, sender: Any?, segueIdentifier: String?) -> ResultViewController? {
        
        return ResultViewController(coder: coder, choiceArray: choices, resultArray: results)
        
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
