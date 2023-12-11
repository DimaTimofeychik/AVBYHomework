import UIKit

protocol MainScreenTableViewCellDelegate: AnyObject {
    func hideTapped()
    func favoriteTapped()
    func leasingTapped()
    func payPerMonthTapped()
}

class MainScreenTableViewCell: UITableViewCell {
    
    private var photos = [UIImage]()
    
    //MARK: - Outlets
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var carNameLabel: UILabel!
    @IBOutlet weak var carPriceInRublesLabel: UILabel!
    @IBOutlet weak var carPriceInDollarsLabel: UILabel!
    @IBOutlet weak var carPhotosCollectionView: UICollectionView!
    @IBOutlet weak var carAboutLabel: UILabel!
    @IBOutlet weak var payPerMonthLabel: UIButton!
    
    
    
    //MARK: - Actions
    
    @IBAction func hideButtonTapped(_ sender: Any) {
        delegate?.hideTapped()
    }
    
    @IBAction func favoriteButtonTapped(_ sender: Any) {
        delegate?.favoriteTapped()
    }
    
    @IBAction func leasingButtonTapped(_ sender: Any) {
        delegate?.leasingTapped()
    }
    
    @IBAction func payPerMonthButtonTapped(_ sender: Any) {
        delegate?.payPerMonthTapped()
    }
    
    
    weak var delegate: MainScreenTableViewCellDelegate?
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        carPhotosCollectionView.dataSource = self
        carPhotosCollectionView.delegate = self
        carPhotosCollectionView.register(UINib(nibName: "IconCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "IconCollectionViewCell")
        containerView.layer.cornerRadius = 10
        //carPhotosCollectionView.layer.cornerRadius = 10
    }
    
    func infoAboutCar(car: CarInfo, indexPath: IndexPath, photos: [UIImage]) {
        self.carNameLabel.text = car.carName
        self.carPriceInDollarsLabel.text = "≈ " + String(car.carPriceInDollars) + "$"
        self.carPriceInRublesLabel.text = String(car.carPriceInRubles) + "р."
        self.carAboutLabel.text = descriptionString(car: car)
        self.payPerMonthLabel.setTitle("от " + monthlyPayment(car: car, years: 5) + "$/мес", for: .normal)
        self.photos = photos
        carPhotosCollectionView.reloadData()
    }
    
    private func monthlyPayment(car: CarInfo, years: Int) -> String {
        let fullPrice = car.carPriceInDollars
        let paymentForMonth = fullPrice / years / 12
        return String(paymentForMonth)
    }
    
    private func descriptionString(car: CarInfo) -> String {
        var resultStr = ""
        var engineType = ""
        var bodyType = ""
        var transmissionType = ""
        switch car.engineType {
        case .gasoline:
            engineType = "бензин"
        case .diesel:
            engineType = "дизель"
        case .electric:
            engineType = "электромобиль"
        case .hybrid:
            engineType = "гибрид"
        }
        
        switch car.bodyType {
        case .sedan:
            bodyType = "седан"
        case .suv:
            bodyType = "внедорожник"
        case .coupe:
            bodyType = "купе"
        case .universal:
            bodyType = "универсал"
        }
        
        switch car.transmission {
        case .manual:
            transmissionType = "механика"
        case .automatic:
            transmissionType = "автомат"
        case .robot:
            transmissionType = "робот"
        }
        if car.engineType != .electric {
            resultStr = "\(car.carYear) г., \(transmissionType) ,\(car.capacity) л, \(engineType), \(bodyType), \(car.milleage) км, \(car.carColor), \(car.fuelConsumption) л/100км"
        } else {
            resultStr = "\(car.carYear) г., \(transmissionType) , \(engineType), \(bodyType), \(car.milleage) км, \(car.carColor) "
        }
        return resultStr
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}


extension MainScreenTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let iconCell = carPhotosCollectionView.dequeueReusableCell(withReuseIdentifier: "IconCollectionViewCell", for: indexPath) as? IconCollectionViewCell {
            iconCell.setImage(photos[indexPath.row])
            return iconCell
        }
        return UICollectionViewCell()
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: <#T##Double#>, height: <#T##Double#>)
//    }
}
