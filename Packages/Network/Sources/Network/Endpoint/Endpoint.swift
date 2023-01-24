import Foundation

public protocol Endpoint {
  func path() -> String
  func queryItems() -> [URLQueryItem]
  var jsonValue: Encodable? { get }
}

public extension Endpoint {
  var jsonValue: Encodable? {
    nil
  }
}

extension Endpoint {
  func makePaginationParam(sinceId: String?, maxId: String?, minId: String?, limit: String = "40") -> [URLQueryItem] {
	var res = [URLQueryItem(name: "limit", value: limit)]
	if let sinceId {
	  res.append(URLQueryItem(name: "since_id", value: sinceId))
	} else if let maxId {
	  res.append(URLQueryItem(name: "max_id", value: maxId))
	} else if let minId {
	  res.append(URLQueryItem(name: "min_id", value: minId))
	}
	return res
  }
}
