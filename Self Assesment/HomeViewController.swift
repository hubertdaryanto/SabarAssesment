//
//  HomeViewController.swift
//  Self Assesment
//
//  Created by Hubert Daryanto on 18/03/20.
//  Copyright © 2020 Hubert Daryanto. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

   
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: true)
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

    
    @IBAction func mulaiassess(_ sender: Any) {
        
//        let mainstoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
//
//        guard let mainNavigation = mainstoryboard.instantiateViewController(identifier: "assess") as? ViewController else {
//            return
//        }
//        present(mainNavigation, animated: true, completion: nil)
    }
    @IBAction func cekriwayat(_ sender: Any) {
//        let mainstoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
//
//        guard let mainNavigation = mainstoryboard.instantiateViewController(identifier: "riwayat") as? SecondViewController else {
//            return
//        }
//        present(mainNavigation, animated: true, completion: nil)
    }
}
