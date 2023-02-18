//
//  DetailVC.swift
//  StationsMapApp
//
//  Created by Ahmet Utlu on 14.02.2023.
//

import UIKit

final class DetailVC: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var chargingPointsLabel: UILabel!
    
    let viewModel = DetailVM()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer.cornerRadius = 30
        setup()
    }
}

extension DetailVC {
    private func setup() {
        titleLabel.text = viewModel.locationTitle
        addressLabel.text = "Address: \(viewModel.locationAddress ?? "No address")"
        chargingPointsLabel.text = "Number of charging points: \(viewModel.numberOfPoints ?? 0)"
    }
    
    func getInfo(title: String, address: String, points: Int) {
        viewModel.locationTitle = title
        viewModel.locationAddress = address
        viewModel.numberOfPoints = points
    }
}
