//
//  Settings.swift
//  KVO-Demo
//
//  Created by casandra grullon on 4/7/20.
//  Copyright © 2020 casandra grullon. All rights reserved.
//

import Foundation

//Settings needs to be KVO compliant
@objc class Settings: NSObject {
    static var shared = Settings()
    
    @objc dynamic var fontSize: Int
    @objc dynamic var iconName: String
    
    override private init() {
        fontSize = 17
        iconName = "sun.haze.fill"
    }
}
