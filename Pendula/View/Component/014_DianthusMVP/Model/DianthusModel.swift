//
//  DianthusModel.swift
//  Pendula
//
//  Created by tokizo on 2021/09/11.
//

import Foundation

protocol DianthusModelProtocol {
    func fetchWordList(from: String) -> Result<[Word], DianthusError>
}

struct Word: Codable {
    let raw: String
    let roman: String
    let vowels: String
}

final class DianthusModel: DianthusModelProtocol {

    func fetchWordList(from: String) -> Result<[Word], DianthusError> {
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

        var wordList: [Word]?

        session.dataTask(with: request) { [weak self] (data, _, error) in
            guard error == nil,
                  let self = self else {
                semaphore.signal()
                return
            }

            wordList = self.decode(data: data)
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
