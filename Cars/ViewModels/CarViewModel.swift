//
//  CarViewModel.swift
//  Cars
//
//  Created by Sepehr on 6/16/23.
//

import Combine
class CarViewModel: ObservableObject {
    @Published var carList: CarList?
    @Published var page : Int = 1
    @Published var take : Int = 30
    @Published var errorTitle : String = ""
    @Published var isLoading : Bool = false
    private let carRepository: CarRepository
    private var subscriptions : Set<AnyCancellable> = []

    init(carRepository: CarRepository) {
        self.carRepository = carRepository
        fetchCars()
    }
    
    func fetchCars() {
        isLoading = true
        carRepository.fetchCars(page:page, take: take)
            .sink(receiveValue: { [weak self] response in
                guard let self = self else {return}
                if let cars = response.value {
                    self.carList = cars
                } else if let error = response.error {
                    self.errorTitle = error.backendError?.message ?? ""
                    debugPrint("carViewModel-fetchCars has error ==>\(error.localizedDescription)")
                }
                self.isLoading = false
            })
            .store(in: &subscriptions)
    }
}
