//
//  UITextFieldExtensions.swift
//  SwifterSwift
//
//  Created by Omar Albeik on 8/5/16.
//  Copyright © 2016 Omar Albeik. All rights reserved.
//

#if os(iOS) || os(tvOS)
import UIKit


// MARK: - Properties
public extension UITextField {
	
	/// SwifterSwift: Check if text field is empty.
	public var isEmpty: Bool {
		if let text = self.text {
			return text.isEmpty
		}
		return true
	}
	
	/// SwifterSwift: Return text with no spaces or new lines in beginning and end.
	public var trimmedText: String? {
		return text?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
	}
}


// MARK: - Methods
public extension UITextField {
	
	/// SwifterSwift: Clear text.
	public func clear() {
		text = ""
		attributedText = NSAttributedString(string: "")
	}
	
	/// SwifterSwift: Set placeholder text color.
	///
	/// - Parameter color: placeholder text color.
	public func setPlaceHolderTextColor(_ color: UIColor) {
		self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSForegroundColorAttributeName: color])
	}
	
}
#endif
