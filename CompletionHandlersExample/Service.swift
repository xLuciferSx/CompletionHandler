//
//  Service.swift
//  CompletionHandlersExample
//
//  Created by Raivis Olehno on 25/06/2020.
//  Copyright © 2020 Alex Nagy. All rights reserved.
//

import UIKit

typealias TestResult = Int

class Service {
    static func grabDataFromDatabase(completion: @escaping (_ result: TestResult?) -> ()) {
        DispatchQueueHelper.delay(bySeconds: 3.0, dispatchLevel: .background) {
            let result = 1
            DispatchQueueHelper.delay(bySeconds: 0.0, completion: {
                completion(result)
            })
        }
    }
}
