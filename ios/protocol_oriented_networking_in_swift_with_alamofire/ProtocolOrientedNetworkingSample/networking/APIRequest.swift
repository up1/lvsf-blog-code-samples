//
//  APIRequest.swift
//  DINetworkingSample
//
//  Created by Nicholas Fox on 7/17/16.
//  Copyright © 2016 nickfox. All rights reserved.
//

import Foundation
import Alamofire

protocol Cancelable {
  func cancel()
}

struct APIRequest {

  let request: Cancelable

  /**
   Initializes an APIRequest with the provided Cancelable request

   - parameter request: A request object generated by APIProxy that conforms to the
   Cancelable protocol
   */
  init(request: Cancelable) {
    self.request = request
  }

  /// Cancel the webservice request.
  func cancel() {
    request.cancel()
  }
}

// Request already has cancel method, but it needs to conform to our cancelable protocol.
extension Request: Cancelable {}

struct MockRequest: Cancelable {

  /// Webservice request generated by APIProxy
  let urlRequest: NSURLRequest

  init(router: APIRouter) {
    urlRequest = router.URLRequest
  }

  func cancel() {
    print("Canceled Mock Request")
  }
}
