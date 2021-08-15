//
//  Parsable.swift
//  SpotifyVIP
//
//  Created by Marcos Kilmer Pereira de Aquino on 12/08/21.
//

import Foundation

protocol Parsable {
    associatedtype T
    
    static func fromJSON(json: [String: Any]) -> T?
}

protocol ParsableArray {
    associatedtype T
    
    static func fromJSON(json: [[String: Any]]) -> T?
}
