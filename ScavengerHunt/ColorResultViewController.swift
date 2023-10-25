//
//  ColorResultViewController.swift
//  ScavengerHunt
//
//  Created by yuuka on 2023/04/23.
//

import UIKit

class ColorResultViewController: UIViewController {
    
    var color1: UIColor!
    var color2: UIColor!
    @IBOutlet var firstColorView: UIView!
    @IBOutlet var secondColorView: UIView!
    @IBOutlet var percentageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let matchPercentage = colorMatchPercentage(color1: color1, color2: color2)
        firstColorView.backgroundColor = color1
        secondColorView.backgroundColor = color2
        percentageLabel.text = String(format: "%.2f",matchPercentage) + "%"
    }
    
    /*
     func getColorMatchPercentage(firstColor: UIColor, secondColor: UIColor) -> Double {
        var red1: CGFloat = 0.0
        var green1: CGFloat = 0.0
        var blue1: CGFloat = 0.0
        var alpha1: CGFloat = 0.0
        
        var red2: CGFloat = 0.0
        var green2: CGFloat = 0.0
        var blue2: CGFloat = 0.0
        var alpha2: CGFloat = 0.0
        
        firstColor.getRed(&red1, green: &green1, blue: &blue1, alpha: &alpha1)
        secondColor.getRed(&red2, green: &green2, blue: &blue2, alpha: &alpha2)
        
        let redDiff = abs(red1 - red2)
        let greenDiff = abs(green1 - green2)
        let blueDiff = abs(blue1 - blue2)
        
        let totalDiff = redDiff + greenDiff + blueDiff
        
        let matchPercentage = (1 - (totalDiff / 3 / 255)) * 100
        
        return matchPercentage
    }
    */
    func colorMatchPercentage(color1: UIColor, color2: UIColor) -> Double {
        guard let components1 = color1.cgColor.components,
              let components2 = color2.cgColor.components,
              components1.count >= 3,
              components2.count >= 3 else {
            return 0.0
        }
        
        let r1 = components1[0]
        let g1 = components1[1]
        let b1 = components1[2]
        
        let r2 = components2[0]
        let g2 = components2[1]
        let b2 = components2[2]
        
        let distance = sqrt(pow((r1 - r2), 2) + pow((g1 - g2), 2) + pow((b1 - b2), 2))
        let maxDistance = sqrt(pow(1, 2) + pow(1, 2) + pow(1, 2))
        
        let percentage = (1 - (distance / maxDistance)) * 100
        return percentage
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
