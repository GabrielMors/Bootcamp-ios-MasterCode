//
//  ViewController.swift
//  ListTableView
//
//  Created by Gabriel Mors Pulga on 26/02/26.
//

import UIKit

// Receita de bolo para TableView
// Assinar os protocols da tableView na VIEWCONTROLLER (delegate e o dataSource)
// Criar a celula do tipo UITableViewCell
// Registre sua celula na tableView!!! (tableView.register(PersonTableViewCell.self, forCellReuseIdentifier: PersonTableViewCell.identifier))
// Configure o numberOfRowsInSection e o cellForRowAt

class ListViewController: UIViewController {
  var screen: ListScreen?
  var listPerson: [Person] = [Person(name: "Caio", lastName: "Pulga", job: "iOS Developer", image: "star.fill"),
                              Person(name: "Lucas", lastName: "Cavalcante", job: "Developer", image: "person.circle"),
                              Person(name: "Gabriel", lastName: "Merenfeld", job: "Programador", image: "star.fill"),
                              Person(name: "Felipe", lastName: "Barreto", job: "React Native Developer", image: "folder.fill"),
                              Person(name: "Renato", lastName: "Vieira", job: "iOS Developer", image: "staroflife.fill"),
  ]


  override func loadView() {
    screen = ListScreen()
    view = screen
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    configProtocols()
  }

  func configProtocols() {
    screen?.configTableViewProtocols(delegate: self, dataSource: self)
  }
}

// Comportamento
extension ListViewController: UITableViewDelegate {

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if indexPath.row == 0 {
      print("Selecionei a primeira celula")
    } else {
      let person = listPerson[indexPath.row - 1]
      print(person.name)
    }
  }

  func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
    let favoriteAction = UIContextualAction(style: .normal, title: "Favoritar") { _, _, handler in

      if indexPath.row == 0 {
        print("Favoritei a primeira celula")
      } else {
        let person = self.listPerson[indexPath.row - 1]
        print("Favoritei " + person.name)
      }
      handler(true)
    }

    let deleteAction = UIContextualAction(style: .normal, title: "Deletar") { _, _, handler in
      if indexPath.row == 0 {
        print("Deletei a primeira celula")
      } else {
        let person = self.listPerson[indexPath.row - 1]
        print("Deletei " + person.name)
      }
      handler(true)
    }

    favoriteAction.backgroundColor = .blue
    deleteAction.backgroundColor = .red

    let action = UISwipeActionsConfiguration(actions: [favoriteAction, deleteAction])
    return action
  }
}

// Fornecer os dados
extension ListViewController: UITableViewDataSource {

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1 + listPerson.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    if indexPath.row == 0 {
      let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.identifier, for: indexPath) as? UserTableViewCell
      cell?.setupCell(user: User(image: UIImage(systemName: "person.circle.fill") ?? UIImage(), name: "Gabriel Mors Pulga"))
      return cell ?? UITableViewCell()
    } else {
      let cell = tableView.dequeueReusableCell(withIdentifier: PersonTableViewCell.identifier, for: indexPath) as? PersonTableViewCell
      cell?.setupCell(person: listPerson[indexPath.row - 1], delegate: self)
      return cell ?? UITableViewCell()
    }
  }
}

extension ListViewController: PersonTableViewCellDelegate {
  func tappedDeletePerson(in cell: PersonTableViewCell) {
    guard let index = screen?.tableView.indexPath(for: cell) else { return } // index -> significa posição da celula!!!!
    listPerson.remove(at: index.row - 1)
    //    screen?.tableView.deleteRows(at: [index], with: .automatic) // ELE VAI RECARREGAR APENAS AS QUE FORAM REMOVIDAS DE FORMA INTELIGENTE E AUTOMATICA, evitando, de precisar recriar todas as demais celulas
    screen?.tableView.reloadData() // O reloadData ele recarrega a TABLEVIEW COMPLETA!!!
  }
}
