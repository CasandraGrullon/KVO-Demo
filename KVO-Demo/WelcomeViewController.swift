//
//  ViewController.swift
//  KVO-Demo
//
//  Created by casandra grullon on 4/7/20.
//  Copyright © 2020 casandra grullon. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    
    private var fontSizeObservation: NSKeyValueObservation?
    private var iconNameObservation: NSKeyValueObservation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureFontSizeObservation()
        configureIconNameObservation()
    }

    private func configureFontSizeObservation() {
        fontSizeObservation = Settings.shared.observe(\.fontSize, options: [.old, .new], changeHandler: { [weak self] (settings, change) in
            guard let newFontSize = change.newValue else {return}
            self?.welcomeLabel.font = UIFont(name: "Helvetica", size: CGFloat(newFontSize))
        })
    }
    private func configureIconNameObservation() {
        iconNameObservation = Settings.shared.observe(\.iconName, options: [.old, .new], changeHandler: { [weak self] (settings, change) in
            guard let newIconName = change.newValue else {return}
            self?.iconImageView.image = UIImage(systemName: "\(newIconName)")
            if newIconName == "icloud.fill" || newIconName == "globe" {
                self?.iconImageView.tintColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
                self?.welcomeLabel.textColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
            } else {
                self?.iconImageView.tintColor = #colorLiteral(red: 1, green: 0.7171183228, blue: 0, alpha: 1)
                self?.welcomeLabel.textColor = #colorLiteral(red: 0.8668374419, green: 0.5093212128, blue: 0, alpha: 1)
            }
        })
    }
    
    deinit { // this is called when the object is no longer in memory
        //this is similar to removing the listener on view will disappear
        fontSizeObservation?.invalidate()
        iconNameObservation?.invalidate()
        
    }
    
}

