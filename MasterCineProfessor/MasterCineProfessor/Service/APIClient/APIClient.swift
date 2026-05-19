//
//  APIClient.swift
//  TudoSobreCamadaDeNetworkMasterCode
//
//  Created by Caio Fabrini on 13/04/26.
//

// Criando camada de serviço global
// Tratar baseURL -> para que eu não fique repetindo ela
// Tratar parâmetro -> 2 formas -> Dicionário / Objeto Encodable
// Tratar HTTPMethod -> GET, POST, PUT, DELETE, PATCH
// Tratar o Header
// Criar um Request genérico para ter tudo que foi listado a cima
// Criar um APIClient -> Camada responsável pela requisição / tratar data / realizar a conversão de binário para objeto swift / tratar status code
// Criar classe responsável por todo Logger da requisição
// Criar classe responsável por toda parte lógica de error
// Criar camada responsável por realizar leitura de JSON local -> Famoso MOCK

import Foundation

class NewAPIClient {
    static var client = APIClient(requestBuilder: NewDefaultRequest())
}

//Exite para que seja possivel injetar instancia para teste
protocol APIClientProtocol {
    func request<T: Decodable>(request: APIRequest, decodeType: T.Type,completion: @escaping (Result<T, NetworkError>) -> Void)
}

class APIClient: APIClientProtocol {
    
    static let shared = APIClient()
    
    private var session: URLSession
    private var baseURL: String
    private var requestBuilder: GlobalRequest
    private var timeout: TimeInterval
    
    init(session: URLSession = URLSession.shared,
         baseURL: String? = nil,
         requestBuilder: GlobalRequest = DefaultRequest(),
         timeout: TimeInterval = 6) {
        self.session = session
        self.requestBuilder = requestBuilder
        self.timeout = timeout
        
        if let baseURL {
            self.baseURL = baseURL
        } else {
            let baseUrl = GetInfo.info(key: .baseURL) as? String
            self.baseURL = baseUrl ?? ""
        }
    }
    
    //GCD Request com response
    func request<T: Decodable>(request: APIRequest, decodeType: T.Type,completion: @escaping (Result<T, NetworkError>) -> Void) {
        execute(request: request) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    guard let data = data else {
                        completion(.failure(.noData))
                        return
                    }
                    
                    do {
                        let decodedData = try JSONDecoder().decode(T.self, from: data)
                        completion(.success(decodedData))
                    } catch {
                        NetworkLogger.logDecodingError(error: error, type: T.self)
                        completion(.failure(.decodingError(error)))
                    }
                case .failure(let failure):
                    completion(.failure(failure))
                }
            }
        }
    }
    
    //GCD Request sem response
    func request(request: APIRequest, completion: @escaping (Result<Void, NetworkError>) -> Void) {
        execute(request: request) { result in
            DispatchQueue.main.async {
                switch result {
                case .success:
                    completion(.success(()))
                case .failure(let failure):
                    completion(.failure(failure))
                }
            }
        }
    }
    
    //execute com GCD
    private func execute(request: APIRequest, completion: @escaping (Result<Data?, NetworkError>) -> Void) {
        guard let requestCompleted = requestBuilder.request(apiRequest: request, baseURL: baseURL, timeout: timeout) else {
            completion(.failure(.invalidRequest))
            return
        }
        
        let task = session.dataTask(with: requestCompleted) { data, response, error in
            NetworkLogger.log(request: requestCompleted,
                              response: response,
                              data: data,
                              error: error)
            
            if let error {
                completion(.failure(.networkFailure(error)))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard (200..<300).contains(httpResponse.statusCode) else {
                completion(.failure(.statusCode(code: httpResponse.statusCode)))
                return
            }
            
            completion(.success(data))
        }
        task.resume()
    }
    
    //Async await Request com response
    //async throws -> metodo que pode lancar uma excessão
    func request<T: Decodable>(request: APIRequest, decodeType: T.Type) async throws -> T {
        let data = try await execute(request: request)
        guard let data else {
            throw NetworkError.noData
        }
        
        do {
            return try JSONDecoder().decode(T.self,  from: data)
        } catch {
            NetworkLogger.logDecodingError(error: error, type: T.self)
            throw NetworkError.decodingError(error)
        }
    }
    
    //Async await Request sem response
    //async throws -> metodo que pode lancar uma excessão
    func request(request: APIRequest) async throws {
        _ = try await execute(request: request)
    }
    
    //execute com async await
    //async throws -> metodo que pode lancar uma excessão
    func execute(request: APIRequest) async throws -> Data? {
        guard let requestCompleted = requestBuilder.request(apiRequest: request,
                                                            baseURL: baseURL,
                                                            timeout: timeout) else {
            throw NetworkError.invalidRequest
        }
        
        do {
            //sempre que o try for para a execussão do processo "demorado" obrigatoriamente se usa o await
            let (data, response) = try await session.data(for: requestCompleted)
            
            NetworkLogger.log(request: requestCompleted,
                              response: response,
                              data: data,
                              error: nil)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                //throw -> lancamento de uma excessao/erro
                throw NetworkError.invalidResponse
            }
            
            guard (200..<300).contains(httpResponse.statusCode) else {
                throw NetworkError.statusCode(code: httpResponse.statusCode)
            }
            
            return data
        } catch let error as NetworkError {
            throw NetworkError.networkFailure(error)
        }
    }
}
