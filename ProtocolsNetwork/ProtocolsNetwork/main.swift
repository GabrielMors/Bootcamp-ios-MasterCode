//
//  main.swift
//  ProtocolsNetwork
//
//  Created by Caio Fabrini on 02/04/26.
//

import Foundation

// MARK: Oque é um JSON?

// JSON, que significa JavaScript Object Notation, é um formato leve de intercâmbio de dados. É fácil para os seres humanos lerem e escreverem, e fácil para máquinas analisarem e gerarem. É baseado em um subconjunto da linguagem de programação JavaScript, mas é independente de linguagem, sendo amplamente usado em muitas linguagens de programação, incluindo Swift, para armazenamento e troca de dados.

// Um JSON é construído com dois tipos de estruturas:

// 1 -> Objeto: Um objeto JSON é uma coleção de pares chave/valor, onde a chave deve ser um STRING, e o valor pode ser uma string, número, booleano, uma lista, outro objeto... Objeto JSON são declarados por ABERTURA E FECHAMENTO DE CHAVES { }

// 2 -> Arrays: Um array JSON é uma lista ordenada de valores(string, número, booleano, uma lista, outro objeto...). Arrays são declarados por colchetes [ ]

// OBS: Se caso o back retornar algum valor nulo ele vai vir dessa forma:
// "nome": null
// O null == nil no swift

// Exemplo OBJETO

// {
//  "idade": 22,
//  "professor": true,
//  "nome": "Caio Fabrini",
//  "cursos": ["iOS", "Swift", "SwiftUI"],
//  "endereco": {
//    "cidade": "Nuporanga",
//    "estado": "SP"
//   }
// }

// Modelagem de JSON
struct Funcionario {
  var nome: String
  var idade: Int
  var professor: Bool
  var cursos: [String]
  var endereco: Endereco
}

struct Endereco {
  var cidade: String
  var estado: String
}

// {
//    "pessoa": {
//        "nome": "guilherme",
//        "idade": 17,
//        "sobrenome": "Braganca"
//      }
// }

struct Pessoa {
  var pessoa: PessoaDados
}

struct PessoaDados {
  var nome: String
  var idade: Int
  var sobrenome: String
}

// Exemplo LISTA

// [
//   {
//    "nome": "Caio",
//    "idade": 22
//   },
//   {
//    "nome": "Matheus",
//    "idade": 25
//   },
//   {
//    "nome": "Lucas",
//    "idade": 32
//   }
// ]

struct Aluno {
  var nome: String
  var idade: Int
}

var alunos: [Aluno] = [
  Aluno(nome: "Caio", idade: 22),
  Aluno(nome: "Matheus", idade: 25),
  Aluno(nome: "Lucas", idade: 32),
]

// Exercicios


// 1 - Escreva um JSON que represente uma lista com dois objetos do tipo Pessoa, onde o primeiro tem nome “Ana” e idade 28, e o segundo, nome “Ricardo” e idade 35.

// 2 - Crie um JSON que represente um array de objetos, cada um representando um produto com id, nome e preço. Inclua pelo menos três produtos no array. Por fim, crie um modelo swift desse Json, e alem disso tambem crie um objeto com os valores iguais ao do json.

// 3 - Crie um JSON representando o objeto Veiculo fornecido em Swift

struct Veiculo {
  var id: Int
  var marca: String
  var modelo: String
  var ano: Int
  var acessorios: [Acessorio]
}

struct Acessorio {
  var nome: String
  var preco: Double
  var configuracaoAcessorio: ConfiguracaoAcessorio
}

struct ConfiguracaoAcessorio {
  var tipo: String
  var dataCriacao: String
}

// Objeto com valores
let veiculo = Veiculo(
  id: 101,
  marca: "Toyota",
  modelo: "Corolla",
  ano: 2022,
  acessorios: [
    Acessorio(
      nome: "Teto solar",
      preco: 2500.00,
      configuracaoAcessorio: ConfiguracaoAcessorio(
        tipo: "Luxo",
        dataCriacao: "2021-06-15"
      )
    ),
    Acessorio(
      nome: "Multimídia",
      preco: 1200.00,
      configuracaoAcessorio: ConfiguracaoAcessorio(
        tipo: "Tecnologia",
        dataCriacao: "2021-08-20"
      )
    )
  ]
)

// Correção:

// Desafio 1

// [
//    {
//        "nome": "Ana",
//        "idade": 28
//    },
//    {
//        "nome": "Ricardo",
//        "idade": 35
//    }
// ]

// Desafio 2

// [
//    {
//        "id": "sdsdfvdf5445545",
//        "nome": "Fogão",
//        "preco": 105.45
//    },
//    {
//        "id": "ggg54154545",
//        "nome": "Geladeira",
//        "preco": 1000.00
//    },
//    {
//        "id": "54fertf452tfef5fe",
//        "nome": "Microondas",
//        "preco": 509.30
//    }
// ]

struct Produto {
  var id: String
  var nome: String
  var preco: Double
}

var produtos: [Produto] = [
  Produto(id: "sdsdfvdf5445545", nome: "Fogão", preco: 105.45),
  Produto(id: "ggg54154545", nome: "Geladeira", preco: 1000.00),
  Produto(id: "54fertf452tfef5fe", nome: "Microondas", preco: 509.30)
]

// Desafio 3

