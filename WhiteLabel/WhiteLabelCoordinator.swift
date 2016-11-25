//
//  WhiteLabelCoordinator.swift
//  OverridableExample
//
//  Created by Vincent PRADEILLES on 16/10/2016.
//  Copyright © 2016 Vincent PRADEILLES. All rights reserved.
//

import Foundation

public protocol WhiteLabelWrapper {
    var whiteLabelCoordinator: WhiteLabelCoordinator? { get }
}

public class WhiteLabelCoordinator: NSObject {
    
    private let window: UIWindow?
    
    public init(window: UIWindow?) {
        self.window = window
    }
    
    public func setUpApp() {
        let mainViewController = UIStoryboard(name: "Welcome", bundle: Bundle.whiteLabelBundle()).instantiateInitialViewController()
        self.window?.rootViewController = mainViewController
        self.window?.makeKeyAndVisible()
    }
    
}
