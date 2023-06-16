//
//  NetworkError.swift
//  Cars
//
//  Created by Sepehr on 6/16/23.
//

import Alamofire
struct NetworkError: Error {
    let initialError: AFError
    let backendError: BackendError?

}
struct BackendError: Codable, Error {
    var message: String
    var statusCode : Int
    
}
