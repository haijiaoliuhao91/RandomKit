//
//  Character+RandomKit.swift
//  RandomKit
//
//  The MIT License (MIT)
//
//  Copyright (c) 2015 Nikolai Vazquez
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import Foundation

extension Character {

    /// Generates a random `Character` inside of the closed interval.
    ///
    /// - Parameters:
    ///     - interval: The interval within which the character
    ///       will be generated. Default value is `" "..."~"`.
    public static func random(interval: ClosedInterval<Character> = " "..."~") -> Character {
        var randomValue: UInt32 {
            let start   = interval.start.scalar.value
            let end     = interval.end.scalar.value
            let greater = max(start, end)
            let lesser  = min(start, end)
            return lesser + arc4random_uniform(greater - lesser + 1)
        }
        return Character(UnicodeScalar(randomValue))
    }

    /// Generates a random `Character` inside of the character set.
    ///
    /// - Parameters:
    ///     - characterSet: The character set within which the character
    ///       will be generated.
    public static func random(characterSet: NSCharacterSet) -> Character {
        return characterSet.asCharacterArray.random()
    }

    internal var scalar: UnicodeScalar {
        get {
            return String(self).unicodeScalars.first!
        }
        mutating set {
            self = Character(newValue)
        }
    }

}


