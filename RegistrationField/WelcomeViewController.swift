//
//  WelcomeViewController.swift
//  RegistrationField
//
//  Created by Володя Рудик on 12.05.2025.
//

import UIKit

final class WelcomeViewController: UIViewController {
    
    @IBOutlet var welcomeMessageText: UILabel!
    var welcomeMessage: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeMessageText?.text = "Welcome, " + welcomeMessage + "!"
        
        let gradientLayer = CAGradientLayer()
                gradientLayer.frame = view.bounds
                gradientLayer.colors = [
                    UIColor.systemBlue.cgColor,
                    UIColor.systemPink.cgColor
                ]
                gradientLayer.endPoint = CGPoint(x: 1, y: 0)
                gradientLayer.startPoint = CGPoint(x: 1, y: 1)
                
                view.layer.insertSublayer(gradientLayer, at: 0)
    }

}
