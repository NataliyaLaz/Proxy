//
//  LoadImageService.swift
//  Proxy
//
//  Created by Nataliya Lazouskaya on 21.10.22.
//

import Foundation

class LoadImageService: LoadServiceProtocol {
    
    func loadImage(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        let config = URLSessionConfiguration.default
        config.requestCachePolicy = .reloadIgnoringLocalCacheData // we don't need cashing
        config.urlCache = nil
        
        let session = URLSession.init(configuration: config)// не делаем через singleton shared, тк там свои конфигурации созданы, создаю свои настройки
        session.dataTask(with: url, completionHandler: completion).resume()
    }
}
