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
    var listPerson: [Person] = [Person(name: "Gabriel", lastName: "Pulga", job: "iOS Developer", image: "person.fill"),
                                Person(name: "Gabriel", lastName: "Cavalcante", job: "Developer", image: "person.circle"),
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
        screen?.tableView.delegate = self // Delegate -> Controlar COMPORTAMENTO
        screen?.tableView.dataSource = self // DataSource -> Forneve DADOS
    }

}

// Comportamente
extension ListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let person = listPerson[indexPath.row]
        print(person.name)
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let favoriteAction = UIContextualAction(style: .normal, title: "Favoritar") { act, view, handler in
            tableView.reloadData()
            handler(true)
            
            
        }
        
        let favoriteAction2 = UIContextualAction(style: .normal, title: "Favoritar") { act, view, handler in
            tableView.reloadData()
            handler(true)
        }
        
        favoriteAction.backgroundColor = .blue
        favoriteAction2.backgroundColor = .red
        
        let action = UISwipeActionsConfiguration(actions: [favoriteAction, favoriteAction2])
        return action
    }
}

// Fornecer os dados
extension ListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listPerson.endIndex
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PersonTableViewCell.identifier, for: indexPath) as? PersonTableViewCell
        cell?.delegate = self
        cell?.setupCell(person: listPerson[indexPath.row])
        return cell ?? UITableViewCell()
    }
    
    
}


extension ListViewController: PersonTableViewCellDelegate {
    func tappedDeletePerson() {
        
    }
    
    
}
