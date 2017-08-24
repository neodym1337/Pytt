//
//  JSONSerialization+Parse.swift
//  Pytt
//
//  Created by Hosk, Johan on 2017-08-18.
//  Copyright © 2017 Johan Hosk. All rights reserved.
//

import Foundation

extension JSONSerialization {
    
    static func jsonObject(withFilename fileName: String, in bundle: Bundle) -> Result<Any> {

        guard let jsonFileUrl = bundle.url(forResource: fileName, withExtension: "json") else {
            return .failure(JsonParsingError.URLError)
        }
        
        do {
            let data = try Data(contentsOf: jsonFileUrl)
            let json = try JSONSerialization.jsonObject(with: data, options: [])
            return .success(json)
        } catch {
            return .failure(error)
        }
    }
}

enum JsonParsingError: Error {
    case URLError
}
