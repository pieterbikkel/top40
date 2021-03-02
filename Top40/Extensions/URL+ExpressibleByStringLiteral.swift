//
//  URL+ExpressibleByStringLiteral.swift
//  Top40
//
//  Created by Simon Schöpke on 02.03.21.
//

import Foundation

extension URL: ExpressibleByStringLiteral {
    public init(stringLiteral value: String) {
        self.init(string: value)!
    }
}
