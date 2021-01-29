//
//  BaseAPI.swift
//  YNAB
//
//  Created by Mohamed Kelany on 29/01/2021.
//

import Foundation
import Alamofire

class APIService<T: TargetType> {
    func fetchData<M: Decodable>(target: T, responseClass: M.Type, completion: @escaping (Result<YNABResponse<M>?, YNABError>) -> Void) {
        let method = Alamofire.HTTPMethod(rawValue: target.method.rawValue)
        let headers = Alamofire.HTTPHeaders(target.headers ?? [:])
        let params = buildParameters(task: target.task)
        AF.request(target.baseURL + target.path, method: method, parameters: params.0, encoding: params.1, headers: headers).responseJSON { (response) in
            guard let statusCode = response.response?.statusCode else {
                //ADD custom Error
                completion(.failure(.runtimeError("Not Valid Status Code")))
                return
            }
            if statusCode == 200 {
                //Successful request
                guard let jsonResponse = try? response.result.get() else {
                    //ADD custom Error
                    completion(.failure(.runtimeError("Error in getting JSON")))
                    return
                }
                guard let jsonData = try? JSONSerialization.data(withJSONObject: jsonResponse, options: []) else {
                    //ADD custom Error
                    completion(.failure(.runtimeError("Error in serializing JSON")))
                    return
                }
                guard let responseObj = try? JSONDecoder().decode(YNABResponse<M>.self, from: jsonData) else {
                    //ADD custom Error
                    completion(.failure(.runtimeError("Error in decoding JSON")))
                    return
                }
                completion(.success(responseObj))
            } else {
                //ADD custom error base on status code 404, 400 and default error
                switch statusCode {
                case 404:
                    completion(.failure(.failedConnection(message: .budget)))
                case 400:
                    completion(.failure(.underStoodRequest))
                default:
                    completion(.failure(.defaultError))
                }
            }
        }
    }

    private func buildParameters(task: Task) -> ([String: Any], ParameterEncoding) {
        switch task {
        case .requestPlain:
            return([:], URLEncoding.default)
        case .requestParameters(let parameters, let encoding):
            return(parameters, encoding)
        }
    }
}
