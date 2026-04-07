//
//  ViewController.swift
//  CriandoPrimeiroMockMasterCode
//
//  Created by Caio Fabrini on 06/04/26.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .red
//    loadStudentsData()
    loadJobData()
  }

  func loadStudentsData() {
    LocalFileReader.loadJSON(fileName: "Students", type: StudentList.self) { result in
      switch result {
      case .success(let success):
        debugPrint(success)
      case .failure(let failure):
        print(failure.errorDescription ?? "")
      }
    }
  }

  func loadJobData() {
    LocalFileReader.loadJSON(fileName: "Job", type: Job.self) { result in
      switch result {
      case .success(let success):
        debugPrint(success)
      case .failure(let failure):
        print(failure.errorDescription ?? "")
      }
    }
  }


}