// {
//    "id": 101,
//    "marca": "Toyota",
//    "modelo": "Corolla",
//    "ano": 2022,
//    "acessorios": [
//        {
//            "nome": "Teto Solar",
//            "preco": 2500.00,
//            "configuracaoAcessorio": {
//                "tipo": "Luxo",
//                "dataCriacao": "2021-06-15"
//            }
//        },
//        {
//            "nome": "Multimídia",
//            "preco": 1200.00,
//            "configuracaoAcessorio": {
//                "tipo": "Tecnologia",
//                "dataCriacao": "2021-08-20"
//            }
//        }
//    ]
// }

// MARK: - Decodable

// Decodable é um protocolo em Swift que permite que você converta dados no formato JSON em um objeto Swift. Este processo é conhecido como decodificação.

// OBS: Quando tentar realizar o decode(parse) ele vai olhar sempre buscando a chave e a tipagem se ambos são IGUAIS! Caso não sejam iguais, ele cai no catch.
// Tudo oque tem no MODELO SWIFT que não seja opcional, ele se torna algo OBRIGATORIO!! Caso o back não retorne aquele campo, ele vai cair no catch. Caso a variavel seja opcional, ai não tem problema, pois seu valor será nil

struct House: Decodable {
  var address: String
  var numberOfRooms: Int
  var hasGarden: Bool
}

let jsonString = """
{
  "address": "Avenida 4562 bairro jardim europa",
  "numberOfRooms": 23435,
  "hasGarden": false
}
"""

//if let jsonData = jsonString.data(using: .utf8) {
//  do {
//    let house: House = try JSONDecoder().decode(House.self, from: jsonData)
//    print("House Decodificado com sucesso!!!")
//    print(house.address)
//    print(house.numberOfRooms)
//    print(house.hasGarden)
//  } catch {
//    // Ele tenta (try) decodificar, se caso não conseguir, ele cai no caso do catch (falha)
//    print("Error ao decodificar o JSON \(error.localizedDescription)")
//  }
//}

// MARK: - CodingKey

struct Animal: Decodable {
  var species: String
  var age: Int
  var habitatType: String
  var isDangerous: Bool

  enum CodingKeys: String, CodingKey {
    case species
    case age
    case habitatType = "habitat_type"
    case isDangerous = "is_dangerous"
  }
}

let jsonStringAnimal = """
{
 "species" : "Tigre",
 "age": 1,
 "habitat_type": "Floresta",
 "is_dangerous": true
}
"""

//if let jsonDataAnimal = jsonStringAnimal.data(using: .utf8) {
//  do {
//    let animal: Animal = try JSONDecoder().decode(Animal.self, from: jsonDataAnimal)
//    print("Animal Decodificado com sucesso!!!")
//    print(animal.habitatType)
//    print(animal.isDangerous)
//    print(animal.species)
//  } catch {
//    // Ele tenta (try) decodificar, se caso não conseguir, ele cai no caso do catch (falha)
//    print("Error ao decodificar o JSON \(error.localizedDescription)")
//  }
//}

// MARK: Encodable

// Encodable é outro protocolo em Swift. Ele permite que você faça o oposto do que o Decodable faz: você pode converter um objeto Swift em dados no formato JSON. Isso é chamado de codificação.

struct Dog: Encodable {
  var name: String
  var age: Int
  var breed: String
  var isVaccinated: Bool

  enum CodingKeys: String, CodingKey {
    case name
    case age
    case breed
    case isVaccinated = "is_vaccinated"
  }
}

//let dog = Dog(name: "Max", age: 3, breed: "Labrador", isVaccinated: true)
//
//do {
//  let encoder = JSONEncoder()
//  encoder.outputFormatting = .prettyPrinted // facilita a leitura do json
//  let jsonDataDog = try encoder.encode(dog)
//  let jsonStringDog = String(data: jsonDataDog, encoding: .utf8) ?? "Erro ao converter para string"
//  print(jsonStringDog)
//} catch {
//  print("Error ao codificar: \(error.localizedDescription)")
//}


// MARK: - Codable

// O Codable ele é um Typealias que é a junção do Decodable + Encodable
// Pois ele já é ambos ;)

struct Carro: Codable {
  let marca: String
  let modelo: String
  let ano: Int
}

let jsonStringCarro = """
{
 "marca": "Ferrari",
 "modelo": "458 Pista",
 "ano": 2018
}
"""

if let jsonStringCarro = jsonStringCarro.data(using: .utf8) {
  do {
    let carro: Carro = try JSONDecoder().decode(Carro.self, from: jsonStringCarro)
    print("Carro Decodificado com sucesso!!!")
    print(carro.marca)
    print(carro.modelo)
    print(carro.ano)
  } catch {
    // Ele tenta (try) decodificar, se caso não conseguir, ele cai no caso do catch (falha)
    print("Error ao decodificar o JSON \(error.localizedDescription)")
  }
}


let car = Carro(marca: "Ferrari", modelo: "458 Pista", ano: 2018)

do {
  let encoder = JSONEncoder()
  encoder.outputFormatting = .prettyPrinted // facilita a leitura do json
  let jsonDataCar = try encoder.encode(car)
  let jsonCar = String(data: jsonDataCar, encoding: .utf8) ?? "Erro ao converter para string"
  print(jsonCar)
} catch {
  print("Error ao codificar: \(error.localizedDescription)")
}















