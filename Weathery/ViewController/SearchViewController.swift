//
//  SearchViewController.swift
//  Weathery
//
//  Created by Manuel Lorenzo (@noloman) on 29/06/2021.
//

import UIKit

class SearchViewController: UITableViewController, UISearchBarDelegate {
    var onCitySelected: (CurrentWeatherDataForLocationBase) -> Void
    var networkManager: NetworkManager!
    var tableData = [CurrentWeatherDataForLocationBase]()
    var resultSearchController = UISearchController()
    
    init(onCitySelected: @escaping (CurrentWeatherDataForLocationBase) -> Void) {
        self.onCitySelected = onCitySelected
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkManager = NetworkManager()
        
        tableView = UITableView(frame: self.view.bounds, style: UITableView.Style.plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor.white
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "my")
        
        self.resultSearchController = ({
            let controller  = UISearchController(searchResultsController: nil)
            controller.obscuresBackgroundDuringPresentation = false
            controller.searchBar.delegate = self
            controller.searchBar.sizeToFit()
            self.tableView.tableHeaderView = controller.searchBar
            return controller
        })()
        
        self.tableView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        networkManager.getLocation(name: searchText) { currentWeatherDataForLocation, error in
            if let locationArray = currentWeatherDataForLocation {
                if locationArray.cod == 200 {
                    self.tableData = [locationArray]
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "my", for: indexPath)
        let currentLocationWeatherData = tableData[indexPath.row] as CurrentWeatherDataForLocationBase
        if let cityName = currentLocationWeatherData.name {
            if let countryName = currentLocationWeatherData.sys?.country {
                cell.textLabel?.text = cityName + ", " + countryName
                cell.accessoryType = .detailButton
            }
        }
        return cell
    }
    
//    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
//        let currentLocationWeatherData = tableData[indexPath.row] as CurrentWeatherDataForLocationBase
//        let latitude = currentLocationWeatherData.coord?.lat
//        let longitude = currentLocationWeatherData.coord?.lon
//        if latitude != nil && longitude != nil {
//            let mapViewController = MapViewController(lat: latitude!, long: longitude!)
//            let topViewController = getTopMostViewController()
//            topViewController?.modalPresentationStyle = .formSheet
//            topViewController?.present(mapViewController, animated: true)
//        }
//    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.onCitySelected(self.tableData[indexPath.row] as CurrentWeatherDataForLocationBase)
        self.dismiss(animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
}
