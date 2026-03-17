//
//  ListViewModel.swift
//  ListTableView
//
//  Created by Caio Fabrini on 16/03/26.
//

import Foundation

// Ponto muito importante sobre a VM, o objeto deve ser private!!!!

// Receita de bola -> MVC para MVVM

// 1- Criar a VM (ViewModel)
// 2- Remover todos os objetos da ViewController e trazer para a VM EX: var listPerson: [Person] = []
// 3 - Apos isso, vai apresentar varios problemas...é só recortar e colar na VM e criar um metodo/variavel computada para resolver o problema

// MVVM
// Model -> Dados
// View -> conhecida por ser uma camada "burra"-> Pq burra? Pois ela não tem nenhuma logica -> TUDO, ela SOLICITA para a ViewModel
// ViewModel -> responsável por toda a parte LOGICA, com isso, ela deve armazenar todos os objetos



class ListViewModel {

  private var listPerson: [Person] = [Person(name: "Caio", lastName: "Pulga", job: "iOS Developer", image: "star.fill"),
                              Person(name: "Lucas", lastName: "Cavalcante", job: "Developer", image: "person.circle"),
                              Person(name: "Gabriel", lastName: "Merenfeld", job: "Programador", image: "star.fill"),
                              Person(name: "Felipe", lastName: "Barreto", job: "React Native Developer", image: "folder.fill"),
                              Person(name: "Renato", lastName: "Vieira", job: "iOS Developer", image: "staroflife.fill"),
  ]

  func getNumberOfRows() -> Int {
    return 1 + listPerson.count
  }

  // Variável computada

  var numberOfRows: Int {
    return 1 + listPerson.count
  }

  func removeListPerson(index: Int) {
    listPerson.remove(at: index - 1)
  }

  func loudCurrentPerson(index: Int) -> Person {
    return listPerson[index - 1]
  }
}
