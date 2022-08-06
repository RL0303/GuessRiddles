//
//  FirstPageViewController.swift
//  GuessRiddles
//
//  Created by 林辰澤 on 2022/8/5.
//

import UIKit

class FirstPageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        initialUI()
        // Do any additional setup after loading the view.
    }
    
    func initialUI(){

        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        
        gradientLayer.colors = [UIColor(red: 1, green: 251/255, blue: 167/255, alpha: 1).cgColor,
                                UIColor(red: 1, green: 145/255, blue: 167/255, alpha: 1).cgColor]
        view.layer.insertSublayer(gradientLayer, at: 0)
        
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
