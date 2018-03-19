//
//  BeersApi.swift
//  PunkApiTest
//
//  Created by Victor Bozelli Alvarez on 19/03/2018.
//  Copyright © 2018 Victor Bozelli Alvarez. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper

final class BeersApi {
    static func fetchBeers(page: Int, completion: @escaping ((String?, [Beer]?) -> Void)) {
        if let networkReachabilityManager = NetworkReachabilityManager(), networkReachabilityManager.isReachable {
            if let url = URL(string: "https://api.punkapi.com/v2/beers?per_page=80&page=\(page)") {
                var request = URLRequest(url: url)
                request.timeoutInterval = 0
                request.setValue("application/gzip", forHTTPHeaderField: "Accept-Encoding")
                Alamofire.request(request).responseArray(completionHandler: { (dataResponse: DataResponse<[Beer]>) in
                    if let response = dataResponse.response, response.statusCode == 200 {
                        completion(nil, dataResponse.result.value)
                    }
                    else {
                        completion("", nil)
                    }
                })
            }
        }
        else {
            completion("Not connected to the Internet", nil)
        }
    }
}
