//
//  DianthusModel.swift
//  Pendula
//
//  Created by tokizo on 2021/09/11.
//

import Foundation

protocol DianthusModelProtocol {
    func fetchWordList(from: String) -> Result<[String], DianthusError>
}

final class DianthusModel: DianthusModelProtocol {

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

        let semaphore = DispatchSemaphore(value: 1)

        var wordList: [String]?

        session.dataTask(with: request) { (_, _, error) in
            guard error == nil else {
                semaphore.signal()
                return
            }

            semaphore.signal()
            return
        }.resume()

        semaphore.wait()

        if let wordList = wordList {
            return .success(wordList)
        } else {
            return .failure(.unknown)
        }
    }

}
