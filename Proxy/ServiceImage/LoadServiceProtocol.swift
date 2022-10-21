//
//  LoadServiceProtocol.swift
//  Proxy
//
//  Created by Nataliya Lazouskaya on 21.10.22.
//

import Foundation

protocol LoadServiceProtocol {
    func loadImage(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ())
}


