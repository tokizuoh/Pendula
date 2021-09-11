//
//  DianthusPresenter.swift
//  Pendula
//
//  Created by tokizo on 2021/09/11.
//

import Foundation

enum DianthusError: Error {
    case unknown
}

protocol DianthusPresenterProtocol {
    func fetchWordList(from: String) -> Result<[String], DianthusError>
}

struct DianthusPresenter: DianthusPresenterProtocol {
    func fetchWordList(from: String) -> Result<[String], DianthusError> {
        let session = URLSession.shared
        guard var urlComponents = URLComponents(string: "http://localhost:8080/v1/roman") else {
            return .failure(.unknown)
        }

        urlComponents.queryItems = [
            URLQueryItem(name: "target", value: from)
        ]

        var request = URLRequest(url: urlComponents.url!)
        request.httpMethod = "GET"

        let plistManager = PlistManager(fileName: "basic")
        guard let username = plistManager?.getValue(key: "username"),
              let password = plistManager?.getValue(key: "password") else {
            return .failure(.unknown)
        }

        guard let basicAuthenticationData = "\(username):\(password)".data(using: .utf8) else {
            return .failure(.unknown)
        }

        let basicAuthentication = basicAuthenticationData.base64EncodedString()
        let basicData = "Basic \(basicAuthentication)"

        request.setValue(basicData, forHTTPHeaderField: "Authorization")
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        session.dataTask(with: request) { (_, _, _) in
            // TODO [#86]: 変換する
        }.resume()

        return .success([])
    }
}
