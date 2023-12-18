import UIKit

struct CarInfo {
    let carName: String
    let carYear: Int
    let milleage: Int
    let capacity: Double
    let carPriceInRubles: Int
    var carPriceInDollars: Int {
        Int(Double(carPriceInRubles) / 3.23)
    }
    let vin: Bool
    let top: Bool
    let images: [UIImage]
    let bodyType: BodyType
    let engineType: EngineType
    let carColor: String
    let transmission: TransmissionType
    let fuelConsumption: Double
}
