//
//  Pagination.swift
//  Cars
//
//  Created by Sepehr on 6/16/23.
//

import Foundation
struct Pagination: Codable {
    let currentPage: Int
    let perPage: Int
    let totalPages: Int
    let totalCars: Int
    let take : Int
}


