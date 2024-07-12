//
//  BottomPopupUtils.swift
//  Spatch
//
//  Created by Timothy Obeisun on 7/12/24.
//

import UIKit

typealias BottomPresentableViewController = BottomPopupAttributesDelegate & UIViewController

public protocol BottomPopupDelegate: AnyObject {
    func bottomPopupViewLoaded()
    func bottomPopupWillAppear()
    func bottomPopupDidAppear()
    func bottomPopupWillDismiss()
    func bottomPopupDidDismiss()
    func bottomPopupDismissInteractionPercentChanged(from oldValue: CGFloat, to newValue: CGFloat)
}

public extension BottomPopupDelegate {
    func bottomPopupViewLoaded() {}
    func bottomPopupWillAppear() {}
    func bottomPopupDidAppear() {}
    func bottomPopupWillDismiss() {}
    func bottomPopupDidDismiss() {}
    func bottomPopupDismissInteractionPercentChanged(from oldValue: CGFloat, to newValue: CGFloat) {}
}

public protocol BottomPopupAttributesDelegate: AnyObject {
    var popupHeight: CGFloat { get }
    var popupTopCornerRadius: CGFloat { get }
    var popupPresentDuration: Double { get }
    var popupDismissDuration: Double { get }
    var popupShouldDismissInteractivelty: Bool { get }
    var popupDimmingViewAlpha: CGFloat { get }
    var popupShouldBeganDismiss: Bool { get }
    var popupViewAccessibilityIdentifier: String { get }
}

public struct BottomPopupConstants {
    static let kDefaultHeight: CGFloat = 377.0
    static let kDefaultTopCornerRadius: CGFloat = 10.0
    static let kDefaultPresentDuration = 0.5
    static let kDefaultDismissDuration = 0.5
    static let dismissInteractively = true
    static let shouldBeganDismiss = true
    static let kDimmingViewDefaultAlphaValue: CGFloat = 0.5
    static let defaultPopupViewAccessibilityIdentifier: String = "bottomPopupView"
}
