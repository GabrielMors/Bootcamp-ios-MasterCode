//
//  ListViewController.swift
//  TableView+CollectionViewMasterCode
//
//  Created by Caio Fabrini on 11/03/26.
//

import UIKit

class ListViewController: UIViewController {
  var screen: ListScreen = ListScreen()
  var viewModel: ListViewModel = ListViewModel()

  override func loadView() {
    view = screen
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    configProtocols()
  }

  func configProtocols() {
    screen.configTableViewProtocols(delegate: self, dataSource: self)
  }
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.numberOfRows2()
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: DetailTableViewCell.identifier) as? DetailTableViewCell
    cell?.setupCell(detail: viewModel.loadCurrentDetail(row: indexPath.row))
    return cell ?? UITableViewCell()
  }
}

