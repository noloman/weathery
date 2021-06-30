//
//  WeatherViewController.swift
//  Weathery
//
//  Created by Manuel Lorenzo (@noloman) on 28/06/2021.
//

import UIKit

class WeatherViewController: UIViewController {
    let backgroundView = UIImageView()
    let locationButton = UIButton()
    let searchButton = UIButton()
    let searchTextField = UITextField()
    let searchStackView = UIStackView()
    let rootStackView = UIStackView()
    let conditionImageView = UIImageView()
    let temperatureLabel = UILabel()
    let cityLabel = UILabel()
    var location: CurrentWeatherDataForLocationBase?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
    }
}

extension WeatherViewController: UITextFieldDelegate {
    private func style() {
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.image = UIImage(named: "day-background")
        backgroundView.contentMode = .scaleAspectFill
        
        locationButton.translatesAutoresizingMaskIntoConstraints = false
        locationButton.setBackgroundImage(UIImage(systemName: "location.circle.fill"), for: .normal)
        locationButton.tintColor = .label
        
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        searchButton.setBackgroundImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        searchButton.tintColor = .label
        
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        searchTextField.font = UIFont.preferredFont(forTextStyle: .title1)
        searchTextField.placeholder = "Search"
        searchTextField.textAlignment = .center
        searchTextField.borderStyle = .roundedRect
        searchTextField.backgroundColor = .systemFill
        searchTextField.delegate = self
        
        rootStackView.translatesAutoresizingMaskIntoConstraints = false
        rootStackView.axis = .vertical
        rootStackView.alignment = .trailing
        rootStackView.spacing = 10
        
        searchStackView.translatesAutoresizingMaskIntoConstraints = false
        searchStackView.spacing = 8
        searchStackView.axis = .horizontal
        
        conditionImageView.translatesAutoresizingMaskIntoConstraints = false
        conditionImageView.image = UIImage(systemName: "sun.max")
        conditionImageView.tintColor = .label
        
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        temperatureLabel.attributedText = makeTemperatureText(with: "21")
        
        cityLabel.text = "Amsterdam"
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        cityLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
    }
    
    private func makeTemperatureText(with temperature: String) -> NSAttributedString {
        var boldTextAttributes = [NSAttributedString.Key: AnyObject]()
        boldTextAttributes[.foregroundColor] = UIColor.label
        boldTextAttributes[.font] = UIFont.boldSystemFont(ofSize: 100)
        
        var plainTextAttributes = [NSAttributedString.Key: AnyObject]()
        plainTextAttributes[.font] = UIFont.systemFont(ofSize: 80)
        
        let text = NSMutableAttributedString(string: temperature, attributes: boldTextAttributes)
        text.append(NSMutableAttributedString(string: "C", attributes: plainTextAttributes))
        
        return text
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        let vc = SearchViewController(onCitySelected: { [weak self] location in
            self?.cityLabel.text = location.name
            if let temperature = location.main?.temp {
                self?.temperatureLabel.attributedText = self?.makeTemperatureText(with: String(temperature))
            }
        })
        self.present(vc, animated: true, completion: nil)
        return false
    }
    
    private func layout() {
        view.addSubview(backgroundView)
        view.addSubview(locationButton)
        view.addSubview(searchButton)
        view.addSubview(searchTextField)
        view.addSubview(searchStackView)
        view.addSubview(rootStackView)
        
        searchStackView.addArrangedSubview(locationButton)
        searchStackView.addArrangedSubview(searchTextField)
        searchStackView.addArrangedSubview(searchButton)
        
        rootStackView.addArrangedSubview(searchStackView)
        rootStackView.addArrangedSubview(conditionImageView)
        rootStackView.addArrangedSubview(cityLabel)
        rootStackView.addArrangedSubview(temperatureLabel)
        
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leftAnchor.constraint(equalTo: view.leftAnchor),
            backgroundView.rightAnchor.constraint(equalTo: view.rightAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            rootStackView.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 1),
            rootStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: rootStackView.trailingAnchor, multiplier: 1),
            
            searchStackView.widthAnchor.constraint(equalTo: rootStackView.widthAnchor),
            
            locationButton.widthAnchor.constraint(equalToConstant: 40),
            locationButton.heightAnchor.constraint(equalToConstant: 40),
            
            searchButton.widthAnchor.constraint(equalToConstant: 40),
            searchButton.heightAnchor.constraint(equalToConstant: 40),
            
            conditionImageView.heightAnchor.constraint(equalToConstant: 120),
            conditionImageView.widthAnchor.constraint(equalToConstant: 120),
        ])
    }
}
