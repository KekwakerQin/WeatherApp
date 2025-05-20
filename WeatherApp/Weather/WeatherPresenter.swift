import UIKit

class WeatherViewController {
    
    var cityLabel = UILabel()
    var tempLabel = UILabel()
    var descLabel = UILabel()
    
    init(cityLabel: UILabel = UILabel(), tempLabel: UILabel = UILabel(), descLabel: UILabel = UILabel()) {
        self.cityLabel = cityLabel
        self.tempLabel = tempLabel
        self.descLabel = descLabel
    }
    
    func fetchWeather() {
        WeatherService.shared.fetchWeather(for: "Moscow") { [weak self] response in
            DispatchQueue.main.async {
                guard let weather = response else {
                    self?.tempLabel.text = "Ошибка загрузки"
                    return
                }
                self?.cityLabel.text = weather.city
                self?.tempLabel.text = "\(weather.main) C"
                self?.descLabel.text = weather.weather.first?.description   
            }
            
        }
    }
}
