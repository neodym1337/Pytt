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

//struct VoidResponse: InitializableWithData {
//    init(data: Data?) throws {
//        
//    }
//}

//extension Array: InitializableWithData {
//    
//    init(data: Data?) throws {
//        guard data != nil else {
//            throw NSError.parseError()
//        }
//        
//    }
//
//    
//    
//    init(data: Data?) throws {
//        guard let data = data,
//            let jsonObject = try? JSONSerialization.jsonObject(with: data),
//            let jsonArray = jsonObject as? [[String: Any]] else {
//                throw NSError.createPraseError()
//        }
//        
//        guard let element = Element.self as? InitializableWithJson.Type else {
//            throw NSError.createPraseError()
//        }
//        
//        //self = try jsonArray.map({ return try element.init(json: $0) as! Element })
//
//        self = try jsonArray.map({ return try element.init(json: $0) as! Element })
//    }
//}

extension NSError {
    static func parseError() -> NSError {
        return NSError(domain: "com.johan.pytt",
                       code: ApiParseError.code,
                       userInfo: [NSLocalizedDescriptionKey: "A parsing error occured"])
    }
}



















