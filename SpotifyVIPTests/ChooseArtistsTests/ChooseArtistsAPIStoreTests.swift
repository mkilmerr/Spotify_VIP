//
//  ChooseArtistsAPIStoreTests.swift
//  SpotifyVIPTests
//
//  Created by Marcos Kilmer Pereira de Aquino on 04/09/21.
//

import XCTest
@testable import SpotifyVIP

class ChooseArtistsAPIStoreTests: XCTestCase {
    
    func testShouldFetchArtistsWithError() {
        let spy = ChooseArtistsAPIStoreSpy()
        spy.networkClientError = true
        
        spy.fetchArtists {_,_ in }
        XCTAssertFalse(spy.successRequest)
    }
    
    func testShouldFetchArtistsWithSuccess() {
        let spy = ChooseArtistsAPIStoreSpy()
        spy.networkClientError = false
        
        spy.fetchArtists {_,_ in }
        XCTAssertTrue(spy.successRequest)
    }
    
}

final class ChooseArtistsAPIStoreSpy: ChooseArtistsStoreProtocol {
    
    var sendRequest: Bool = false
    var networkClientError: Bool = false
    var successRequest: Bool = false
    
    public enum ChooseArtistsAPIStoreSpyNetworkError: Error {
        case invalidData
        case generic
    }
    
    func fetchArtists(completion: @escaping ([Artist]?, Error?) -> ()) {
        sendRequest = true
        
        if networkClientError {
            successRequest = false
            completion(nil, ChooseArtistsAPIStoreSpyNetworkError.generic)
        } else {
            successRequest = true
            let bundle = Bundle(for: ChooseArtistsAPIStoreTests.self)
            
            if let path = bundle.path(forResource: "top_artists", ofType: "json") {
                
                let url = URL(fileURLWithPath: path)
                
                do {
                    let data = try Data(contentsOf: url, options: Data.ReadingOptions.mappedIfSafe)
                    guard let json = data.jsonToDictionaryArray() else { return }
                    let artists = Artist.fromJSON(json: json)
                    completion(artists, nil)
                    
                } catch {
                    completion(nil, ChooseArtistsAPIStoreSpyNetworkError.invalidData)
                }
            }
        }
    }
}
