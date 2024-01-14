//
//  AuthRouter.swift
//  HMH_iOS
//
//  Created by Seonwoo Kim on 1/14/24.
//

import Foundation

import Moya

enum AuthRouter {
    case socialLogin(data: SocialLoginRequestDTO)
    case signUp(data: SignUpRequestDTO)
    case tokenRefresh
}

extension AuthRouter: BaseTargetType {
    var headers: Parameters? {
        switch self {
        case .socialLogin:
            return APIConstants.hasSocialTokenHeader
        case .signUp:
            return APIConstants.hasTokenHeader
        case .tokenRefresh:
            return APIConstants.hasRefreshTokenHeader
        }
    }
    
    
    var path: String {
        switch self {
        case .socialLogin:
            return "user/login"
        case .signUp:
            return "user/signup"
        case .tokenRefresh:
            return "user/reissue"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .socialLogin:
            return .post
        case .signUp:
            return .post
        case .tokenRefresh:
            return .post
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .socialLogin(let data):
            return .requestJSONEncodable(data)
        case .signUp(let data):
            return .requestJSONEncodable(data)
        case .tokenRefresh:
            return .requestPlain
        }
    }
}
