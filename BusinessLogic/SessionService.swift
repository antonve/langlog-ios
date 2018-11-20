import Moya

//swiftlint:disable line_length

enum SessionService {
    case register(email: String, password: String, displayName: String)
    case login(email: String, password: String, deviceID: String)
}

extension SessionService: TargetType {
    // @TODO: refactor this to be build-based
    var baseURL: URL { return URL(string: "http://localhost:7000/api")! }

    var path: String {
        switch self {
        case .register:
            return "/register"
        case .login:
            return "/login"
        }
    }

    var method: Method {
        switch self {
        case .register, .login:
            return .post
        }
    }

    var sampleData: Data {
        switch self {
        case .register:
            return """
                    {
                      "refresh_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjozLCJkZXZpY2VfaWQiOiI2ZGI0MzVmMzUyZDdlYTRhNjc4MDdhM2ZlYjQ0N2JmNyIsImV4cCI6MTU3NDI2MDkxMn0.BNjA0PJ7MrBRTGsx49v2zIZn_S_lgf-ymsO9SOL6OqQ",
                      "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjozLCJlbWFpbCI6ImxvZ2luX3Rlc3RAZXhhbXBsZS5jb20iLCJkaXNwbGF5X25hbWUiOiJsb2dnZXJfdXNlciIsInBhc3N3b3JkIjoiIiwicm9sZSI6IkFETUlOIiwicHJlZmVyZW5jZXMiOnsibGFuZ3VhZ2VzIjpudWxsLCJwdWJsaWNfcHJvZmlsZSI6ZmFsc2V9fSwicmVmcmVzaF90b2tlbl9pZCI6MSwiZXhwIjoxNTQyNzI4NTEyfQ.wafomvGSnHK3WdXAX75nbGU5d2LtIYQCr8Zk2NzO22k",
                      "user": {
                        "id": 3,
                        "email": "login_test@example.com",
                        "display_name": "logger_user",
                        "password": "",
                        "role": "ADMIN",
                        "preferences": {
                          "languages": null,
                          "public_profile": false
                        }
                      }
                    }
                    """.utf8Encoded
        case .login:
            // @TODO: fill this
            return "".utf8Encoded
        }
    }

    var task: Task {
        switch self {
        case let .register( email, password, displayName):
            return .requestParameters(
                parameters: ["email": email, "password": password, "display_name": displayName],
                encoding: JSONEncoding.default
            )
        case let .login(email, password, deviceID):
            return .requestParameters(
                parameters: ["email": email, "password": password, "device_id": deviceID],
                encoding: JSONEncoding.default
            )
        }
    }

    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
}

// @TODO: move these
private extension String {
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }

    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}
