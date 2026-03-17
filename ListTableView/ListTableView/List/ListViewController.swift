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
  var viewModel: ListViewModel = ListViewModel()

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
      let person = viewModel.loudCurrentPerson(index: indexPath.row)
      print(person.name)
    }
  }

  func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
    let favoriteAction = UIContextualAction(style: .normal, title: "Favoritar") { _, _, handler in

      if indexPath.row == 0 {
        print("Favoritei a primeira celula")
      } else {
        let person = self.viewModel.loudCurrentPerson(index: indexPath.row)
        print("Favoritei " + person.name)
      }
      handler(true)
    }

    let deleteAction = UIContextualAction(style: .normal, title: "Deletar") { _, _, handler in
      if indexPath.row == 0 {
        print("Deletei a primeira celula")
      } else {
        let person = self.viewModel.loudCurrentPerson(index: indexPath.row)
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
//    return viewModel.getNumberOfRows()
    return viewModel.numberOfRows
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    if indexPath.row == 0 {
      let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.identifier, for: indexPath) as? UserTableViewCell
      cell?.setupCell(user: User(image: UIImage(systemName: "person.circle.fill") ?? UIImage(), name: "Gabriel Mors Pulga"))
      return cell ?? UITableViewCell()
    } else {
      let cell = tableView.dequeueReusableCell(withIdentifier: PersonTableViewCell.identifier, for: indexPath) as? PersonTableViewCell
      cell?.setupCell(person: viewModel.loudCurrentPerson(index: indexPath.row), delegate: self)
      return cell ?? UITableViewCell()
    }
  }
}

extension ListViewController: PersonTableViewCellDelegate {
  func tappedDeletePerson(in cell: PersonTableViewCell) {
    guard let indexPath = screen?.tableView.indexPath(for: cell) else { return } // index -> significa posição da celula!!!!
    viewModel.removeListPerson(index: indexPath.row)
    //    screen?.tableView.deleteRows(at: [index], with: .automatic) // ELE VAI RECARREGAR APENAS AS QUE FORAM REMOVIDAS DE FORMA INTELIGENTE E AUTOMATICA, evitando, de precisar recriar todas as demais celulas
    screen?.tableView.reloadData() // O reloadData ele recarrega a TABLEVIEW COMPLETA!!!
  }
}
