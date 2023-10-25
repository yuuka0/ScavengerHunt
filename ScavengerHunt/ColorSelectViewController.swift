//
//  ColorSelectViewController.swift
//  ScavengerHunt
//
//  Created by yuuka on 2023/02/26.
//

import UIKit

class ColorSelectViewController: UIViewController {
    
    var colorPicker = UIColorPickerViewController()
    //選択された色
    var selectedColor = UIColor.white
    @IBOutlet var colorPickButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       //delegateの場所を教えてあげている　これを書かないとdelegateを読み込むことはできない
        colorPicker.delegate = self
        colorPickButton.backgroundColor = selectedColor
       
        // Do any additional setup after loading the view.
    }
    
    func appearColorPicker(){
        colorPicker.supportsAlpha = true
        colorPicker.selectedColor = selectedColor
        present(colorPicker, animated: true)
    }
    
    @IBAction func colorPickerButton(){
        appearColorPicker()

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
        if let destinationVC = segue.destination as? TakePhotoViewController {
          // 渡したい色の情報をdestinationVCのプロパティにセットする
          destinationVC.color1 = selectedColor
        }
      }
    }

    
}

extension ColorSelectViewController: UIColorPickerViewControllerDelegate{
    func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController) {
        selectedColor = viewController.selectedColor
        colorPickButton.backgroundColor = selectedColor
        //.whiteか.blackかどっちかを返す
   //     selectedColor.textColor
        //ボタンのテキストの文字をselectedColor.textColorに変える

        colorPickButton.tintColor = selectedColor.textColor
//        colorPickButton.setTitleColor(selectedColor.textColor, for: .normal)
       
    }
    
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        print("dismissed colorPicker")
    }
}
