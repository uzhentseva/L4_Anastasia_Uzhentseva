//Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.
//Описать пару его наследников TrunkCar и SportCar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
//Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет TrunkCar, а какие – SportCar. Добавить эти действия в перечисление.
//В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
//Создать несколько объектов каждого класса. Применить к ним различные действия.
//Вывести значения свойств экземпляров в консоль.

import Foundation

// ДЕЙСТВИЯ
// состояние двигателя : вкл, выкл
enum motorState: String {
    case on = "включен", off = "выключен"
}

// состояние окна : открытое, закрытое
enum windowOpen: String {
    case open = "открыто", close = "закрыто"
}

//состояние ускорения для спорткара
enum nitroButton: String {
    case on = "включено", off = "выключено"
}

//состояние погрузки в грузовик
enum carrierLoad: String {
    case load = "загружается", unload = "разгружается"
}


//КЛАССЫ
// создаём класс спорт
class Car {
    let brand: String
    let year: Int
    let capacity: Double
    var motorState: motorState
    var windowOpen: windowOpen
    
    init(bbrand: String, yyear: Int, ccapacity: Double, mmotorState: motorState, wwindowOpen: windowOpen) {
        self.brand = bbrand
        self.year = yyear
        self.capacity = ccapacity
        self.motorState = mmotorState
        self.windowOpen = wwindowOpen
    }
    
    // функции изменения положения окна
    func openWindow() {
        self.windowOpen = .open
        print("Окно открыто")
    }
    func closeWindow() {
        self.windowOpen = .close
        print("Окно закрыто")
    }
    
    // функции изменения работы двигателя
    func motorOn() {
        self.motorState = .on
        print("Двигатель включен")
    }
    func motorOff() {
        self.motorState = .off
        print("Двигатель включен")
    }
}

// создаём подкласс Sport
// добавляем атрибут ускорения
class SportCar: Car {
    var nitro: nitroButton
    
    init(bbrand: String, yyear: Int, ccapacity: Double, mmotorState: motorState, wwindowOpen: windowOpen, nnitro: nitroButton) {
        self.nitro = nnitro
        super.init(bbrand: bbrand, yyear: yyear, ccapacity: ccapacity, mmotorState: mmotorState, wwindowOpen: wwindowOpen)
    }
    
    //функция вкл-выкл ускорения
    func nitroOn() {
        self.nitro = .on
        print("Включено ускорение")
    }
    
    func nitroOff() {
        self.nitro = .off
        print("Ускорение выключено")
    }
    
    //перезагружаем функцию открытия-закрытия окна
    override func openWindow() {
        super.openWindow()
    }
    
    override func closeWindow() {
        super.closeWindow()
    }
}

// создаём подкласс Trunk
// добавляем атрибут грузового отсека
class TrunkCar: Car {
    var carrierLoad: carrierLoad
    
    init(bbrand: String, yyear: Int, ccapacity: Double, mmotorState: motorState, wwindowOpen: windowOpen, ccarierLoad: carrierLoad) {
        self.carrierLoad = ccarierLoad
        super.init(bbrand: bbrand, yyear: yyear, ccapacity: ccapacity, mmotorState: mmotorState, wwindowOpen: wwindowOpen)
    }
    
    // добавляем действие загрузки-выгрузки
    func toLoad() {
        self.carrierLoad = .load
        print("Машина на погрузке")
    }
    
    func offLoad() {
        self.carrierLoad = .unload
        print("Машина выгружается")
    }
    
    // перегружаем функцию ускорения
    override func motorOn() {
        super.motorOn()
        print("Двигатель заведён")
    }
}


var car1 = Car(bbrand: "Volvo", yyear: 2000, ccapacity: 70, mmotorState: .off, wwindowOpen: .close)
var carS = SportCar(bbrand: "Porche", yyear: 2018, ccapacity: 40, mmotorState: .on, wwindowOpen: .open, nnitro: .off)
var carT = TrunkCar(bbrand: "MAN", yyear: 2015, ccapacity: 150, mmotorState: .off, wwindowOpen: .open, ccarierLoad: .load)

//выводим в консоль действия и инфо об экземплярах
car1.openWindow()
car1.motorOn()
print("\n")

carS.closeWindow()
carS.nitroOn()
print("\n")

carT.offLoad()
carT.closeWindow()
print("\n")

print("Легковое авто марки \(car1.brand), года выпуска \(car1.year), вместимость багажника \(car1.capacity), двигатель \(car1.motorState.rawValue), окно \(car1.windowOpen.rawValue)")
print("\n")

print("Спортивное авто марки \(carS.brand), года выпуска \(carS.year), вместимость багажника \(carS.capacity), двигатель \(carS.motorState.rawValue), окно \(carS.windowOpen.rawValue), ускорение \(carS.nitro.rawValue)")
print("\n")

print("Грузовое авто марки \(carT.brand), года выпуска \(carT.year), вместимость багажника \(carT.capacity), двигатель \(carT.motorState.rawValue), окно \(carT.windowOpen.rawValue), сейчас \(carT.carrierLoad.rawValue)")
print("\n")
