import Cocoa

var str = "Hello, playground"


var priusModelDictionary = ["L Eco": (price: 24325.00, desc: "Economy"),
                            "LE": (price: 25535.00, desc: "Luxury Edition"),
                            "XLE": (price: 28375.00, desc: "Deluxe Luxury Edition"),
                            "Limited": (price: 32500.00, desc: "Limited Edition"),
                            "LE AWD-e": (price: 26935.00, desc: "Limited Edition All Wheel Drive"),
                            "XLE AWD-e": (price: 29375.00, desc: "Deluxe Limited Edition All Wheel Drive")
]

var priusAccPkgsDictionary = ["ALLWFLP": (desc: "All-Weather Floor Liner Package", incls: "All-Weather Floor Liners, Cargo Liner"),
                              "CMP": (desc: "Carpet Mat Package", incls: "Carpet Floor Mats, Carpet Cargo Mat"),
                              "FSFMLP": (desc: "Four Season FLoor Mat/Liner Package", incls: "Carpet Floor Mats, Carpet Cargo Mat, All-Weather Floor Liners"),
                              "PAP": (desc: "Preferred Accessory Package", incls: "Carpet Floor Mats, Carpet Cargo Mat, Rear Bumper Applique, Cargo Net - Envelope"),
                              "PP3": (desc: "Protection Package #3", incls: "Body Side Moldings, Door Edge Guards, Rear Bumper Applique")
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

enum AccPkgs: String {
    case NONE = "NONE"
    case ALLWFLP = "ALLWFLP"
    case CMP = "CMP"
    case FSFMLP = "FSFMLP"
    case PAP = "PAP"
    case PP3 = "PP3"
}


class Prius2020 {
    
    var priusModel: String
    var priusColor: String
    var priusExtAccBuild: [String] = []
    var priusIntAccBuild: [String] = []
    var priusAccPkgBuild: [String] = []
    
    
    init(model: String, color: CarColor) {
        self.priusModel = model
        self.priusColor = color.rawValue
    }
    
    func addExtAcc(extAccName: ExtAcc) {
        //ADD ACCESSORIES ONLY IF THEY ALREADY HAVEN'T BEEN ADDED AS PART OF AN ACCESSORY PACKAGE
        switch extAccName {
        //.. add if following accessories are not part of a package at all
            case .AeroSS, .SpokeAW, .AlloyWL, .BlackoutWI, .PaintPF, .RearBP, .RemovableCB:
                priusExtAccBuild.append(extAccName.rawValue)
        //.. add if following accessories are not part of a package that was already added
            case .BodySM:
                if (!priusAccPkgBuild.contains(AccPkgs.PP3.rawValue)) {
                    priusExtAccBuild.append(extAccName.rawValue)
                }
            case .DoorEG:
                if (!priusAccPkgBuild.contains(AccPkgs.PP3.rawValue)) {
                    priusExtAccBuild.append(extAccName.rawValue)
                }
            case .RearBA:
                if (!priusAccPkgBuild.contains(AccPkgs.PP3.rawValue) &&
                    !priusAccPkgBuild.contains(AccPkgs.PAP.rawValue)) {
                    
                    priusExtAccBuild.append(extAccName.rawValue)
                }
        }
     
    }
    
    func addIntAcc(intAccName: IntAcc) {
        //ADD ACCESSORIES ONLY IF THEY ALREADY HAVEN'T BEEN ADDED AS PART OF AN ACCESSORY PACKAGE
        switch intAccName {
        //.. add if following accessories are not part of a package at all
            case .CargoT, .CoinHAC, .EmergK, .FirstAK, .FlessHM, .IllumDS, .SecurS, .UnivTH:
                priusIntAccBuild.append(intAccName.rawValue)
        //.. add if following accessories are not part of a package that was already added
            case .AllWFL:
                if (!priusAccPkgBuild.contains(AccPkgs.ALLWFLP.rawValue) &&
                    !priusAccPkgBuild.contains(AccPkgs.FSFMLP.rawValue)) {
                    
                    priusIntAccBuild.append(intAccName.rawValue)
                }
            case .CargoN:
                if (!priusAccPkgBuild.contains(AccPkgs.PAP.rawValue)) {
                    priusIntAccBuild.append(intAccName.rawValue)
                }
            case .CargoL:
                if (!priusAccPkgBuild.contains(AccPkgs.ALLWFLP.rawValue)) {
                    priusIntAccBuild.append(intAccName.rawValue)
                }
            case .CarpetCM:
                if (!priusAccPkgBuild.contains(AccPkgs.CMP.rawValue) &&
                    !priusAccPkgBuild.contains(AccPkgs.FSFMLP.rawValue) &&
                    !priusAccPkgBuild.contains(AccPkgs.PAP.rawValue)) {
                    
                    priusIntAccBuild.append(intAccName.rawValue)
                    
                }
            case .CarpetFM:
                if (!priusAccPkgBuild.contains(AccPkgs.CMP.rawValue) &&
                    !priusAccPkgBuild.contains(AccPkgs.FSFMLP.rawValue) &&
                    !priusAccPkgBuild.contains(AccPkgs.PAP.rawValue)) {
                    
                    priusIntAccBuild.append(intAccName.rawValue)
                    }
            
        }
        
    }
    
    func addAccPkg(accPkgName: AccPkgs) {
        
        
        switch accPkgName {
        case .ALLWFLP:
            //.. add accessory package
            priusAccPkgBuild.append(AccPkgs.ALLWFLP.rawValue)
            //.. remove any individual accessories that were added that are already part of the accessory package selected
            if let idx = priusIntAccBuild.firstIndex(of: IntAcc.AllWFL.rawValue) {
                priusIntAccBuild.remove(at: idx)
            }
            if let idx = priusIntAccBuild.firstIndex(of: IntAcc.CargoL.rawValue) {
                priusIntAccBuild.remove(at: idx)
            }
            
        case .CMP:
            //.. add accessory package
            priusAccPkgBuild.append(AccPkgs.CMP.rawValue)
            
            //.. remove any individual accessories that were added that are already part of the accessory package selected
            if let idx = priusIntAccBuild.firstIndex(of: IntAcc.CarpetCM.rawValue) {
                priusIntAccBuild.remove(at: idx)
            }
            if let idx = priusIntAccBuild.firstIndex(of: IntAcc.CarpetFM.rawValue) {
                priusIntAccBuild.remove(at: idx)
            }
            
        case .FSFMLP:
            //.. add accessory package
            priusAccPkgBuild.append(AccPkgs.FSFMLP.rawValue)
            //.. remove any individual accessories that were added that are already part of the accessory package selected
            if let idx = priusIntAccBuild.firstIndex(of: IntAcc.CarpetCM.rawValue) {
                priusIntAccBuild.remove(at: idx)
            }
            if let idx = priusIntAccBuild.firstIndex(of: IntAcc.CarpetFM.rawValue) {
                priusIntAccBuild.remove(at: idx)
            }
            if let idx = priusIntAccBuild.firstIndex(of: IntAcc.AllWFL.rawValue) {
                priusIntAccBuild.remove(at: idx)
            }
            
        case .PAP:
            //.. add accessory package
            priusAccPkgBuild.append(AccPkgs.PAP.rawValue)
            //.. remove any individual accessories (internal) that were added that are already part of the accessory package selected
            if let idx = priusIntAccBuild.firstIndex(of: IntAcc.CarpetCM.rawValue) {
                priusIntAccBuild.remove(at: idx)
            }
            if let idx = priusIntAccBuild.firstIndex(of: IntAcc.CarpetFM.rawValue) {
                priusIntAccBuild.remove(at: idx)
            }
            if let idx = priusIntAccBuild.firstIndex(of: IntAcc.CargoN.rawValue) {
                priusIntAccBuild.remove(at: idx)
            }
            
            //.. remove any individual accessories (external) that were added that are already part of the accessory package selected
            if let idx = priusExtAccBuild.firstIndex(of: ExtAcc.RearBA.rawValue) {
                priusExtAccBuild.remove(at: idx)
            }
            
        case .PP3:
            //.. add accessory package
            priusAccPkgBuild.append(AccPkgs.PP3.rawValue)
            //.. remove any individual accessories that were added that are already part of the accessory package selected
            if let idx = priusExtAccBuild.firstIndex(of: ExtAcc.RearBA.rawValue) {
                priusExtAccBuild.remove(at: idx)
            }
            if let idx = priusExtAccBuild.firstIndex(of: ExtAcc.BodySM.rawValue) {
                priusExtAccBuild.remove(at: idx)
            }
            if let idx = priusExtAccBuild.firstIndex(of: ExtAcc.DoorEG.rawValue) {
                priusExtAccBuild.remove(at: idx)
            }
            
        case .NONE:
            //.. add accessory package
            priusAccPkgBuild.append(AccPkgs.NONE.rawValue)
        }
        
        
    }
    
    func printModColor() {
        
        print("\n\n*********************************************************************************")
        print("**              Congratulations on your 2020 Prius purchase!                   **")
        print("*********************************************************************************")
        print("\n\t\tYou've selected:  \n\n\t\t\t\tModel: \(priusModel)   Color: \(priusColor)")
        
        
        
        if let myPrice = priusModelDictionary[priusModel]?.price {
            print("\t\t\t\tBase price: $\(String(format: "%.2f", myPrice))")
            //print("\n\t\t\t\tBase price: $\(Double(myPrice))")
        } else {
            print("\t\t\t\tBase price:  2020 Prius Model: ** \(priusModel) not found **")
        }
        
        print("\n\t\t\t\tAccessory Packages Selected:")
        if (priusAccPkgBuild.count) > 0 {
            for item in priusAccPkgBuild {
                print("\t\t\t\t\tPackage: \(priusAccPkgsDictionary[item]?.desc ?? "Accessory Package not Available")")
                print("\t\t\t\t\t\tIncludes: \(priusAccPkgsDictionary[item]?.incls ?? "Invalid - Nothing Included")")
            }
        } else {
            print("\t\t\t\t** No Accessory Packages Selected **")
        }
        
        print("\n\t\t\t\tExternal Accessories Selected:")
        if (priusExtAccBuild.count) > 0 {
            for item in priusExtAccBuild {
                print("\t\t\t\t\t\(item)")
            }
        } else {
            print("\t\t\t\t** No External Accessories Selected **")
        }
        
        print("\n\t\t\t\tInternal Accessories Selected:")
        if (priusIntAccBuild.count) > 0 {
            for item in priusIntAccBuild {
                print("\t\t\t\t\t\(item)")
            }
        } else {
            print("\t\t\t\t** No Internal Accessories Selected **")
        }
       
       
        
        
    }
}

//.. subclass for Prius Model L Eco
class PriusLEco: Prius2020 {
//    var kamTest: String = "this is a test"
    //var kamTest2: Int
    var kamModel: String
    
    override init(model: String, color: CarColor) {
        //self.kamTest2 = 0
        //self.kamModel = model
        self.kamModel = "L Eco"
        super.init(model: "L Eco", color: color)
    }
    
    override func printModColor() {
        super.printModColor()
        print("\nModel L Eco: \(priusModelDictionary[kamModel]?.desc ?? "nf")")
        
        let stdEquip = ["58/53 est. mpg","15-in. 5-spoke alloy wheels with full wheel covers and P195/65R15 tires",
                        "7-in. touch-screen with Apple CarPlay & Amazon Alexa compatible",
                        "Two rear USB 2.1A ports", "Toyota Safety Sense™ P (TSS-P) standard",
                        "Safety Connect",
                        "24-hour Roadside Assistance for three years and unlimited miles",
                        "Up to 27.4 cu. ft. of cargo space"
        ]
        
        var i = 1
        print("\nStandard Equipment:")
        print("................................................................................")
        for item in stdEquip {
            print("\(i). \(item)")
            i += 1
        }
    }
    
}

//.. subclass for Prius Model LE
class PriusLE: Prius2020 {
    //    var kamTest: String = "this is a test"
    //var kamTest2: Int
    var kamModel: String
    
    override init(model: String, color: CarColor) {
        //self.kamTest2 = 0
        //self.kamModel = model
        self.kamModel = "LE"
        super.init(model: "LE", color: color)
    }
    
    override func printModColor() {
        super.printModColor()
        print("\nModel LE: \(priusModelDictionary[kamModel]?.desc ?? "nf")")
        
        let stdEquip = ["54/50 est. mpg",
                        "Toyota Safety Sense P (TSS-P) standard",
                        "Blind Spot Monitor (BSM) with Rear Cross-Traffic Alert (RCTA)",
                        "Intelligent Clearance Sonar (ICS) with Intelligent Parking Assist (IPA)",
                        "Up to 24.6 cu. ft. of Cargo Space"]
        var i = 1
        print("\nStandard Equipment:")
        print("................................................................................")
        for item in stdEquip {
            print("\(i). \(item)")
            i += 1
        }
    }
    
}

//.. subclass for Prius Model XLE
class PriusXLE: Prius2020 {
    //    var kamTest: String = "this is a test"
    //var kamTest2: Int
    var kamModel: String
    
    override init(model: String, color: CarColor) {
        //self.kamTest2 = 0
        //self.kamModel = model
        self.kamModel = "XLE"
        super.init(model: "XLE", color: color)
    }
    
    override func printModColor() {
        super.printModColor()
        print("\nModel XLE: \(priusModelDictionary[kamModel]?.desc ?? "nf")")
        
        let stdEquip = ["54/50 est. mpg",
                        "Toyota Safety Sense P (TSS-P) standard",
                        "17-in. 5-spoke alloy wheels with titanium-finished wheel inserts and P215/45R17 tires",
                        "SofTex®-trimmed 61 heated front seats with 8-way power-adjustable driver's seat \n\t\tincluding power lumbar support and 4-way adjustable front passenger seat",
                        "Qi-compatible wireless smartphone charging with charge indicator light",
                        "Rain-sensing variable intermittent windshield wipers",
                        "SofTex®-trimmed heated tilt/telescopic steering wheel",
                        "Smart Key System on three doors with Push Button Start and remote illuminated entry"
                        ]
        
        var i = 1
        print("\nStandard Equipment:")
        print("................................................................................")
        for item in stdEquip {
            print("\(i). \(item)")
            i += 1
        }
    }
    
}

//.. subclass for Prius Model Limited
class PriusLimited: Prius2020 {
    //    var kamTest: String = "this is a test"
    //var kamTest2: Int
    var kamModel: String
    
    override init(model: String, color: CarColor) {
        //self.kamTest2 = 0
        //self.kamModel = model
        self.kamModel = "Limited"
        super.init(model: "Limited", color: color)
    }
    
    override func printModColor() {
        super.printModColor()
        print("\nModel Limited: \(priusModelDictionary[kamModel]?.desc ?? "nf")")
        
        let stdEquip = ["54/50 est. mpg",
                        "Toyota Safety Sense P (TSS-P) standard",
                        "Adaptive Front-Lighting System (AFS) with auto-leveling headlights",
                        "17-in. 5-spoke alloy wheels with titanium-finished wheel inserts and P215/45R17 tires",
                        "Premium JBL® Audio with Integrated Navigation and 11.6-in. high-resolution touch-screen and Apple CarPlay & Amazon Alexa compatible",
                        "Color Head-Up Display (HUD)"
        ]
        
        var i = 1
        print("\nStandard Equipment:")
        print("................................................................................")
        for item in stdEquip {
            print("\(i). \(item)")
            i += 1
        }
    }
    
}

//.. subclass for Prius Model LE AWD-e
class PriusLEAWDe: Prius2020 {
    
    var kamModel: String
    
    override init(model: String, color: CarColor) {
        //self.kamTest2 = 0
        //self.kamModel = model
        self.kamModel = "LE AWD-e"
        super.init(model: "LE AWD-e", color: color)
    }
    
    override func printModColor() {
        super.printModColor()
        print("\nModel LE AWD-e: \(priusModelDictionary[kamModel]?.desc ?? "nf")")
        
        let stdEquip = ["52/48 est. mpg",
                        "Electronic On-Demand Compact All-Wheel Drive (AWD-e)",
                        "Toyota Safety Sense P (TSS-P) standard",
                        "15-in. 5-spoke alloy wheels with two-tone wheel covers and P195/65R15 tires",
                        "Integrated fog lights with LED accent lights",
                        "Up to 24.6 cu. ft. of cargo space"
        ]
        
        var i = 1
        print("\nStandard Equipment:")
        print("................................................................................")
        for item in stdEquip {
            print("\(i). \(item)")
            i += 1
        }
    }
    
}

//.. subclass for Prius Model XLE AWD-e
class PriusXLEAWDe: Prius2020 {
    //    var kamTest: String = "this is a test"
    //var kamTest2: Int
    var kamModel: String
    
    override init(model: String, color: CarColor) {
        //self.kamTest2 = 0
        //self.kamModel = model
        self.kamModel = "XLE AWD-e"
        super.init(model: "XLE AWD-e", color: color)
    }
    
    override func printModColor() {
        super.printModColor()
        print("\n\t\t\tModel XLE AWD-e: \(priusModelDictionary[kamModel]?.desc ?? "nf")")
        
        let stdEquip = ["52/48 est. mpg",
                        "Electronic On-Demand Compact All-Wheel Drive (AWD-e)",
                        "Toyota Safety Sense P (TSS-P) standard",
                        "SofTex®-trimmed heated tilt/telescopic steering wheel",
                        "Qi-compatible wireless smartphone charging with charge indicator light",
                        "SofTex®-trimmed heated front seats with 6-way adjustable driver's seat"
        ]
        
        var i = 1
        print("\nStandard Equipment:")
        print("................................................................................")
        for item in stdEquip {
            print("\(i). \(item)")
            i += 1
        }
    }
    
}

//...............................................................................................
//.. Instatiation and "Calls" to funcions
//..
//.. instantiate subclass for model "L Eco"
var selectLEco2 = PriusLEco(model: "L Eco", color: CarColor.Gray)

//...............................................................................................
//********  GRAY COLOR CAR
//.. adding external accessories
selectLEco2.addExtAcc(extAccName: ExtAcc.BodySM)
selectLEco2.addExtAcc(extAccName: ExtAcc.AlloyWL)
selectLEco2.addExtAcc(extAccName: ExtAcc.AeroSS)
selectLEco2.addIntAcc(intAccName: IntAcc.CarpetCM)
selectLEco2.addIntAcc(intAccName: IntAcc.CoinHAC)
selectLEco2.printModColor()

//...............................................................................................
//********  SEA COLOR CAR
//..adding internal accessories
selectLEco2.addIntAcc(intAccName: IntAcc.AllWFL)
selectLEco2.priusColor = CarColor.Sea.rawValue
selectLEco2.printModColor()

//...............................................................................................
//********  RED COLOR CAR
//..removing internal accessories in the array and add a different one and change the car color
selectLEco2.priusIntAccBuild.removeAll()
selectLEco2.addIntAcc(intAccName: IntAcc.AllWFL)
selectLEco2.priusColor = CarColor.Red.rawValue
selectLEco2.printModColor()

//...............................................................................................
//********  BLUE COLOR CAR
//.. adding accessory packages
//.. clear all accessories and packages
selectLEco2.priusIntAccBuild.removeAll()
selectLEco2.priusExtAccBuild.removeAll()
selectLEco2.priusAccPkgBuild.removeAll()
//.. add internal accessories
selectLEco2.addIntAcc(intAccName: IntAcc.CarpetCM)
selectLEco2.addIntAcc(intAccName: IntAcc.CarpetFM)
selectLEco2.addIntAcc(intAccName: IntAcc.EmergK)
selectLEco2.addIntAcc(intAccName: IntAcc.FirstAK)
//.. add external accessories
selectLEco2.addExtAcc(extAccName: ExtAcc.DoorEG)
selectLEco2.addExtAcc(extAccName: ExtAcc.BlackoutWI)
//.. add accessory packages
selectLEco2.addAccPkg(accPkgName: AccPkgs.CMP) // should also get "rid" of separate accessories CarpetCM, CarpetFM
                                                    //that were "added" previously in lines above
selectLEco2.addAccPkg(accPkgName: AccPkgs.PP3) // should also get "rid" of separate accessories DoorEG
                                                    //that were "added" previously in lines above
//.. change car color
selectLEco2.priusColor = CarColor.Blue.rawValue
//.. call function to print
selectLEco2.printModColor()

//...............................................................................................
//********  PEARL COLOR CAR
//.. attempt to add a few more accessories
selectLEco2.priusColor = CarColor.Pearl.rawValue
selectLEco2.addIntAcc(intAccName: IntAcc.FlessHM)
selectLEco2.addIntAcc(intAccName: IntAcc.CarpetCM) // already part of a package, so should NOT be printed in internal accessories section of rpt
selectLEco2.addIntAcc(intAccName: IntAcc.CarpetFM) // already part of a package, so should NOT be printed in internal accessories section of rpt
selectLEco2.addExtAcc(extAccName: ExtAcc.BodySM)   // already part of a package, so should NOT be printed in internal accessories section of rpt
selectLEco2.addExtAcc(extAccName: ExtAcc.PaintPF)
selectLEco2.printModColor()

//...............................................................................................
//********  PEARL COLOR CAR
//.. attempt to add more packages
selectLEco2.priusColor = CarColor.Black.rawValue
selectLEco2.addExtAcc(extAccName: ExtAcc.DoorEG) // already part of a package, so should NOT be printed in internal accessories section of rpt
selectLEco2.addIntAcc(intAccName: IntAcc.AllWFL) // added but then removed when package on the next line is selected
selectLEco2.addAccPkg(accPkgName: AccPkgs.ALLWFLP) // removes previous AllWFL accessory when this package is added
selectLEco2.addAccPkg(accPkgName: AccPkgs.FSFMLP)
selectLEco2.printModColor()





