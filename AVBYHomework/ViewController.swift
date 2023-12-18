import UIKit

final class ViewController: UIViewController {
    
    
    @IBOutlet private weak var mainScreenTableView: UITableView!
    
    private let cars: [CarInfo] = [
        
        CarInfo(carName: "Ferrari 360",
            carYear: 2000,
            milleage: 73000,
            capacity: 3.6,
            carPriceInRubles: 306176,
            vin: false,
            top: false,
            images: [
            UIImage(named: "Ferrari360(1)") ?? UIImage(),
            UIImage(named: "Ferrari360(2)") ?? UIImage(),
            UIImage(named: "Ferrari360(3)") ?? UIImage(),
            UIImage(named: "Ferrari360(4)") ?? UIImage(),
            UIImage(named: "Ferrari360(5)") ?? UIImage()
            ],
            bodyType: .coupe,
            engineType: .gasoline,
            carColor: "красный",
            transmission: .manual,
                fuelConsumption: 28.0),
        
        CarInfo(carName: "Infiniti FX II",
            carYear: 2008,
            milleage: 285047,
                capacity: 5.0,
            carPriceInRubles: 54370,
            vin: true,
            top: true,
            images: [
            UIImage(named: "InfinitiFX(1)") ?? UIImage(),
            UIImage(named: "InfinitiFX(2)") ?? UIImage(),
            UIImage(named: "InfinitiFX(3)") ?? UIImage(),
            UIImage(named: "InfinitiFX(4)") ?? UIImage(),
            UIImage(named: "InfinitiFX(5)") ?? UIImage()
            ],
            bodyType: .suv,
            engineType: .gasoline,
            carColor: "коричневый",
            transmission: .automatic,
            fuelConsumption: 13.1),
        
        CarInfo(carName: "Hyundai Tiburon GK",
            carYear: 2003,
            milleage: 280000,
            capacity: 2.0,
            carPriceInRubles: 16437,
            vin: true,
            top: false,
            images: [
            UIImage(named: "HyundaiTib(1)") ?? UIImage(),
            UIImage(named: "HyundaiTib(2)") ?? UIImage(),
            UIImage(named: "HyundaiTib(3)") ?? UIImage(),
            UIImage(named: "HyundaiTib(4)") ?? UIImage(),
            UIImage(named: "HyundaiTib(5)") ?? UIImage()
            ],
            bodyType: .coupe,
            engineType: .gasoline,
            carColor: "синий",
            transmission: .manual,
            fuelConsumption: 9.0),
        
        CarInfo(carName: "BMW 2000 C/CS",
            carYear: 1967,
            milleage: 18186,
            capacity: 2.0,
            carPriceInRubles: 177260,
            vin: true,
            top: true,
            images: [
            UIImage(named: "BMW2000(1)") ?? UIImage(),
            UIImage(named: "BMW2000(2)") ?? UIImage(),
            UIImage(named: "BMW2000(3)") ?? UIImage(),
            UIImage(named: "BMW2000(4)") ?? UIImage(),
            UIImage(named: "BMW2000(5)") ?? UIImage()
            ],
            bodyType: .coupe,
            engineType: .gasoline,
            carColor: "серебристый",
            transmission: .automatic,
            fuelConsumption: 10.7),
        
        CarInfo(carName: "Tesla Model X I, 6 мест",
            carYear: 2019,
            milleage: 72000,
            capacity: 3.5,
            carPriceInRubles: 146642,
            vin: true,
            top: true,
            images: [
            UIImage(named: "TeslaX(1)") ?? UIImage(),
            UIImage(named: "TeslaX(2)") ?? UIImage(),
            UIImage(named: "TeslaX(3)") ?? UIImage(),
            UIImage(named: "TeslaX(4)") ?? UIImage(),
            UIImage(named: "TeslaX(5)") ?? UIImage()
            ],
            bodyType: .suv,
            engineType: .electric,
            carColor: "чёрный",
            transmission: .automatic,
            fuelConsumption: 8.1),
        
        CarInfo(carName: "Honda eNP1",
            carYear: 2023,
            milleage: 50,
            capacity: 3.5,
            carPriceInRubles: 90241,
            vin: true,
            top: false,
            images: [
            UIImage(named: "HondaeNP1(1)") ?? UIImage(),
            UIImage(named: "HondaeNP1(2)") ?? UIImage(),
            UIImage(named: "HondaeNP1(3)") ?? UIImage(),
            UIImage(named: "HondaeNP1(4)") ?? UIImage(),
            UIImage(named: "HondaeNP1(5)") ?? UIImage()
            ],
            bodyType: .suv,
            engineType: .electric,
            carColor: "чёрный",
            transmission: .automatic,
            fuelConsumption: 8.1),
        
        CarInfo(carName: "ЛуАЗ 969",
            carYear: 1990,
            milleage: 50000,
            capacity: 1.0,
            carPriceInRubles: 9024,
            vin: false,
            top: false,
            images: [
            UIImage(named: "Luaz(1)") ?? UIImage(),
            UIImage(named: "Luaz(2)") ?? UIImage(),
            UIImage(named: "Luaz(3)") ?? UIImage(),
            UIImage(named: "Luaz(4)") ?? UIImage(),
            UIImage(named: "Luaz(5)") ?? UIImage()
            ],
            bodyType: .suv,
            engineType: .gasoline,
            carColor: "зелёный",
            transmission: .manual,
            fuelConsumption: 7.3),
        
        CarInfo(carName: "Bentley Continental GT III",
            carYear: 2019,
            milleage: 7000,
            capacity: 4.0,
            carPriceInRubles: 821840,
            vin: true,
            top: true,
            images: [
            UIImage(named: "BentleyGT(1)") ?? UIImage(),
            UIImage(named: "BentleyGT(2)") ?? UIImage(),
            UIImage(named: "BentleyGT(3)") ?? UIImage(),
            UIImage(named: "BentleyGT(4)") ?? UIImage(),
            UIImage(named: "BentleyGT(5)") ?? UIImage()
            ],
            bodyType: .coupe,
            engineType: .gasoline,
            carColor: "синий",
            transmission: .robot,
            fuelConsumption: 12.1),
        
        CarInfo(carName: "Audi RS e-tron GT",
            carYear: 2022,
            milleage: 10000,
            capacity: 3.5,
            carPriceInRubles: 344850,
            vin: true,
            top: true,
            images: [
            UIImage(named: "AudiRSe(1)") ?? UIImage(),
            UIImage(named: "AudiRSe(2)") ?? UIImage(),
            UIImage(named: "AudiRSe(3)") ?? UIImage(),
            UIImage(named: "AudiRSe(4)") ?? UIImage(),
            UIImage(named: "AudiRSe(5)") ?? UIImage()
            ],
            bodyType: .sedan,
            engineType: .electric,
            carColor: "чёрный",
            transmission: .automatic,
            fuelConsumption: 8.1),
        
        CarInfo(carName: "Lexus RC I · Рестайлинг",
            carYear: 2019,
            milleage: 52000,
            capacity: 3.5,
            carPriceInRubles: 124082,
            vin: false,
            top: true,
            images: [
            UIImage(named: "Lexus(1)") ?? UIImage(),
            UIImage(named: "Lexus(2)") ?? UIImage(),
            UIImage(named: "Lexus(3)") ?? UIImage(),
            UIImage(named: "Lexus(4)") ?? UIImage(),
            UIImage(named: "Lexus(5)") ?? UIImage()
            ],
            bodyType: .coupe,
            engineType: .gasoline,
            carColor: "чёрный",
            transmission: .automatic,
            fuelConsumption: 9.7),
        
    ]

    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainScreenTableView.dataSource = self
        mainScreenTableView.delegate = self
        mainScreenTableView.separatorStyle = .none
        mainScreenTableView.register(UINib(nibName: "MainScreenTableViewCell", bundle: nil), forCellReuseIdentifier: "MainScreenTableViewCell")
        navigationItem.title = (String(cars.count) + " объявлений")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        400
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = mainScreenTableView.dequeueReusableCell(withIdentifier: "MainScreenTableViewCell", for: indexPath) as? MainScreenTableViewCell {
            let details = cars[indexPath.row]
            cell.setInfoAboutCar(car: details, indexPath: indexPath, photos: details.images)
            cell.delegate = self
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }
}

extension ViewController: MainScreenTableViewCellDelegate {
    func leasingTapped() {
        print("Leasing button tapped")
    }
    
    func payPerMonthTapped() {
        print("Payment per mounth button tapped")
    }
    
    func hideTapped() {
        print("Hide button tapped")
    }
    
    func favoriteTapped() {
        print("Favourite button Tapped")
    }
}
