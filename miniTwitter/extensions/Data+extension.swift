//
//  Data+extension.swift
//  miniTwitter
//
//  Created by kulraj singh on 19/01/23.
//

import Foundation

extension Data {

    init<T>(value: T) {
        self = withUnsafePointer(to: value) { (ptr: UnsafePointer<T>) -> Data in
            return Data(buffer: UnsafeBufferPointer(start: ptr, count: 1))
        }
    }

    mutating func append<T>(value: T) {
        withUnsafePointer(to: value) { (ptr: UnsafePointer<T>) in
            append(UnsafeBufferPointer(start: ptr, count: 1))
        }
    }
    
    func to<T>(type: T.Type) -> T {
        return withUnsafeBytes {
            $0.load(as: T.self)
        }
    }
    
    func toString() -> String {
        return withUnsafeBytes {
            String(bytes: $0, encoding: .utf8) ?? ""
        }
    }
}
