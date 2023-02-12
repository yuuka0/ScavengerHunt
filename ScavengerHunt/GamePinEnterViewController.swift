//
//  GamePinEnterViewController.swift
//  ScavengerHunt
//
//  Created by yuuka on 2022/12/11.
//

import UIKit
import FirebaseFirestoreSwift
import FirebaseFirestore
class GamePinEnterViewController: UIViewController {
    @IBOutlet var gamePinTextField: UITextField!
  //  var gamePin = 0
    let firestore = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func enterButton(){
   //     gamePinTextField.text = String(gamePin)
        
        firestore.collection("gamePins").document("share").setData(["gamePin":gamePinTextField.text])
    }
    
    @IBAction func newGameButton(){
        
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
