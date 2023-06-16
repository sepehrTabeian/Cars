//
//  Engine.swift
//  Cars
//
//  Created by Sepehr on 6/16/23.
//

public struct Engine: Codable {
    let electricalEngine: ElectricalEngineDto?
    let mechanicalEngine: MechanicalEngineDto?
   public init(electricalEngine: ElectricalEngineDto?, mechanicalEngine: MechanicalEngineDto?) {
        self.electricalEngine = electricalEngine
        self.mechanicalEngine = mechanicalEngine
    }
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        if let electricalEngine = try? container.decode(ElectricalEngineDto.self) {
            self.electricalEngine = electricalEngine
            self.mechanicalEngine = nil
        } else if let mechanicalEngine = try? container.decode(MechanicalEngineDto.self) {
            self.electricalEngine = nil
            self.mechanicalEngine = mechanicalEngine
        } else {
            throw DecodingError.typeMismatch(Engine.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Invalid engine type"))
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        if let electricalEngine = electricalEngine {
            try container.encode(electricalEngine)
        } else if let mechanicalEngine = mechanicalEngine {
            try container.encode(mechanicalEngine)
        } else {
            throw EncodingError.invalidValue(
                self,
                EncodingError.Context(
                    codingPath: encoder.codingPath,
                    debugDescription: "Invalid engine value"
                )
            )
        }
    }
    
    
}
