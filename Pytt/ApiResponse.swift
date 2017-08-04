//
//  ApiResponse.swift
//  Pytt
//
//  Created by Hosk, Johan on 2017-07-28.
//  Copyright © 2017 Johan Hosk. All rights reserved.
//

// Network layer consists of the Request, the dispatcher (client), the task (gateway) and the response


import Foundation
import SwiftyJSON

protocol InitializableWithData {
    init(data: Data?) throws
}

protocol InitializableWithJson {
    init(json: JSON) throws
}

struct NetworkRequestError: Error {
    let error: Error?
    
    var localizedDescription: String {
        return error?.localizedDescription ?? "Network request error "
    }
}

struct ApiError: Error {
    let data: Data?
    let httpUrlResponse: HTTPURLResponse
}

struct ApiParseError: Error {
    static let code = 999
    
    let error: Error
    let httpUrlResponse: HTTPURLResponse
    let data: Data?
    
    var localizedDescription: String {
        return error.localizedDescription
    }
}

struct ApiResponse {
    let httpUrlResponse: HTTPURLResponse
    let data: Data
    let json: JSON
    
    init(data: Data, httpUrlResponse: HTTPURLResponse) throws {
        self.httpUrlResponse = httpUrlResponse
        self.data = data
        self.json = JSON(data: data)
    }
}

extension NSError {
    static func parseError() -> NSError {
        return NSError(domain: "com.johan.pytt",
                       code: ApiParseError.code,
                       userInfo: [NSLocalizedDescriptionKey: "A parsing error occured"])
    }
}


