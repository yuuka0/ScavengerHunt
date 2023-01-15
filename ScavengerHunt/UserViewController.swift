//
//  UserViewController.swift
//  ScavengerHunt
//
//  Created by yuuka on 2023/01/14.
//

import UIKit

class UserViewController: UIViewController {
    @IBOutlet var matchTimesLabel: UILabel!
    @IBOutlet var wonTimesLabel: UILabel!
    @IBOutlet var highscoreLabel: UILabel!
    @IBOutlet var aiconImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        matchTimesLabel.layer.borderColor = UIColor.black.cgColor
        matchTimesLabel.layer.borderWidth = 0.5
        wonTimesLabel.layer.borderColor = UIColor.black.cgColor
        wonTimesLabel.layer.borderWidth = 0.5
        highscoreLabel.layer.borderColor = UIColor.black.cgColor
        highscoreLabel.layer.borderWidth = 0.5
        // Do any additional setup after loading the view.
        aiconImageView.layer.cornerRadius = 100
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
