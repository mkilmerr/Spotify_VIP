//
//  NetworkClient.swift
//  SpotifyVIP
//
//  Created by Marcos Kilmer Pereira de Aquino on 12/08/21.
//

import Foundation

enum NetworkClientTypeError: Error {
    case generic
    case invalidUrl
    case invalidResponse
}

protocol NetworkClientProtocol {
    func sendRequest(request: URLRequest, completion: @escaping(Data?, URLResponse?, Error?) -> ())
}

class NetworkClient: NetworkClientProtocol {
    static let shared = NetworkClient()
    var session: URLSession?
    
    init() {
        let configuration = URLSessionConfiguration.default
        configuration.urlCache = URLCache(memoryCapacity: 0, diskCapacity: 0, diskPath: nil)
        configuration.timeoutIntervalForRequest = 5.0
        
        session = URLSession(configuration: configuration)
    }
    
    func sendRequest(request: URLRequest, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        guard let url = request.url  else {
            completion(nil, nil, NetworkClientTypeError.invalidUrl)
            return
        }
        session?.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                completion(data, response, error)
            }
        }.resume()
    }
}
