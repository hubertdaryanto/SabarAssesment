//
//  SecondViewController.swift
//  Self Assesment
//
//  Created by Hubert Daryanto on 12/03/20.
//  Copyright © 2020 Hubert Daryanto. All rights reserved.
//

import UIKit
import CoreData

class SecondViewController: UIViewController {
    
    var items: [NSManagedObject] = []
    
    @IBOutlet weak var timestamp: UILabel!
    @IBOutlet weak var hasil: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchrequest = NSFetchRequest<NSManagedObject>(entityName: "SabarHistory")
        do
        {
            items = try managedContext.fetch(fetchrequest)
            for data in items{
                var time = data.value(forKey: "assessAt")
                var hasill = data.value(forKey: "hasil")
                print(time)
                print(hasill)
            }
        }catch let err as NSError{
            print("Failed to load", err)
        }
//         print(items)
//        timestamp.text = String(time)
//        hasil.text = String(hasill)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func Dismiss(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
