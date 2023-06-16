//
//  CarsItemView.swift
//  Cars
//
//  Created by Sepehr on 6/16/23.
//

import SwiftUI

struct CarsItemView: View {
    let car: Car
    
    var body: some View {
        CardView {
            VStack(alignment: .leading, spacing: 8) {
                Text("\(car.make) \(car.model)")
                    .font(.headline)
                
                Text("Year: \(car.year.description)")
                
                if let electricalEngine = car.engine.electricalEngine {
                    
                    electricalEngineView(electricalEngine: electricalEngine)
                } else if let mechanicalEngine = car.engine.mechanicalEngine {
                    
                    electricalEngineView(mechanicalEngine: mechanicalEngine)
                }
            }
            .padding()
        
        }
        .cornerRadius(10)
        .shadow(radius: 4)
    }
}
extension CarsItemView {
    func electricalEngineView(mechanicalEngine : MechanicalEngineDto) -> some View {
        VStack(alignment: .leading,spacing: Constants.padding8) {
            Text("Engine Type: \(mechanicalEngine.type)")
            Text("Cylinders: \(mechanicalEngine.cylinders)")
            Text("Fuel Type: \(mechanicalEngine.fuelType)")
            Text("Displacement: \(mechanicalEngine.displacement.description) L")
        }
    }
    func electricalEngineView(electricalEngine : ElectricalEngineDto) -> some View {
        VStack(alignment: .leading,spacing: Constants.padding8){
            Text("Engine Type: \(electricalEngine.type)")
            Text("Power: \(electricalEngine.power) kW")
            Text("Torque: \(electricalEngine.torque) Nm")
            Text("Battery Capacity: \(electricalEngine.battery.capacity) kWh")
            Text("Battery Technology: \(electricalEngine.battery.technology)")
        }
    }
}


