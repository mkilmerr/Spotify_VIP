//
//  Artist.swift
//  SpotifyVIP
//
//  Created by Marcos Kilmer Pereira de Aquino on 12/08/21.
//

import Foundation

struct Artist {
    let artirstId: String
    let artirstName: String
    let artirstImageUrl: String
}

extension Artist: ParsableArray {
    
    private struct ArtistParsable {
        static let artirstId = "id"
        static let artirstName = "name"
        static let artirstImageUrl = "artists_image_url"
    }
    
    static func fromJSON(json: [[String : Any]]) -> Array<Artist>? {
        var artirsts: Array<Artist> = []
        
        json.map { item in
            if let artirstName = item[ArtistParsable.artirstName] as? String, let artirtsId = item[ArtistParsable.artirstId] as? String, let artirstImageUrl = item[ArtistParsable.artirstImageUrl] as? String {
                
                let artirst = Artist(artirstId: artirtsId, artirstName: artirstName, artirstImageUrl: artirstImageUrl)
                artirsts.append(artirst)
            }
        }
        return artirsts
    }
}

