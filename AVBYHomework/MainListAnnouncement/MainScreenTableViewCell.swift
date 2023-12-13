import UIKit

protocol MainScreenTableViewCellDelegate: AnyObject {
    func hideTapped()
    func favoriteTapped()
    func leasingTapped()
    func payPerMonthTapped()
}

final class MainScreenTableViewCell: UITableViewCell {
    
    private var photos = [UIImage]()
    
    //MARK: - Outlets
    
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var carNameLabel: UILabel!
    @IBOutlet private weak var carPriceInRublesLabel: UILabel!
    @IBOutlet private weak var carPriceInDollarsLabel: UILabel!
    @IBOutlet private weak var carPhotosCollectionView: UICollectionView!
    @IBOutlet private weak var infoAboutCarLabel: UILabel!
    @IBOutlet private weak var payPerMonthLabel: UIButton!
    @IBOutlet private weak var hideButton: UIButton!
    @IBOutlet private weak var firstPositionView: UIImageView!
    @IBOutlet private weak var secondPositionView: UIImageView!
    @IBOutlet private weak var vinAndTopStackView: UIStackView!
    
    //MARK: - Actions
    
    @IBAction private func hideButtonTapped(_ sender: Any) {
        delegate?.hideTapped()
    }
    
    @IBAction private func favoriteButtonTapped(_ sender: Any) {
        delegate?.favoriteTapped()
    }
    
    @IBAction private func leasingButtonTapped(_ sender: Any) {
        delegate?.leasingTapped()
    }
    
    @IBAction private func payPerMonthButtonTapped(_ sender: Any) {
        delegate?.payPerMonthTapped()
    }
    
    weak var delegate: MainScreenTableViewCellDelegate?
    
    //MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        carPhotosCollectionView.dataSource = self
        carPhotosCollectionView.delegate = self
        carPhotosCollectionView.register(UINib(nibName: "IconCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "IconCollectionViewCell")
        containerView.layer.cornerRadius = 10
        firstPositionView.layer.cornerRadius = 4
        secondPositionView.layer.cornerRadius = 4
        carPhotosCollectionView.layer.cornerRadius = 10
        carPhotosCollectionView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
    }
    
        func setInfoAboutCar(car: CarInfo, indexPath: IndexPath, photos: [UIImage]) {
        carNameLabel.text = car.carName
        carPriceInDollarsLabel.text = " ≈ " + String(car.carPriceInDollars) + "$"
        carPriceInRublesLabel.text = String(car.carPriceInRubles) + "р."
        infoAboutCarLabel.text = descriptionString(car: car)
        payPerMonthLabel.setTitle("от " + monthlyPayment(car: car, years: 7) + "$/мес", for: .normal)
        self.photos = photos
        
        if  car.top == true && car.vin == true {
            firstPositionView.image = UIImage(named: "top")
            secondPositionView.image = UIImage(named: "vin")
            hideButton.isHidden = true
        } else if car.top == true && car.vin == false {
            firstPositionView.image = UIImage(named: "top")
            hideButton.isHidden = true
        } else if car.top == false && car.vin == true {
            firstPositionView.image = UIImage(named: "vin")
        } else if car.top == false && car.vin == false {
            vinAndTopStackView.isHidden = true
        }
        
        carPhotosCollectionView.reloadData()
    }
    
    override func prepareForReuse() {
            super.prepareForReuse()
        self.firstPositionView.image = nil
        self.secondPositionView.image = nil
        self.hideButton.isHidden = false
        self.vinAndTopStackView.isHidden = false
        }
    
    private func monthlyPayment(car: CarInfo, years: Int) -> String {
        let fullPrice = car.carPriceInDollars
        let paymentForMonth = fullPrice / years / 12
        return String(paymentForMonth)
    }
}
    
    private func descriptionString(car: CarInfo) -> String {
        var carDescription = ""
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
            carDescription = "\(car.carYear) г., \(transmissionType) ,\(car.capacity) л, \(engineType), \(bodyType), \(car.milleage) км, \(car.carColor), \(car.fuelConsumption) л/100км"
        } else {
            carDescription = "\(car.carYear) г., \(transmissionType) , \(engineType), \(bodyType), \(car.milleage) км, \(car.carColor) "
        }
        return carDescription
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
}
