//
//  ApiClient.swift
//  Pytt
//
//  Created by Hosk, Johan on 2017-07-28.
//  Copyright © 2017 Wirecard. All rights reserved.
//

import Foundation


protocol ApiRequest {
    var urlRequest: URLRequest { get }
}

protocol ApiClient {
    func execute<T: InitializableWithData>(request: ApiRequest, completionHandler: @escaping (_ result: Result <ApiResponse<T>>) -> Void)
}

protocol URLSessionProtocol {
    func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
}

extension URLSession: URLSessionProtocol {}

class ApiClientImplementation: ApiClient {
    let urlSession: URLSessionProtocol
    
    init(urlSessionConfiguration: URLSessionConfiguration, completionHandlerQueue: OperationQueue) {
        urlSession = URLSession(configuration: urlSessionConfiguration, delegate: nil, delegateQueue: completionHandlerQueue)
    }
    
    //MARK: - ApiClient
    
    func execute<T: InitializableWithData>(request: ApiRequest, completionHandler: @escaping (Result<ApiResponse<T>>) -> Void) {
        let dataTask = urlSession.dataTask(with: request.urlRequest) { (data, response, error) in
            // No response
            guard let httpUrlResponse = response as? HTTPURLResponse else {
                completionHandler(Result.failure(NetworkRequestError(error: error)))
                return
            }
            
            let successRange = 200...299
            if successRange.contains(httpUrlResponse.statusCode) { //Got response
                do {
                    let response = try ApiResponse<T>(data:data, httpUrlResponse: httpUrlResponse)
                    //Could get response
                    completionHandler(Result.success(response))
                } catch {
                    completionHandler(Result.failure(error))
                }
            }else {
                completionHandler(Result.failure(ApiError(data: data, httpUrlResponse: httpUrlResponse)))
            }
        }
        
        
        dataTask.resume()
    }
}
