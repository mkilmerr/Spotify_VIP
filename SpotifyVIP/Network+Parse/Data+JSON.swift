//
//  Data+JSON.swift
//  SpotifyVIP
//
//  Created by Marcos Kilmer Pereira de Aquino on 15/08/21.
//

import Foundation

extension Data {
     func jsonToDictionary() -> [String: Any]? {
        do {
            let json = try JSONSerialization.jsonObject(with: self, options: .allowFragments) as? [String: Any]
            return json
        } catch {
            return nil
        }
    }
    
    func jsonToDictionaryArray() -> [[String: Any]]? {
       do {
           let json = try JSONSerialization.jsonObject(with: self, options: .allowFragments) as? [[String: Any]]
           return json
       } catch {
           return nil
       }
   }
}
