//
//  BaseAPI.swift
//  YNAB
//
//  Created by Mohamed Kelany on 29/01/2021.
//

import Foundation
import Alamofire

class APIService<T: TargetType> {
    func fetchData<M: Decodable>(target: T, responseClass: M.Type, completion: @escaping (Result<YNABDataResponse<M>?, ErrorParser>) -> Void) {
        let method = Alamofire.HTTPMethod(rawValue: target.method.rawValue)
        let headers = Alamofire.HTTPHeaders(target.headers ?? [:])
        let params = buildParameters(task: target.task)
        AF.request(target.baseURL + target.path, method: method, parameters: params.0, encoding: params.1, headers: headers).response { (result) in
            guard let statusCode = result.response?.statusCode else {
                //ADD custom Error
                completion(.failure(.runtimeError("Not Valid Status Code")))
                return
            }
            guard let data = result.data else {
                //ADD custom Error
                completion(.failure(.runtimeError("Error in getting JSON")))
                return
            }
            if statusCode == 200 {
                //Successful request
                guard let responseObj = try? JSONDecoder().decode(YNABDataResponse<M>.self, from: data) else {
                    //ADD custom Error
                    completion(.failure(.runtimeError("Error in decoding JSON")))
                    return
                }
                completion(.success(responseObj))
            } else {
                //ADD custom error base on status code 404, 400 and default error
                if let responseObj = try? JSONDecoder().decode(YNABErrorResponse.self, from: data) {
                    //ADD custom Error
                    completion(.failure(ErrorParser.defaultError(error: responseObj.error)))
                    return
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
