//
//  ListViewController.swift
//  TableView+CollectionViewMasterCode
//
//  Created by Caio Fabrini on 11/03/26.
//

import UIKit

class ListViewController: UIViewController {
  var screen: ListScreen = ListScreen()
  var list: [Detail] = [
    Detail(title: "Carros", list: [
      Item(title: "Sedan", imageName: "car.fill"),
      Item(title: "SUV", imageName: "car.2.fill"),
      Item(title: "Conversível", imageName: "car.top.door.open"),
      Item(title: "Elétrico", imageName: "ev.charger"),
      Item(title: "Esportivo", imageName: "flag.checkered")
    ]),
    Detail(title: "Motos", list: [
      Item(title: "Street", imageName: "motorcycle"),
      Item(title: "Trail", imageName: "helm"),
      Item(title: "Scooter", imageName: "scooter"),
      Item(title: "Custom", imageName: "wrench.and.screwdriver"),
      Item(title: "Elétrica", imageName: "bolt.fill")
    ]),
    Detail(title: "Caminhões", list: [
      Item(title: "Baú", imageName: "box.truck"),
      Item(title: "Carreta", imageName: "truck.box"),
      Item(title: "Guincho", imageName: "car.rear.and.collision.and.car"),
      Item(title: "Betoneira", imageName: "hammer"),
      Item(title: "Tanque", imageName: "fuelpump" )
    ]),
    Detail(title: "Bicicletas", list: [
      Item(title: "Urbana", imageName: "bicycle"),
      Item(title: "Mountain Bike", imageName: "figure.mountain"),
      Item(title: "Speed", imageName: "speedometer"),
      Item(title: "Dobrável", imageName: "square.split.2x2"),
      Item(title: "Elétrica", imageName: "bolt.circle.fill")
    ]),
    Detail(title: "Ônibus", list: [
      Item(title: "Urbano", imageName: "bus"),
      Item(title: "Intermunicipal", imageName: "road.lanes"),
      Item(title: "Leito", imageName: "bed.double"),
      Item(title: "Escolar", imageName: "backpack"),
      Item(title: "Turismo", imageName: "camera" )
    ])
  ]

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
    return list.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: DetailTableViewCell.identifier) as? DetailTableViewCell
    cell?.setupCell(detail: list[indexPath.row])
    return cell ?? UITableViewCell()
  }
}

