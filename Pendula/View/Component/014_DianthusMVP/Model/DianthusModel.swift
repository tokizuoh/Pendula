//
//  DianthusModel.swift
//  Pendula
//
//  Created by tokizo on 2021/09/11.
//

import Foundation

protocol DianthusModelProtocol {
    func fetchWordList(from: String, completion: @escaping ((Result<[Word], DianthusError>) -> Void))
}

struct Word: Codable, Hashable {
    let raw: String
    let roman: String
    let vowels: String
}

final class DianthusModel: DianthusModelProtocol {
    func fetchWordList(from: String, completion: @escaping (Result<[Word], DianthusError>) -> Void) {
        let session = URLSession.shared
        guard var urlComponents = URLComponents(string: "http://localhost:8080/v1/roman") else {
            completion(.failure(.unknown))
            return
        }

        urlComponents.queryItems = [
            URLQueryItem(name: "target", value: from)
        ]

        var request = URLRequest(url: urlComponents.url!)
        request.httpMethod = "GET"

        let plistManager = PlistManager(fileName: "basic")
        guard let username = plistManager?.getValue(key: "username"),
              let password = plistManager?.getValue(key: "password") else {
            completion(.failure(.unknown))
            return
        }

        guard let basicAuthenticationData = "\(username):\(password)".data(using: .utf8) else {
            completion(.failure(.unknown))
            return
        }

        let basicAuthentication = basicAuthenticationData.base64EncodedString()
        let basicData = "Basic \(basicAuthentication)"

        request.setValue(basicData, forHTTPHeaderField: "Authorization")
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")

        session.dataTask(with: request) { [weak self] (data, _, error) in
            guard error == nil,
                  let self = self else {
                completion(.failure(.unknown))
                return
            }

            guard let wordList = self.decode(data: data) else {
                completion(.failure(.unknown))
                return
            }

            completion(.success(wordList))
            return
        }.resume()
    }

    private func decode(data: Data?) -> [Word]? {
        guard let data = data else {
            return nil
        }

        do {
            let wordList = try JSONDecoder().decode([Word].self, from: data)
            return wordList
        } catch {
            return nil
        }
    }

}
