//
//  Car.swift
//  Cars
//
//  Created by Sepehr on 6/16/23.
//

public struct Car: Codable {
    let id : String
    let make: String
    let model: String
    let year: Int
    let type: EngineType
    let engine: Engine
}
enum EngineType: String, Codable {
    case electrical = "Electrical"
    case mechanical = "Mechanical"
}
