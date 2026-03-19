//
//  ListViewModel.swift
//  TableView+CollectionViewMasterCode
//
//  Created by Caio Fabrini on 19/03/26.
//

class ListViewModel {

  private var list: [Detail] = [
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


  var numberOfRows: Int {
    return list.count
  }

  func numberOfRows2() -> Int {
    return list.count
  }

  func loadCurrentDetail(row: Int) -> Detail {
    return list[row]
  }
}
