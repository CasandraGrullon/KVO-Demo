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
        })
    }
    
    deinit { // this is called when the object is no longer in memory
        //this is similar to removing the listener on view will disappear
        fontSizeObservation?.invalidate()
        iconNameObservation?.invalidate()
        
    }
    
}

