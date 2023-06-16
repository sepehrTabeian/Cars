//
//  CarsRepository.swift
//  Cars
//
//  Created by Sepehr on 6/16/23.
//
import Alamofire
import Combine
import Foundation
protocol CarRepositoryProtocol{
    func fetchCars(page:Int, take  : Int ) -> AnyPublisher<DataResponse<CarList, NetworkError>, Never>
}
class CarRepository {
    private init(){}
    static let inctance : CarRepositoryProtocol = CarRepository()
}
extension CarRepository : CarRepositoryProtocol {
    func fetchCars(page:Int, take  : Int ) -> AnyPublisher<DataResponse<CarList, NetworkError>, Never> {
        
        
        return AF.request("\(baseURL)cars",method: .get,parameters: getCarParams(page: page,take: take), encoding: URLEncoding.queryString,headers: nil)
            .validate()
            .publishDecodable(type: CarList.self)
            .map{
                response in
                response.mapError{
                    error  in
                    let backendError = response.data.flatMap{
                        try? JSONDecoder().decode(BackendError.self, from: $0)
                    }
                    debugPrint("CarRepository Error ==> \(error.localizedDescription)")
                    return NetworkError(initialError: error, backendError: backendError)
                }
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    func getCarParams(page : Int , take : Int ) -> [String : Any]{
        var dic = [String : Any]()
        dic["currentPage"] = page
        dic["take"] = take
        dic["sort"] = "createdAt,DESC"
        return dic
    }
}
