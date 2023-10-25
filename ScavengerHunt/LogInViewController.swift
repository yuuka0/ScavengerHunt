//
//  LogInViewController.swift
//  ScavengerHunt
//
//  Created by yuuka on 2023/01/29.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class LogInViewController: UIViewController {
    
    @IBOutlet var mailAddressTextField: UITextField!
    
    @IBOutlet var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func registerButton(){
        if let mail = mailAddressTextField.text, let pass = passwordTextField.text{
            Auth.auth().createUser(withEmail:  mail, password: pass) { result, error in
                //エラーがあるとき
                if let error = error {
                    //エラーをプリントする
                    print(error.localizedDescription)
                    //違うとき
                } else {
                    print(result?.user.uid)
                    if let uid = result?.user.uid {
                        let user = User(name: "未設定", userId: uid)
                        guard let encodedUser = try? Firestore.Encoder().encode(user) else{ return }
                       //コレクションのusersの中にドキュメントを作る
                        Firestore.firestore().collection("users").document(uid).setData(encodedUser)
                        //画面遷移する
                        self.dismiss(animated: true, completion: nil)
                    }
                    
                    
                }
                
            }
        }
        //completion はこれをやった後何かやりたいときに書く
    }
    
    @IBAction func signInButton(){
        if let mail = mailAddressTextField.text, let pass = passwordTextField.text {
            Auth.auth().signIn(withEmail: mail, password: pass) { result,error in
                if let error = error{
                    //エラー（どんなエラーなのか説明）
                    print(error.localizedDescription)
                }else{
                    self.dismiss(animated: true, completion: nil)
                }
            }
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

// = は左に右の値を代入する

//var = variable = 変数
//let = 定数

/*
 
 //force unwrap (あんま使わない)
 Auth.auth().createUser(withEmail:  mailAddressTextField.text!, password: passwordTextField.text!)
 
 //if let
 if let mail = mailAddressTextField.text, let pass = passwordTextField.text {
 Auth.auth().createUser(withEmail:  mail, password: pass)
 } else {
 print("どっちかがnil")
 }
 
 //guard let
 guard let mail = mailAddressTextField.text, let pass = passwordTextField.text else {
 print("どっちかがnil")
 return
 }
 Auth.auth().createUser(withEmail:  mail, password: pass)
 
 
 //??
 Auth.auth().createUser(withEmail:  mailAddressTextField.text ?? "", password: passwordTextField.text ?? "")
 
 */
