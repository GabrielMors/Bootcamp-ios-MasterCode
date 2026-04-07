//
//  main.swift
//  CompletionHandler+Generics
//
//  Created by Caio Fabrini on 06/04/26.
//

import Foundation

struct TestService {

  var getInt2: Int {
    return 10
  }

  func getInt(valor: Int) -> Int {
      return 10 + valor
  }

  func getUser(name: String, success: @escaping (String) -> Void, failure: @escaping (String) -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
      success(name)
      failure("Não sei o nome")
    }
  }

  func loadJSON(valor: Int, completion: @escaping (Int) -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
      completion(1000000 + valor)
    }
  }
}

let service = TestService()

//print(service.getInt(valor: 50))
//print(service.getInt2)

// 1 forma
//service.getUser(name: "Caio") { success in
//
//} failure: { error in
//
//}

// 2 forma
//service.loadJSON(valor: 10) { value in
//  print(value)
//}



// =====================================================
// GENERICS NO SWIFT
// =====================================================
//
// O que é?
// -----------------------------------------------------
// Generics (genéricos) servem para criar códigos
// reutilizáveis.
//
// Ou seja:
// em vez de criar uma função para String
// e outra para Int,
// a gente cria uma única função que funciona
// para vários tipos.
//
// =====================================================

// =====================================================
// 1) SEM GENERIC
// =====================================================
//
// Repare que criamos 2 funções APENAS PARA REALIZAR UM PRINT!! Caso a tipagem fosse diferente, eu precisaria criar mais e mais funções para cada TIPAGEM

func showName(name: String) {
  print("Nome: \(name)")
}

func showAge(age: Int) {
  print("Idade: \(age)")
}


//showAge(age: 10)
//showName(name: "Caio")


// =====================================================
// 2) COM GENERIC
// =====================================================
//

// Agora criamos um metodo GENERICO, que aceita qualquer tipagem
// Tudo oque está entre os sinais de <> é uma referencia que aquele nome quando utilizado em um parametro é generico

func showValue<Caio>(value: Caio) {
  print("Valor recebido: \(value)")
}

//showValue(value: "Caioooo")
//showValue(value: 18)
//showValue(value: true)
//showValue(value: 18.5)

// Outro exemplo com return

func receiveAndReturn<T>(value: T) -> T {
  return value
}

let name = receiveAndReturn(value: "Matheus")
let age = receiveAndReturn(value: 22)
let approved = receiveAndReturn(value: true)

print(name)
print(age)
print(approved)

// =====================================================
// VANTAGENS DOS GENERICS
// =====================================================
//
// 1. Evita repetição de código
//    Em vez de criar várias funções parecidas,
//    você cria uma só.
//
// 2. Deixa o código mais reutilizável
//    A mesma função pode servir para vários tipos.
//
// 3. Mantém a segurança de tipos do Swift
//    O Swift continua entendendo o tipo certo
//    de cada valor.
//

class Mercado<T> {
  var tipo: T

  init(tipo: T) {
    self.tipo = tipo
  }
}

// Exemplo de uso:
 let mercadoDeInt = Mercado(tipo: 10)
 let mercadoDeString = Mercado(tipo: "Arroz")
