//
//  TabBarController.swift
//  ScavengerHunt
//
//  Created by yuuka on 2023/01/29.
//

import UIKit
import FirebaseAuth

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        try! Auth.auth().signOut()
        // Do any additional setup after loading the view.
    
       // if Auth.auth().currentUser == nil{
            //ユーザー情報がないとき（ログインしていない時）
       //     self.performSegue(withIdentifier: "toLogInView", sender: nil)
//            let loginView = LogInViewController()
//            self.present(loginView, animated: true)
        }
        //else {
            //ユーザー情報がある時（ログインしている時）
            
        //}

   // }
    
    override func viewDidAppear(_ animated: Bool) {
        if Auth.auth().currentUser == nil{
            //ユーザー情報がないとき（ログインしていない時）
            self.performSegue(withIdentifier: "toLogInView", sender: nil)
   

        }
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
