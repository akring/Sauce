// 
//  ModifierTransformer.swift
//
//  Sauce
//  GitHub: https://github.com/clipy
//  HP: https://clipy-app.com
// 
//  Copyright © 2015-2020 Clipy Project.
//

#if os(macOS)
import Foundation
import Carbon
import AppKit

open class ModifierTransformer {}

// MARK: - Cocoa & Carbon
extension ModifierTransformer {
    public func carbonFlags(from cocoaFlags: NSEvent.ModifierFlags) -> Int {
        var carbonFlags: Int = 0
        if cocoaFlags.contains(.command) {
            carbonFlags |= cmdKey
        }
        if cocoaFlags.contains(.option) {
            carbonFlags |= optionKey
        }
        if cocoaFlags.contains(.control) {
            carbonFlags |= controlKey
        }
        if cocoaFlags.contains(.shift) {
            carbonFlags |= shiftKey
        }
        return carbonFlags
    }

    public func convertCharactorSupportCarbonModifiers(from carbonModifiers: Int) -> Int {
        var convertedCarbonModifiers: Int = 0
        if (carbonModifiers & optionKey) != 0 {
            convertedCarbonModifiers |= optionKey
        }
        if (carbonModifiers & shiftKey) != 0 {
            convertedCarbonModifiers |= shiftKey
        }
        return convertedCarbonModifiers
    }
}
#endif
