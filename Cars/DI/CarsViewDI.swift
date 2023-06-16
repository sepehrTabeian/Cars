//
//  CarsViewDI.swift
//  Cars
//
//  Created by Sepehr on 6/16/23.
//

import Foundation
struct CarsDI {
    var view : CarsView {
        CarsView(viewModel: carViewModel)
    }
    private var carViewModel : CarViewModel {
        CarViewModel(carRepository: carRepository)
    }
    private var carRepository : CarRepository {
        return CarRepository.inctance as! CarRepository
    }
}
