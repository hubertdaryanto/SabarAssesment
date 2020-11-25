//
//  ViewController.swift
//  Self Assesment
//
//  Created by Hubert Daryanto on 04/03/20.
//  Copyright © 2020 Hubert Daryanto. All rights reserved.
//

import UIKit
import CoreData

enum hasiltes: String{
    case sabar = "Anda sudah sabar, coba ditingkatkan!"
    case marah = "Anda harus banyak bersabar"
}

class ViewController: UIViewController, UITextFieldDelegate {

    var namaorang = "null"
    var antrivalue = 0.0
    var menghadapimasalahvalue = 0.0
    var perubahanvalue = 0.0
    var averagevalue = 0.0
    var result = "Introvert, Buruk"
    var pertanyaan: [String] = ["Ketika didahului oleh orang lain saat antri", "Ketika menghadapi masalah  URGENT", "ketika rencana berubah karena orang lain", "ketika rencana berubah karena bencana alam", "ketika tiba tiba ditegur oleh atasan"]
    var value: [Double] = [0.0 ,0.0 ,0.0 ,0.0 ,0.0]
   
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
    @IBOutlet weak var namaoranginput: UITextField!
    @IBOutlet weak var button1: UISwitch!
    @IBOutlet weak var button2: UISwitch!
    
    @IBOutlet weak var button5: UISwitch!
    @IBOutlet weak var button4: UISwitch!
    @IBOutlet weak var button3: UISwitch!
    //note
    //kepribadian: introvert, extrovert
    //hasil: baik, buruk
    //image belum sabar
    //https://i.pinimg.com/originals/e8/96/b2/e896b22af03f1433762f5cd01c6384fb.jpg
    //image sudah sabar
    //https://cdn-image.hipwee.com/wp-content/uploads/2016/09/hipwee-emojiisland.com_-1.png
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        label1.text = pertanyaan[0]
        label2.text = pertanyaan[1]
        label3.text = pertanyaan[2]
        label4.text = pertanyaan[3]
        label5.text = pertanyaan[4]
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func showAlert() {
        let alert = UIAlertController(title: namaorang, message: result, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    @IBAction func SubmitBtn(_ sender: UIButton) {
        if button1.isOn {
            value[0] = 1.0
        }
        
        if button2.isOn {
            value[1] = 1.0
        }
        
        if button3.isOn {
            value[2] = 1.0
        }
        
        if button4.isOn {
            value[3] = 1.0
        }
        
        if button5.isOn {
            value[4] = 1.0
        }
        
        for i in value{
            averagevalue += i
        }
        averagevalue /= 5
        result = averagevalue >= 0.6 ? hasiltes.sabar.rawValue : hasiltes.marah.rawValue
        let currenttime = Date()
        namaorang = "\(namaoranginput.text ?? "null")"
//        let mainstoryboard2 = UIStoryboard(name: "Main", bundle: Bundle.main)
//
//        guard let mainNavigation2 = mainstoryboard2.instantiateViewController(identifier: "hasil") as? ThirdViewController else {
//            return
//        }
//        present(mainNavigation2, animated: true, completion: nil)
        
//        showAlert()
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "SabarHistory", in: managedContext)!
        let item = NSManagedObject(entity: entity, insertInto: managedContext)
        item.setValue(currenttime, forKey: "assessAt")
        item.setValue(result, forKey: "hasil")
        do{
            try managedContext.save()
            print("data saved")
        }
        catch let err as NSError{
            print("failed to save", err)
        }
        performSegue(withIdentifier: "kirimdata", sender: self)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ThirdViewController{
            destination.hasildari = result
            destination.namaorang = namaorang
            destination.averagevalue = averagevalue
        }
    }
    @IBAction func value1button(_ sender: Any) {
        
    }
    @IBAction func value2button(_ sender: Any) {
        
    }
    @IBAction func value3button(_ sender: Any) {
        
    }
    
    @IBAction func value4button(_ sender: Any) {
        
    }
    @IBAction func value5button(_ sender: Any) {
        
    }
    
}

