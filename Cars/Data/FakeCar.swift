//
//  FakeCar.swift
//  Cars
//
//  Created by Sepehr on 6/16/23.
//

import Foundation
class FakeCar {
    
    
   static let cars = [car1,car2,car3]
}
    let car1 = Car(
        id: "1",
        make: "Toyota",
        model: "Camry",
        year: 2022,
        type: .mechanical,
        engine: Engine(
            electricalEngine: nil,
            mechanicalEngine: MechanicalEngineDto(
                type: "Mechanical",
                cylinders: 4,
                fuelType: "Gasoline",
                displacement: 2.5
            )
        )
    )

    let car2 = Car(
        id: "2",
        make: "Honda",
        model: "Accord",
        year: 2022,
        type: .mechanical,
        engine: Engine(
            electricalEngine: nil,
            mechanicalEngine: MechanicalEngineDto(
                type: "Mechanical",
                cylinders: 4,
                fuelType: "Gasoline",
                displacement: 2.0
            )
        )
    )

    let car3 = Car(
        id: "3",
        make: "Tesla",
        model: "Model 3",
        year: 2022,
        type: .electrical,
        engine: Engine(
            electricalEngine: ElectricalEngineDto(
                type: "Electrical",
                power: 283,
                torque: 375,
                battery: Battery(
                    capacity: 75,
                    technology: "Lithium-ion"
                )
            ),
            mechanicalEngine: nil
        )
    )

 

   

