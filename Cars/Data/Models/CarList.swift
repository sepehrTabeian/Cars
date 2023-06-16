//
//  CarList.swift
//  Cars
//
//  Created by Sepehr on 6/16/23.
//

public struct CarList: Codable {
    let pagination: Pagination
    let cars: [Car]
}

