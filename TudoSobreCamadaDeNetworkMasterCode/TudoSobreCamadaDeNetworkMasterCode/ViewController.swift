//
//  ViewController.swift
//  TudoSobreCamadaDeNetworkMasterCode
//
//  Created by Caio Fabrini on 08/04/26.
//

import UIKit

// MARK: - O que é uma Requisição?

// Imagina que o seu app precisa buscar dados da internet, como os preços de produtos ou uma lista de filmes. Para fazer isso, o app precisa se comunicar com um servidor, que é como um “local” onde essas informações estão armazenadas. A forma de conseguir essas informações é através de uma requisição.

// Uma requisição é basicamente uma mensagem que seu app envia para um servidor. O servidor, por sua vez, processa essa mensagem e responde com os dados que seu app pediu. É como fazer um pedido de comida online: você faz o pedido, o restaurante (servidor) prepara a comida (dados) e te entrega (resposta).

// TODA REQUISIÇÃO É: ASSÍNCRONA!!!!


// MARK: - O que é uma Camada de Serviço?

// Quando você faz uma requisição diretamente do código de uma view ou controller, o código pode ficar bagunçado e difícil de manter. Para resolver isso, a gente separa a lógica de requisição em uma parte isolada, que chamamos de camada de serviço.

// A camada de serviço tem a responsabilidade de:

//  •  Fazer as requisições ao servidor.
//  •  Processar os dados recebidos.
//  •  Devolver os dados de forma organizada para a camada de UI (a parte visual do app).

//  Imagina a camada de serviço como uma espécie de intermediário: ela cuida da comunicação com o servidor, sem que a tela do app precise se preocupar com isso. Isso deixa o código mais organizado, fácil de entender e de manter.


// MARK: - Por que usar uma camada de Serviço?

//  1.  Organização: Você separa a lógica de rede do resto do código.
//  2.  Reuso: Pode usar a mesma camada de serviço em diferentes partes do app.
//  3.  Manutenção: Facilita a manutenção, pois qualquer alteração nas requisições afeta só a camada de serviço.


// MARK: - Já entendemos oque é uma request, mas o que é uma URL?

// A URL (Uniform Resource Locator) é o endereço que usamos para acessar algo na web. É como o endereço de uma casa, mas na internet. Quando fazemos uma requisição, o app precisa saber onde enviar o pedido, e a URL é esse “onde”.

// Uma URL é composta de várias partes:

// Exemplo: https://app.santander.com/produtos?categoria=eletronicos

//  https: É o protocolo que define como a requisição será feita (pode ser HTTP ou HTTPS, que é a versão segura).
//  •  api.exemplo.com: É o domínio, que indica para qual servidor estamos enviando a requisição.
//  •  /produtos: É o caminho (ou endpoint) dentro do servidor. Esse caminho indica qual recurso queremos acessar (neste caso, produtos).
//  •  ?categoria=eletronicos: São os parâmetros que enviamos junto com a requisição (no caso, estamos filtrando produtos pela categoria “eletrônicos”).

//  Pense que você está no app do Magazine Luiza e você acessa a aba produtos. Nesse aba você vai verificar todos os produtos presentes, contudo, você começa a fazer filtros para mostrar apenas algo que você deseja, como nesse exemplo da url, apenas produtos que são "eletronicos"

// https:app.magazineLuiza.com/produtos -> Lista completa de produtos
// https:app.magazineLuiza.com/produtos?categoria=eletronicos -> Lista completa de produtos ELETRONICOS


// MARK: - O que é a BaseURL?

// Em muitos aplicativos, a maioria das requisições vai para o mesmo servidor, mudando apenas o endpoint. Por exemplo, se o servidor da sua aplicação é https://api.exemplo.com, todas as requisições vão começar por essa mesma URL base. Isso é chamado de baseURL.

// Usar uma baseURL evita repetição e facilita a manutenção do código. Imagine que você está desenvolvendo um app com várias requisições, como:

//  •  https://api.exemplo.com/produtos
//  •  https://api.exemplo.com/usuarios
//  •  https://api.exemplo.com/pedidos

// Todas essas requisições têm o mesmo domínio e protocolo, mas mudam o endpoint. A baseURL seria então https://api.exemplo.com/, e os endpoints variam de acordo com o que o app precisa acessar.

let baseURL = "https://api.exemplo.com/"
let endpoint = "produtos"
let url = URL(string: baseURL + endpoint)

// Aqui, você cria a URL completa juntando a baseURL com o endpoint.


// MARK: - O que é o HTTPMethod?

// O HTTPMethod (ou método HTTP) define a intenção da requisição, ou seja, o que você quer fazer com os dados. Existem vários métodos, mas os mais comuns são:

//  •  GET:    Usado para pedir dados do servidor. Exemplo: “Quero a lista de produtos.” -> Buscar informações
//  •  POST:   Usado para enviar dados ao servidor. Exemplo: “Quero cadastrar um novo produto.” -> Criar item
//  •  PUT:    Usado para atualizar dados existentes. Exemplo: “Quero atualizar as informações de um produto.” -> Atualizar informação
//  •  DELETE: Usado para deletar um dado do servidor. Exemplo: “Quero remover um produto.” -> Remover item
//  •  PATCH: Usado para atualizar parcialmente os dados. Exemplo: "Atualizar uma informação especifica do usuário" -> Atualizar parcialmente

// GET  ->   Pegar
// POST ->   Criar
// PUT  ->   Atualizar
// DELETE -> Deletar/Remover
// PATCH ->  Atualizar parcialmente (muito pouco usado, faz mais sentido já utilizar o PUT)

// Exemplo de uso:
// var request = URLRequest(url: URL(string: "https://api.exemplo.com/produtos")!)
// request.httpMethod = "GET" // Aqui definimos o método HTTP


