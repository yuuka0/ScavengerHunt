//
//  UserViewController.swift
//  ScavengerHunt
//
//  Created by yuuka on 2023/01/14.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

class UserViewController: UIViewController,UITextFieldDelegate {
    @IBOutlet var matchTimesLabel: UILabel!
    @IBOutlet var wonTimesLabel: UILabel!
    @IBOutlet var highscoreLabel: UILabel!
    @IBOutlet var aiconImageButton: UIButton!
    @IBOutlet var backgroundImageButton: UIButton!
    @IBOutlet var nameTextField: UITextField!
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
        matchTimesLabel.layer.borderColor = UIColor.black.cgColor
        matchTimesLabel.layer.borderWidth = 0.5
        wonTimesLabel.layer.borderColor = UIColor.black.cgColor
        wonTimesLabel.layer.borderWidth = 0.5
        highscoreLabel.layer.borderColor = UIColor.black.cgColor
        highscoreLabel.layer.borderWidth = 0.5
        // Do any additional setup after loading the view.
        aiconImageButton.layer.cornerRadius = 100
        aiconImageButton.layer.borderWidth = 10
        aiconImageButton.layer.borderColor = UIColor.white.cgColor
        // Firestore.firestore().collection("users").document(uid).setData(encodedUser)
        if let uid = Auth.auth().currentUser?.uid{
            Firestore.firestore().collection("users").document(uid).getDocument { snapshot, error in
                //                snapshot?.data()
                
                guard let user = try? Firestore.Decoder().decode(User.self, from: snapshot?.data()) else {
                    print("error")
                    return
                }
                self.nameTextField.text = user.name
                self.user = user
            }
            
        }
        
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        
        /*
         if let name = nameTextField.text {
         self.user.name = name
         } else {
         self.user.name = "未設定"
         }*/
        //更新処理
        
        //最近のUserのユーザーIDを取得
        if let uid = Auth.auth().currentUser?.uid{
            //もしもnameTextField.textがnilじゃなければnameTextField.textを、nilだったら未設定を代入
            self.user.name = nameTextField.text ?? "未設定"
            guard let encodedUser = try? Firestore.Encoder().encode(user) else{ return true }
            Firestore.firestore().collection("users").document(uid).setData(encodedUser)
        }
        
        
        // self.user.name = nameTextField.text
        return true
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
//ユーザー画面のアイコンの画像を変更するコード　＊問題点：画像がボタンをはみ出して表示される
extension UserViewController:UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.originalImage] as? UIImage
        self.aiconImageButton.setImage(image, for: .normal)
        //mask で覆い隠す
        self.aiconImageButton.layer.masksToBounds = true
//        aiconImageButton.imageView?.contentMode = .scaleAspectFit
        //btn.contentHorizontalAlignment = .fill
        //btn.contentVerticalAlignment = .fill
    }
    
    @IBAction func aiconButton(){
        
        let imagePickerController:UIImagePickerController = UIImagePickerController()
        imagePickerController.sourceType = UIImagePickerController.SourceType.photoLibrary
        imagePickerController.delegate = self
        self.present(imagePickerController, animated:true,completion:nil)
    }
    
  
    
    func backgroundImagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let backgroundImage = info[.originalImage] as? UIImage
        self.backgroundImageButton.setImage(backgroundImage, for: .normal)
        self.backgroundImageButton.layer.masksToBounds = true
//        backgroundImageButton.layer.cornerRadius = 100
//        aiconImageButton.imageView?.contentMode = .scaleAspectFit
        //btn.contentHorizontalAlignment = .fill
        //btn.contentVerticalAlignment = .fill
    }
    
    @IBAction func backgroundButton(){
        let backgroundImagePickerController:UIImagePickerController = UIImagePickerController()
        backgroundImagePickerController.sourceType = UIImagePickerController.SourceType.photoLibrary
        backgroundImagePickerController.delegate = self
        self.present(backgroundImagePickerController, animated:true,completion:nil)
    }
    
}
