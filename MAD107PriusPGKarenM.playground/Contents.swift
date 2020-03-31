import Cocoa

var str = "Hello, playground"

//.. This playground program uses hard coded menu item values from a dictionary, enums, functions, and structures... and calculates
//..   the order cost, the tax, the tip, and the total cost to the user

//print("\n****************************************************************************************************************************************************")
//print("********                                                    Bill's Amazing WeBurgers                                                        ********")
//print("****************************************************************************************************************************************************")

//.. Approved Menu Items
var menuDictionary = ["French Fries": (price: 2.25, desc: "Super Deluxe French Fries"),
                      "Onion Rings": (price: 2.50, desc: "Onion Rings"),
                      "Cheese Stix":(price: 1.25, desc: "Cheese Stix"),
                      "Soda C":(price: 1.25, desc: "Coke"),
                      "Soda RB":(price:1.25, desc: "Root Beer"),
                      "Soda S":(price:1.25, desc: "Sprite"),
                      "Chicken Sandwich":(price:3.75, desc: "Chicken Sandwich with Mayo, Lettuce, Tomato, and Chipotle Sauce"),
                      "Gyro Meal Deal":(price:5.25, desc: "Gyro with French Fries and Homemade Coleslaw"),
                      //"Burger - Bacon": (price: 4.75, desc: "1/4 lb Angus Beef Burger with Apple Roasted Bacon, Cheddar Cheese, and Mushrooms"),
                      "Burger - Bacon": (price: 4.75, desc: nil),
                      "Burger - Mushroom Swiss": (price: 4.75, desc: "1/4 lb Angus Beef Burger with Swiss Cheese and Savory Mushrooms"),
                      "Burger - Veggie": (price: 4.75, desc: "1/4 lb Premium Veggie Burger with Spicy Mayo, Lettuce, and Tomato"),
                      "Burger - American": (price: 4.75, desc: "1/4 lb Angus Beef Burger with American Cheese, Lettuce, Tomato, Pickles, and our \"Special Sauce\""),
                      "Burger - BBQ": (price: 4.75, desc: "1/4 lb Angus Beef Burger with Smokey BBQ Sauce, Lettuce, and Tomato"),
                      "Burger - Blue Cheese": (price: 4.75, desc: "1/4 lb Angus Beef Burger with Blue Cheese and Ranch, Lettuce, and Tomato"),
                      "Burger - Japaleno": (price: 4.75, desc: "1/4 lb Angus Beef Burger with Japalenos, PepperJack Cheese, Lettuce, Tomato, and our Spicy \"Salsa\" Sauce"),
                      "Burger - Pizza": (price: 4.75, desc: "1/4 lb Angus Beef Burger with Mozarella Cheese, Lettuce, and our Fantastic Pizza Sauce"),
                      "Burger - Everything": (price: 4.75, desc: "1/4 lb Angus Beef Burger with Apple Roasted Bacon, Cheddar Cheese, Lettuce, Tomato, Pickles, and Whatever Else You Want!")
]

var priusModelDictionary = ["L Eco": (price: 24325.00, desc: "Economy"),
                            "LE": (price: 25535.00, desc: "Luxury Edition"),
                            "XLE": (price: 28375.00, desc: "Deluxe Luxury Edition"),
                            "Limited": (price: 32500.00, desc: "Limited Edition"),
                            "LE AWD-e": (price: 26935.00, desc: "Limited Edition All Wheel Drive"),
                            "XLE AWD-e": (price: 29375.00, desc: "Deluxe Limited Edition All Wheel Drive")
]

enum CarColor: String {
    case Blue = "Electric Storm Blue"
    case Pearl = "Blizzard Pearl"
    case Silver = "Classic Silver Metallic"
    case Gray = "Magnetic Gray Metallic"
    case Black = "Midnight Black Metallic"
    case Red = "Supersonic Red"
    case Sea = "Sea Glass Pearl"
}

