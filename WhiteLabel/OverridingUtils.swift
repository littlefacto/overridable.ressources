//
//  OverridingUtils.swift
//  OverridableExample
//
//  Created by Vincent PRADEILLES on 16/10/2016.
//  Copyright © 2016 Vincent PRADEILLES. All rights reserved.
//

import Foundation

internal extension Bundle {
    class func whiteLabelBundle() -> Bundle? {
        return Bundle(identifier: Constants.frameworkBundleIdentifier)
    }
}

public func OverridableStoryboard(named name: String) -> UIStoryboard {
    // "storyboardc" is the extension of compiled storyboards
    if let _ = Bundle.main.path(forResource: name, ofType: "storyboardc") {
        return UIStoryboard(name: name, bundle: nil)
    } else {
        return UIStoryboard(name: name, bundle: Bundle.whiteLabelBundle())
    }
}

public func OverridableImage(named name: String) -> UIImage? {
    if let overridenImage = UIImage(named: name) {
        return overridenImage
    } else {
        return UIImage(named: name, in: Bundle.whiteLabelBundle(), compatibleWith: nil)
    }
}
public func OverridableLocalizedString(key: String, value: String = "", comment: String = "") -> String {
    return NSLocalizedString(key, tableName: "Override", bundle: Bundle.main, value: FrameworkLocalizedString(key, value: value), comment: comment)
}

private func FrameworkLocalizedString(_ key: String, value: String) -> String {
    guard let bundle =  Bundle.whiteLabelBundle() else { return "" }
    return NSLocalizedString(key, tableName: nil, bundle: bundle, value: value, comment: "")
}