// MARK: - O que são Headers?

// Os headers (cabeçalhos) são informações adicionais que você envia junto com a requisição. Eles podem ser usados para passar dados de autenticação, indicar o formato dos dados (JSON, XML, etc.), ou outras informações importantes para o servidor.

// Exemplo de headers comuns:

//  •  Authorization: Usado para enviar um token de autenticação. Exemplo: Authorization: Bearer token_aqui
//  •  Content-Type: Informa o tipo de dado que estamos enviando. Exemplo: Content-Type: application/json

// Exemplo de uso:
// var request = URLRequest(url: URL(string: "https://api.exemplo.com/produtos")!)
// request.setValue("application/json", forHTTPHeaderField: "Content-Type")
// request.setValue("Bearer token_aqui", forHTTPHeaderField: "Authorization")
// request.setValue("10.3.2", forHTTPHeaderField: "App-Version")


// MARK: - O que são Parâmetros?

// Existem 3 tipos principais de parâmetros que você pode usar em requisições HTTP:

// 1. Query Parameters
//    • Onde aparece: Na URL, depois do símbolo `?`, separados por `&` para múltiplos parâmetros.
//    • Quando usar: Normalmente usados para filtrar ou modificar o comportamento da resposta, geralmente em requisições GET.

//    Exemplo:
let urlComQueryParameters = "https://api.exemplo.com/produtos?categoria=eletronicos&preco_min=100"
// Neste exemplo, `categoria=eletronicos` e `preco_min=100` são os query parameters usados para filtrar os produtos pela categoria "eletronicos" e pelo preço mínimo de 100.

// 2. Body Parameters
//    • Onde aparece: No corpo da requisição (body), geralmente em formato JSON.
//    • Quando usar: Usados principalmente em requisições POST, PUT ou PATCH para enviar ou modificar dados no servidor.

//    Exemplo:
let urlParaPost = "https://api.exemplo.com/produtos"
let bodyParameters = """
{
    "nome": "iPhone",
    "preco": 10000.0,
    "categoria": "eletronicos"
}
"""
// Neste exemplo, o JSON no corpo da requisição contém os body parameters `nome`, `preco` e `categoria`, usados para criar um novo produto no servidor.


// 3. Path Parameters (ou URL Parameters)
//    • Onde aparece: Diretamente na URL, substituindo parte dela.
//    • Quando usar: Usado para identificar um recurso específico, como um produto ou usuário em particular. Muito comum em requisições GET, PUT, DELETE, etc.

//    Exemplo:
let urlComPathParameters = "https://api.exemplo.com/filmes/123"
// Neste exemplo, `123` é um path parameter que identifica um produto específico com o ID 123.

// Combinação em uma requisição PUT, onde você pode ter um path parameter (para identificar o produto) e body parameters (para atualizar os dados do produto):
let urlParaPut = "https://api.exemplo.com/produtos/123"
let bodyParametersParaPut = """
{
    "preco": 120.0
}
"""
// Aqui, o path parameter `123` identifica o produto que será atualizado, e o body parameter `preco` especifica a nova informação que será atualizada para esse produto.



//MARK: - Tratamento de Respostas (Response)

// Quando o servidor responde à sua requisição, ele envia de volta um status code (código de status) e os dados (se tudo der certo). O status code indica se a requisição foi bem-sucedida ou se houve algum problema.

// Alguns códigos de status comuns:

//  •  200 OK: A requisição foi bem-sucedida.
//  •  201 Created: Um novo recurso foi criado (em uma requisição POST, por exemplo).
//  •  400 Bad Request: O servidor não entendeu a requisição (geralmente um erro nos parâmetros enviados).
//  •  401 Unauthorized: O acesso foi negado (geralmente falta de autenticação).
//  •  404 Not Found: O recurso solicitado não foi encontrado.
//  •  500 Internal Server Error: Um erro ocorreu no servidor.

// Exemplo de uso:
//    if httpResponse.statusCode == 200...299 {
//        print("Sucesso!")
//    } else {
//        print("Erro: \(httpResponse.statusCode)")
//    }

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    postReplace(postReplace: PostReplace(id: 10, title: "Caio", body: "Caio Body", userId: 2))
    deletePost(id: 2)
    fetchAllPosts()
  }

  func fetchAllPosts() {
    PostsService.fetchAllPostsNew { result in
      switch result {
      case .success(let posts):
        print("Sucesso! Temos \(posts.count) posts.")
//        print(posts)
      case .failure(let error):
        print("Erro ao carregar os posts: \(error.errorDescription ?? "")")
      }
    }
  }

  func fetchPostById(id: Int) {
    PostsService.fetchPostById(id: id) { result in
      switch result {
      case .success(let post):
        print("Sucesso!")
        print(post)
      case .failure(let error):
        print("Erro ao carregar os posts: \(error.message)")
      }
    }
  }

  func createPost(title: String, body: String, userId: Int) {
    PostsService.createPost(title: title, body: body, userId: userId) { result in
      switch result {
      case .success:
        print("Sucesso!")
      case .failure(let error):
        print("Erro ao carregar os posts: \(error.message)")
      }
    }
  }

  func postReplace(postReplace: PostReplace) {
    PostsService.replacePostEncodableNew(postReplace: postReplace) { result in
      switch result {
      case .success:
        print("Sucesso!")
      case .failure(let error):
        print("Erro ao carregar os posts: \(error.localizedDescription)")
      }
    }
  }

  func deletePost(id: Int) {
    PostsService.deletePostNew(id: id) { result in
      switch result {
      case .success:
        print("Sucesso!")
      case .failure(let error):
        print("Erro ao carregar os posts: \(error.localizedDescription)")
      }
    }
  }
}