enum ExtAcc: String {
    case SpokeAW = "15in 10-Spoke Alloy Wheels"
    case AeroSS = "Aero Side Splitter"
    case AlloyWL = "Alloy Wheel Locks"
    case BlackoutWI = "Blackout Wheel Inserts"
    case BodySM = "Body Side Molding"
    case DoorEG = "Door Edge Guards"
    case PaintPF = "Paint Protect Film"
    case RearBA = "Rear Bumper Applique"
    case RearBP = "Rear Bumper Protector"
    case RemovableCB = "Removable Cross Bars"
}

enum IntAcc: String {
    case AllWFL = "All Weather Floor Liners"
    case CargoN = "Cargo Net - Envelope"
    case CargoT = "Cargo Tote"
    case CargoL = "Cargo Liner"
    case CarpetCM = "Carpet Cargo Mat"
    case CarpetFM = "Carpet Floor Mats"
    case CoinHAC = "Coin Holder/Ashtray Cup"
    case EmergK = "Emergency Kit"
    case FirstAK = "First Aid Kit"
    case FlessHM = "Frameless Homelink Mirror"
    case IllumDS = "Illuminated Door Sills"
    case SecurS = "Security System"
    case UnivTH = "Universal Table Holder"
}

class Prius2020 {
    
    var priusModel: String
    var priusColor: String
    
    init(model: String, color: CarColor) {
        self.priusModel = model
        self.priusColor = color.rawValue
    }
    
    func printModColor() {
        
        print("\n*********************************************************************************")
        print("**              Congratulations on your 2020 Prius purchase!                   **")
        print("*********************************************************************************")
        print("\n\t\tYou've selected:  \n\n\t\t\t\tModel: \(priusModel)   Color: \(priusColor)")
        
        
        
        if let myPrice = priusModelDictionary[priusModel]?.price {
            print("\t\t\t\tBase price: $\(String(format: "%.2f", myPrice))")
            //print("\n\t\t\t\tBase price: $\(Double(myPrice))")
        } else {
            print("\t\t\t\tBase price:  2020 Prius Model: ** \(priusModel) not found **")
        }
        
        
    }
}

class PriusLE: Prius2020 {
    
//    var kamTest: String = "this is a test"
    var kamTest2: Int
    var kamModel: String
    
    override init(model: String, color: CarColor) {
        self.kamTest2 = 0
        self.kamModel = model
        super.init(model: model, color: color)
    }
    
    override func printModColor() {
        print("\n\t\t\tModel LE: \(priusModelDictionary[kamModel]?.desc ?? "nf")")
        super.printModColor()
    }
    
    
}

var selectPrius = Prius2020(model: "Limited", color: CarColor.Blue)
selectPrius.printModColor()

var selectLE = PriusLE(model: "XLE", color: CarColor.Pearl)
selectLE.printModColor()

selectLE.priusColor = CarColor.Black.rawValue
selectLE.printModColor()
selectLE.priusModel = "ABC"
selectLE.printModColor()

selectLE.priusColor = CarColor.Red.rawValue
selectLE.priusModel = "L Eco"
selectLE.printModColor()

selectLE.priusColor = CarColor.Sea.rawValue
selectLE.priusModel = "LE"
selectLE.printModColor()

selectLE.priusColor = CarColor.Red.rawValue
selectLE.priusModel = "L Eco"
selectLE.printModColor()








let taxRateE = 0.075

var tipCalculatedE: Double = 0
var taxCalculatedE: Double = 0
var orderAmtE: Double = 0
var totalOrderAmtE: Double = 0

//..enum for food items other than burgers
enum FoodOrder {
    case Burger(burger: String)
    case FrenchFries(desc: String, price: Double)
    case SoftDrink(desc: String, price: Double)
    case ChickenSandwich(desc: String, price: Double)
    case Gyro(desc: String, price: Double)
    case OnionRings(desc: String, price: Double)
    case CheeseStix(desc: String, price: Double)
}
//..enum for burgers
enum BurgerType {
    case BaconBurger(type: String , desc: String, price: Double )
    case MushroomSwissBurger(type: String , desc: String, price: Double )
    case VeggieBurger(type: String , desc: String, price: Double )
    case AmericanBurger(type: String , desc: String, price: Double )
    case BbqBurger(type: String , desc: String, price: Double )
    case BlueCheeseBurger(type: String , desc: String, price: Double )
    case JalapenoBurger(type: String , desc: String, price: Double )
    case PizzaBurger(type: String , desc: String, price: Double )
    case EverythingBurger(type: String , desc: String, price: Double )
}
//................................................................................................................................................
//.. structure for ordering food/drinks
struct ItemsOrdered {
    
