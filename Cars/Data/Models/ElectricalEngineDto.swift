//
//  EngineType.swift
//  Cars
//
//  Created by Sepehr on 6/16/23.
//



public struct ElectricalEngineDto: Codable {
    let type: String
    let power: Int
    let torque: Int
    let battery: Battery
}
public  struct Battery: Codable {
    let capacity: Int
    let technology: String
}
