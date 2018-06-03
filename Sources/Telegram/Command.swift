//
//  Command.swift
//  SwiftyBot
//
//  The MIT License (MIT)
//
//  Copyright (c) 2016 - 2018 Fabrizio Brancati.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

import BFKit
import Foundation

/// Telegram command.
public struct Command {
    /// Command.
    private(set) public var command: String
    /// Command parameters.
    private(set) public var parameters: String
    
    /// Initialize a command.
    ///
    /// - Parameters:
    ///   - command: Command to be created.
    ///   - text: User sent message text.
    public init?(_ text: String) {
        guard text.starts(with: "/"), !text.isEmpty else {
            return nil
        }

        let spaceIndex = text.index(of: " ")
        self.command = spaceIndex != -1 ? text.substring(to: spaceIndex) : text
        self.command = self.command.replacingOccurrences(of: "/", with: "")
        self.parameters = spaceIndex != -1 ? text.substring(from: spaceIndex + 1) : ""
    }
}