    var itemOrder: FoodOrder
    
    //..
    var testMsg2: String {
        //printOrder()
        //return "Thank you for ordering! \(itemOrder)"
        return "\n\nThank you for ordering! Bill\'s Amazing WeBurgers appreciates your business!"
    }

    
    func printOrder() {
        //.. switch to see what kind of food was ordered (burger or other items); instantiate myBurger if it was a burger OR set up enum object by referencing main menuDictionary to print out other food items
        switch itemOrder {
        case .Burger(let burger):
            var myBurger = BurgersOrdered(burgerKey: burger).printBurger()
            
        case .FrenchFries(let desc, let prc), .ChickenSandwich(let desc, let prc), .SoftDrink(let desc, let prc),
             .Gyro(let desc, let prc), .OnionRings(let desc, let prc), .CheeseStix(let desc, let prc):

            print("\nItem -->: \(desc) @@@ Price: $\(String(format: "%.2f", prc))")
            orderAmtE += prc
            
            //$\(String(format: "%.2f", itemPrice))")
        }
    }
}
//................................................................................................................................................
//.. structure for ordering burgers
struct BurgersOrdered {
   
    var burgerKey: String
    
    func printBurger() {
        
        //.. initialization of burgerDesc
        var burgerDesc = BurgerType.BaconBurger(type: "Initialized", desc: "* No Desc -> new burger? *", price: 0)
        
        //.. switch to see what kind of burger was ordered and then set up enum object by referencing main menuDictionary
        switch burgerKey {
        case "Burger - Bacon":
            burgerDesc = BurgerType.BaconBurger(type: "Burger/Bacon", desc: menuDictionary[burgerKey]?.desc ?? "* No Desc *", price: menuDictionary[burgerKey]?.price ?? 0)
        case "Burger - Mushroom Swiss":
            burgerDesc = BurgerType.MushroomSwissBurger(type: "Burger/MushSW", desc: menuDictionary[burgerKey]?.desc ?? "* No Desc *", price: menuDictionary[burgerKey]?.price ?? 0)
        case "Burger - Veggie":
            burgerDesc = BurgerType.VeggieBurger(type: "Burger/Veggie", desc: menuDictionary[burgerKey]?.desc ?? "* No Desc *", price: menuDictionary[burgerKey]?.price ?? 0)
        case "Burger - American":
            burgerDesc = BurgerType.AmericanBurger(type: "Burger/American", desc: menuDictionary[burgerKey]?.desc ?? "* No Desc *", price: menuDictionary[burgerKey]?.price ?? 0)
        case "Burger - BBQ":
            burgerDesc = BurgerType.BbqBurger(type: "Burger/BBQ", desc: menuDictionary[burgerKey]?.desc ?? "* No Desc *", price: menuDictionary[burgerKey]?.price ?? 0)
        case "Burger - Blue Cheese":
            burgerDesc = BurgerType.BlueCheeseBurger(type: "Burger/BlueCh", desc: menuDictionary[burgerKey]?.desc ?? "* No Desc *", price: menuDictionary[burgerKey]?.price ?? 0)
        case "Burger - Japaleno":
            burgerDesc = BurgerType.JalapenoBurger(type: "Burger/Japaleno", desc: menuDictionary[burgerKey]?.desc ?? "* No Desc *", price: menuDictionary[burgerKey]?.price ?? 0)
        case "Burger - Pizza":
            burgerDesc = BurgerType.PizzaBurger(type: "Burger/Pizza", desc: menuDictionary[burgerKey]?.desc ?? "* No Desc *", price: menuDictionary[burgerKey]?.price ?? 0)
        case "Burger - Everything":
            burgerDesc = BurgerType.EverythingBurger(type: "Burger/Everything", desc: menuDictionary[burgerKey]?.desc ?? "* No Desc *", price: menuDictionary[burgerKey]?.price ?? 0)
        default:
            print("\n*** Error: Burger Not on Menu ***")
        }

        //.. switch to see which enum burger is ordered and used to print line item infomation
        switch burgerDesc {

        case .BaconBurger(let type, let desc, let prc):
            print("\nItem -->: \(type): \(desc) @@@ Price: $\(String(format: "%.2f", prc))")
            print("\t\t\t *** Oh baby! If you love bacon, you're going to love this! ***")
            orderAmtE += prc
        case .MushroomSwissBurger(let type, let desc, let prc):
            print("\nItem -->: \(type): \(desc) @@@ Price: $\(String(format: "%.2f", prc))")
            orderAmtE += prc
        case .VeggieBurger(let type, let desc, let prc):
            print("\nItem -->: \(type): \(desc) @@@ Price: $\(String(format: "%.2f", prc))")
            orderAmtE += prc
        case .AmericanBurger(let type, let desc, let prc):
            print("\nItem -->: \(type): \(desc) @@@ Price: $\(String(format: "%.2f", prc))")
            orderAmtE += prc
        case .BbqBurger(let type, let desc, let prc):
            print("\nItem -->: \(type): \(desc) @@@ Price: $\(String(format: "%.2f", prc))")
            orderAmtE += prc
        case .BlueCheeseBurger(let type, let desc, let prc):
            print("\nItem -->: \(type): \(desc) @@@ Price: $\(String(format: "%.2f", prc))")
            orderAmtE += prc
        case .JalapenoBurger(let type, let desc, let prc):
            print("\nItem -->: \(type): \(desc) @@@ Price: $\(String(format: "%.2f", prc))")
            print("\t\t\t *** HOT!!! HOT!!! HOT!!! ***")
            orderAmtE += prc
        case .PizzaBurger(let type, let desc, let prc):
            print("\nItem -->: \(type): \(desc) @@@ Price: $\(String(format: "%.2f", prc))")
            orderAmtE += prc
            print("\t\t\t *** Who needs pizza when you can have this!!! ***")
        case .EverythingBurger(let type, let desc, let prc):
            print("\nItem -->: \(type): \(desc) @@@ Price: $2.75")  //$\(String(format: "%.2f", prc))
            //orderAmtE += prc
            orderAmtE += 2.75
            print("\t\t\t *** On special today for $2.75 each ***")
        default:
            print("\nNo Burgers Ordered")
        }
    }
}
//................................................................................................................................................
//.. main function called when placing an order
func placeMyOrder (item: String) {
    
    let myItem = item
    let myMenu = menuDictionary
    //var itemFound = myMenu.keys.contains(item)
    
    //.. determine if the item (string) ordered is even in the menuDictionary
    if myMenu.keys.contains(myItem) {
    
        switch myItem {
        case "French Fries":
            let myFF = ItemsOrdered(itemOrder: FoodOrder.FrenchFries(desc: menuDictionary[myItem]?.desc ?? " ", price: menuDictionary[myItem]?.price ?? 0))
            myFF.printOrder()
        case "Onion Rings":
            let myOR = ItemsOrdered(itemOrder: FoodOrder.OnionRings(desc: menuDictionary[myItem]?.desc ?? " ", price: menuDictionary[myItem]?.price ?? 0))
            myOR.printOrder()
        case "Cheese Stix":
            let myCSX = ItemsOrdered(itemOrder: FoodOrder.CheeseStix(desc: menuDictionary[myItem]?.desc ?? " ", price: menuDictionary[myItem]?.price ?? 0))
           myCSX.printOrder()
        case "Soda C", "Soda RB", "Soda S":
            let mySoda = ItemsOrdered(itemOrder: FoodOrder.SoftDrink(desc: menuDictionary[myItem]?.desc ?? " ", price: menuDictionary[myItem]?.price ?? 0))
            mySoda.printOrder()
        case "Chicken Sandwich":
            let myCS = ItemsOrdered(itemOrder: FoodOrder.ChickenSandwich(desc: menuDictionary[myItem]?.desc ?? " ", price: menuDictionary[myItem]?.price ?? 0))
            myCS.printOrder()
        case "Gyro Meal Deal":
            let myGY = ItemsOrdered(itemOrder: FoodOrder.Gyro(desc: menuDictionary[myItem]?.desc ?? " ", price: menuDictionary[myItem]?.price ?? 0))
            myGY.printOrder()
        case "Burger - Bacon", "Burger - Mushroom Swiss", "Burger - Veggie", "Burger - American",
             "Burger - BBQ", "Burger - Blue Cheese", "Burger - Japaleno", "Burger - Pizza", "Burger - Everything":
            let myBur = ItemsOrdered(itemOrder: FoodOrder.Burger(burger: myItem))
            myBur.printOrder()
        default:
            print("*** Item not found on current menu. Please try again.")
        }
        
    } else {
        print("\n*Error->: \(myItem) -> Item requested not found on current menu *")
    }
    
}
//................................................................................................................................................
//.. calculate all order totals and print
func calcTotals() {

    taxCalculatedE = orderAmtE * taxRateE
    tipCalculatedE = orderAmtE * 0.20
    
    totalOrderAmtE = orderAmtE + taxCalculatedE + tipCalculatedE
    
    print("\n****************************************************************************************************************************************************")
    print("********                                                               TOTALS                                                               ********")
    print("****************************************************************************************************************************************************")

    print(".............................................................................................................")
    //print("\nSubtotal order amount without tax and tip = \t$\(orderAmt)")
    //.. formatted better
    print("\nSubtotal order amount without tax and tip = \t$\(String(format: "%.2f", orderAmtE))")

    print(".............................................................................................................")
    //print("Tax calculated at rate of \(taxRate) = \t\t\t\t$\(taxCalculated)")
    //.. formatted better
    print("Tax calculated at rate of \(taxRateE) = \t\t\t\t$\(String(format: "%.2f", taxCalculatedE))")

    print(".............................................................................................................")
    //print("Tip calculated at 20% = \t\t\t\t\t\t$\(tipCalculated)")
    //print("Tip calculated at 20% = \t\t\t\t\t\t$\(tipCalculated2)")
    //.. formatted better
    print("Tip calculated at 20% = \t\t\t\t\t\t$\(String(format: "%.2f", tipCalculatedE))")

    print(".............................................................................................................")
    print("The total amount for this order with tax and tip included: ")
    //print("\t\t--> $\(totalOrderAmt)")
    //.. formatted better
    print("\t\t\t    *****************")
    print("\t\t\t--> ***   $\(String(format: "%.2f", totalOrderAmtE))")
    print("\t\t\t    *****************")
    
    let tempItemsOrdered = ItemsOrdered(itemOrder: FoodOrder.Burger(burger: ""))
    print(tempItemsOrdered.testMsg2)
    
    
   
}

//................................................................................................................................................
//.. place the orders for each item desired; at end, calculate receipt totals
//placeMyOrder(item: "French Fries")
//placeMyOrder(item: "Onion Rings")
//placeMyOrder(item: "Soda C")
//placeMyOrder(item: "Soda RB")
//placeMyOrder(item: "7up")
//placeMyOrder(item: "Chicken Sandwich")
//placeMyOrder(item: "Burger - Pizza")
//placeMyOrder(item: "Burger - Bacon")
//placeMyOrder(item: "Burger - Japaleno")
//placeMyOrder(item: "Cheese Stix")
//placeMyOrder(item: "Burger - Mushroom Swiss")
//placeMyOrder(item: "Burger - Everything")
//placeMyOrder(item: "Burger - Bean")
//calcTotals()



