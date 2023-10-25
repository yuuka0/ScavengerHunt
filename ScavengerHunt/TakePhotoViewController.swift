//
//  TakePhotoViewController.swift
//  ScavengerHunt
//
//  Created by yuuka on 2023/02/26.
//

import UIKit

class TakePhotoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    var color1: UIColor!
    var color2: UIColor!
    
    @IBOutlet var cameraImageView: UIImageView!
    @IBOutlet var colorView: UIView!
    @IBOutlet var completeButton: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    //
    //    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    //        let touch = touches.first
    //        if let point = touch?.location(in: view){
    //
    //        }
    //    }
    
    
    @IBAction func takePhoto(){
        
        //カメラ使えるかの確認
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            //カメラを起動
            
            let picker = UIImagePickerController()
            picker.sourceType = .camera
            picker.delegate = self
            
            picker.allowsEditing = true
            
            present(picker, animated:true, completion: nil)
        }else{
            print("error")
        }
        
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        cameraImageView.image = info[.editedImage] as? UIImage
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func imageViewTapped(_ sender: UITapGestureRecognizer){
        let point = sender.location(in: cameraImageView)
        let color = cameraImageView.getPixelColorAt(point: point)
        print(color)
        colorView.backgroundColor = color
        color2 = color
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mySegue" {
            if let destinationVC = segue.destination as? ColorResultViewController {
                // 渡したい色の情報をdestinationVCのプロパティにセットする
                destinationVC.color1 = color1
                destinationVC.color2 = color2
            }
        }
    }
    
    
}
