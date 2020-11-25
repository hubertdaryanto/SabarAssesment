//
//  ThirdViewController.swift
//  Self Assesment
//
//  Created by Hubert Daryanto on 12/03/20.
//  Copyright © 2020 Hubert Daryanto. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var imagechanger: UIImageView!
    @IBOutlet weak var nama: UILabel!
    @IBOutlet weak var hasil: UILabel!
    var namaorang = ""
    var hasildari = ""
    var averagevalue: Double = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        nama.text = namaorang
        hasil.text = hasildari
        imagechanger.image = averagevalue >= 0.6 ? UIImage(named: "lebihdari0,5") : UIImage(named: "kurangdari0,5")
        print("view loaded")
        // Do any additional setup after loading the view.
//        ActivityIndicatorTest.hidesWhenStopped = true
//        ActivityIndicatorTest.color = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
    }
    
    @IBAction func kembali(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
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
