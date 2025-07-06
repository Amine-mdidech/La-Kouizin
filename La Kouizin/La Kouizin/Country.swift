//
//  Country.swift
//  La Kouizin
//
//  Created by Amine Benchekroun on 24/6/2025.
//

import Foundation

struct CountryData {
    let name: String
    let code: String
    let flag: String
}

enum Country: String, CaseIterable, Codable {
    case afghanistan = "AF"
    case albania = "AL"
    case algeria = "DZ"
    case andorra = "AD"
    case angola = "AO"
    case antiguaAndBarbuda = "AG"
    case argentina = "AR"
    case armenia = "AM"
    case australia = "AU"
    case austria = "AT"
    case azerbaijan = "AZ"
    case bahamas = "BS"
    case bahrain = "BH"
    case bangladesh = "BD"
    case barbados = "BB"
    case belarus = "BY"
    case belgium = "BE"
    case belize = "BZ"
    case benin = "BJ"
    case bhutan = "BT"
    case bolivia = "BO"
    case bosniaAndHerzegovina = "BA"
    case botswana = "BW"
    case brazil = "BR"
    case brunei = "BN"
    case bulgaria = "BG"
    case burkinaFaso = "BF"
    case burundi = "BI"
    case cambodia = "KH"
    case cameroon = "CM"
    case canada = "CA"
    case capeVerde = "CV"
    case centralAfricanRepublic = "CF"
    case chad = "TD"
    case chile = "CL"
    case china = "CN"
    case colombia = "CO"
    case comoros = "KM"
    case congoBrazzaville = "CG"
    case congoKinshasa = "CD"
    case costaRica = "CR"
    case croatia = "HR"
    case cuba = "CU"
    case cyprus = "CY"
    case czechia = "CZ"
    case denmark = "DK"
    case djibouti = "DJ"
    case dominica = "DM"
    case dominicanRepublic = "DO"
    case ecuador = "EC"
    case egypt = "EG"
    case elSalvador = "SV"
    case equatorialGuinea = "GQ"
    case eritrea = "ER"
    case estonia = "EE"
    case eswatini = "SZ"
    case ethiopia = "ET"
    case fiji = "FJ"
    case finland = "FI"
    case france = "FR"
    case gabon = "GA"
    case gambia = "GM"
    case georgia = "GE"
    case germany = "DE"
    case ghana = "GH"
    case greece = "GR"
    case grenada = "GD"
    case guatemala = "GT"
    case guinea = "GN"
    case guineaBissau = "GW"
    case guyana = "GY"
    case haiti = "HT"
    case honduras = "HN"
    case hungary = "HU"
    case iceland = "IS"
    case india = "IN"
    case indonesia = "ID"
    case iran = "IR"
    case iraq = "IQ"
    case ireland = "IE"
    case israel = "IL"
    case italy = "IT"
    case ivoryCoast = "CI"
    case jamaica = "JM"
    case japan = "JP"
    case jordan = "JO"
    case kazakhstan = "KZ"
    case kenya = "KE"
    case kiribati = "KI"
    case kosovo = "XK"
    case kuwait = "KW"
    case kyrgyzstan = "KG"
    case laos = "LA"
    case latvia = "LV"
    case lebanon = "LB"
    case lesotho = "LS"
    case liberia = "LR"
    case libya = "LY"
    case liechtenstein = "LI"
    case lithuania = "LT"
    case luxembourg = "LU"
    case madagascar = "MG"
    case malawi = "MW"
    case malaysia = "MY"
    case maldives = "MV"
    case mali = "ML"
    case malta = "MT"
    case marshallIslands = "MH"
    case mauritania = "MR"
    case mauritius = "MU"
    case mexico = "MX"
    case micronesia = "FM"
    case moldova = "MD"
    case monaco = "MC"
    case mongolia = "MN"
    case montenegro = "ME"
    case morocco = "MA"
    case mozambique = "MZ"
    case myanmar = "MM"
    case namibia = "NA"
    case nauru = "NR"
    case nepal = "NP"
    case netherlands = "NL"
    case newZealand = "NZ"
    case nicaragua = "NI"
    case niger = "NE"
    case nigeria = "NG"
    case northKorea = "KP"
    case northMacedonia = "MK"
    case norway = "NO"
    case oman = "OM"
    case pakistan = "PK"
    case palau = "PW"
    case palestine = "PS"
    case panama = "PA"
    case papuaNewGuinea = "PG"
    case paraguay = "PY"
    case peru = "PE"
    case philippines = "PH"
    case poland = "PL"
    case portugal = "PT"
    case qatar = "QA"
    case romania = "RO"
    case russia = "RU"
    case rwanda = "RW"
    case saintKittsAndNevis = "KN"
    case saintLucia = "LC"
    case saintVincentAndTheGrenadines = "VC"
    case samoa = "WS"
    case sanMarino = "SM"
    case saoTomeAndPrincipe = "ST"
    case saudiArabia = "SA"
    case senegal = "SN"
    case serbia = "RS"
    case seychelles = "SC"
    case sierraLeone = "SL"
    case singapore = "SG"
    case slovakia = "SK"
    case slovenia = "SI"
    case solomonIslands = "SB"
    case somalia = "SO"
    case southAfrica = "ZA"
    case southKorea = "KR"
    case southSudan = "SS"
    case spain = "ES"
    case sriLanka = "LK"
    case sudan = "SD"
    case suriname = "SR"
    case sweden = "SE"
    case switzerland = "CH"
    case syria = "SY"
    case taiwan = "TW"
    case tajikistan = "TJ"
    case tanzania = "TZ"
    case thailand = "TH"
    case timorLeste = "TL"
    case togo = "TG"
    case tonga = "TO"
    case trinidadAndTobago = "TT"
    case tunisia = "TN"
    case turkey = "TR"
    case turkmenistan = "TM"
    case tuvalu = "TV"
    case uganda = "UG"
    case ukraine = "UA"
    case unitedArabEmirates = "AE"
    case unitedKingdom = "GB"
    case unitedStates = "US"
    case uruguay = "UY"
    case uzbekistan = "UZ"
    case vanuatu = "VU"
    case vatican = "VA"
    case venezuela = "VE"
    case vietnam = "VN"
    case yemen = "YE"
    case zambia = "ZM"
    case zimbabwe = "ZW"
    
    var data: CountryData {
        switch self {
        case .afghanistan: return CountryData(name: "Afghanistan", code: "AF", flag: "🇦🇫")
        case .albania: return CountryData(name: "Albania", code: "AL", flag: "🇦🇱")
        case .algeria: return CountryData(name: "Algeria", code: "DZ", flag: "🇩🇿")
        case .andorra: return CountryData(name: "Andorra", code: "AD", flag: "🇦🇩")
        case .angola: return CountryData(name: "Angola", code: "AO", flag: "🇦🇴")
        case .antiguaAndBarbuda: return CountryData(name: "Antigua and Barbuda", code: "AG", flag: "🇦🇬")
        case .argentina: return CountryData(name: "Argentina", code: "AR", flag: "🇦🇷")
        case .armenia: return CountryData(name: "Armenia", code: "AM", flag: "🇦🇲")
        case .australia: return CountryData(name: "Australia", code: "AU", flag: "🇦🇺")
        case .austria: return CountryData(name: "Austria", code: "AT", flag: "🇦🇹")
        case .azerbaijan: return CountryData(name: "Azerbaijan", code: "AZ", flag: "🇦🇿")
        case .bahamas: return CountryData(name: "Bahamas", code: "BS", flag: "🇧🇸")
        case .bahrain: return CountryData(name: "Bahrain", code: "BH", flag: "🇧🇭")
        case .bangladesh: return CountryData(name: "Bangladesh", code: "BD", flag: "🇧🇩")
        case .barbados: return CountryData(name: "Barbados", code: "BB", flag: "🇧🇧")
        case .belarus: return CountryData(name: "Belarus", code: "BY", flag: "🇧🇾")
        case .belgium: return CountryData(name: "Belgium", code: "BE", flag: "🇧🇪")
        case .belize: return CountryData(name: "Belize", code: "BZ", flag: "🇧🇿")
        case .benin: return CountryData(name: "Benin", code: "BJ", flag: "🇧🇯")
        case .bhutan: return CountryData(name: "Bhutan", code: "BT", flag: "🇧🇹")
        case .bolivia: return CountryData(name: "Bolivia", code: "BO", flag: "🇧🇴")
        case .bosniaAndHerzegovina: return CountryData(name: "Bosnia and Herzegovina", code: "BA", flag: "🇧🇦")
        case .botswana: return CountryData(name: "Botswana", code: "BW", flag: "🇧🇼")
        case .brazil: return CountryData(name: "Brazil", code: "BR", flag: "🇧🇷")
        case .brunei: return CountryData(name: "Brunei", code: "BN", flag: "🇧🇳")
        case .bulgaria: return CountryData(name: "Bulgaria", code: "BG", flag: "🇧🇬")
        case .burkinaFaso: return CountryData(name: "Burkina Faso", code: "BF", flag: "🇧🇫")
        case .burundi: return CountryData(name: "Burundi", code: "BI", flag: "🇧🇮")
        case .cambodia: return CountryData(name: "Cambodia", code: "KH", flag: "🇰🇭")
        case .cameroon: return CountryData(name: "Cameroon", code: "CM", flag: "🇨🇲")
        case .canada: return CountryData(name: "Canada", code: "CA", flag: "🇨🇦")
        case .capeVerde: return CountryData(name: "Cape Verde", code: "CV", flag: "🇨🇻")
        case .centralAfricanRepublic: return CountryData(name: "Central African Republic", code: "CF", flag: "🇨🇫")
        case .chad: return CountryData(name: "Chad", code: "TD", flag: "🇹🇩")
        case .chile: return CountryData(name: "Chile", code: "CL", flag: "🇨🇱")
        case .china: return CountryData(name: "China", code: "CN", flag: "🇨🇳")
        case .colombia: return CountryData(name: "Colombia", code: "CO", flag: "🇨🇴")
        case .comoros: return CountryData(name: "Comoros", code: "KM", flag: "🇰🇲")
        case .congoBrazzaville: return CountryData(name: "Congo (Brazzaville)", code: "CG", flag: "🇨🇬")
        case .congoKinshasa: return CountryData(name: "Congo (Kinshasa)", code: "CD", flag: "🇨🇩")
        case .costaRica: return CountryData(name: "Costa Rica", code: "CR", flag: "🇨🇷")
        case .croatia: return CountryData(name: "Croatia", code: "HR", flag: "🇭🇷")
        case .cuba: return CountryData(name: "Cuba", code: "CU", flag: "🇨🇺")
        case .cyprus: return CountryData(name: "Cyprus", code: "CY", flag: "🇨🇾")
        case .czechia: return CountryData(name: "Czechia", code: "CZ", flag: "🇨🇿")
        case .denmark: return CountryData(name: "Denmark", code: "DK", flag: "🇩🇰")
        case .djibouti: return CountryData(name: "Djibouti", code: "DJ", flag: "🇩🇯")
        case .dominica: return CountryData(name: "Dominica", code: "DM", flag: "🇩🇲")
        case .dominicanRepublic: return CountryData(name: "Dominican Republic", code: "DO", flag: "🇩🇴")
        case .ecuador: return CountryData(name: "Ecuador", code: "EC", flag: "🇪🇨")
        case .egypt: return CountryData(name: "Egypt", code: "EG", flag: "🇪🇬")
        case .elSalvador: return CountryData(name: "El Salvador", code: "SV", flag: "🇸🇻")
        case .equatorialGuinea: return CountryData(name: "Equatorial Guinea", code: "GQ", flag: "🇬🇶")
        case .eritrea: return CountryData(name: "Eritrea", code: "ER", flag: "🇪🇷")
        case .estonia: return CountryData(name: "Estonia", code: "EE", flag: "🇪🇪")
        case .eswatini: return CountryData(name: "Eswatini", code: "SZ", flag: "🇸🇿")
        case .ethiopia: return CountryData(name: "Ethiopia", code: "ET", flag: "🇪🇹")
        case .fiji: return CountryData(name: "Fiji", code: "FJ", flag: "🇫🇯")
        case .finland: return CountryData(name: "Finland", code: "FI", flag: "🇫🇮")
        case .france: return CountryData(name: "France", code: "FR", flag: "🇫🇷")
        case .gabon: return CountryData(name: "Gabon", code: "GA", flag: "🇬🇦")
        case .gambia: return CountryData(name: "Gambia", code: "GM", flag: "🇬🇲")
        case .georgia: return CountryData(name: "Georgia", code: "GE", flag: "🇬🇪")
        case .germany: return CountryData(name: "Germany", code: "DE", flag: "🇩🇪")
        case .ghana: return CountryData(name: "Ghana", code: "GH", flag: "🇬🇭")
        case .greece: return CountryData(name: "Greece", code: "GR", flag: "🇬🇷")
        case .grenada: return CountryData(name: "Grenada", code: "GD", flag: "🇬🇩")
        case .guatemala: return CountryData(name: "Guatemala", code: "GT", flag: "🇬🇹")
        case .guinea: return CountryData(name: "Guinea", code: "GN", flag: "🇬🇳")
        case .guineaBissau: return CountryData(name: "Guinea-Bissau", code: "GW", flag: "🇬🇼")
        case .guyana: return CountryData(name: "Guyana", code: "GY", flag: "🇬🇾")
        case .haiti: return CountryData(name: "Haiti", code: "HT", flag: "🇭🇹")
        case .honduras: return CountryData(name: "Honduras", code: "HN", flag: "🇭🇳")
        case .hungary: return CountryData(name: "Hungary", code: "HU", flag: "🇭🇺")
        case .iceland: return CountryData(name: "Iceland", code: "IS", flag: "🇮🇸")
        case .india: return CountryData(name: "India", code: "IN", flag: "🇮🇳")
        case .indonesia: return CountryData(name: "Indonesia", code: "ID", flag: "🇮🇩")
        case .iran: return CountryData(name: "Iran", code: "IR", flag: "🇮🇷")
        case .iraq: return CountryData(name: "Iraq", code: "IQ", flag: "🇮🇶")
        case .ireland: return CountryData(name: "Ireland", code: "IE", flag: "🇮🇪")
        case .israel: return CountryData(name: "Israel", code: "IL", flag: "🇮🇱")
        case .italy: return CountryData(name: "Italy", code: "IT", flag: "🇮🇹")
        case .ivoryCoast: return CountryData(name: "Ivory Coast", code: "CI", flag: "🇨🇮")
        case .jamaica: return CountryData(name: "Jamaica", code: "JM", flag: "🇯🇲")
        case .japan: return CountryData(name: "Japan", code: "JP", flag: "🇯🇵")
        case .jordan: return CountryData(name: "Jordan", code: "JO", flag: "🇯🇴")
        case .kazakhstan: return CountryData(name: "Kazakhstan", code: "KZ", flag: "🇰🇿")
        case .kenya: return CountryData(name: "Kenya", code: "KE", flag: "🇰🇪")
        case .kiribati: return CountryData(name: "Kiribati", code: "KI", flag: "🇰🇮")
        case .kosovo: return CountryData(name: "Kosovo", code: "XK", flag: "🇽🇰")
        case .kuwait: return CountryData(name: "Kuwait", code: "KW", flag: "🇰🇼")
        case .kyrgyzstan: return CountryData(name: "Kyrgyzstan", code: "KG", flag: "🇰🇬")
        case .laos: return CountryData(name: "Laos", code: "LA", flag: "🇱🇦")
        case .latvia: return CountryData(name: "Latvia", code: "LV", flag: "🇱🇻")
        case .lebanon: return CountryData(name: "Lebanon", code: "LB", flag: "🇱🇧")
        case .lesotho: return CountryData(name: "Lesotho", code: "LS", flag: "🇱🇸")
        case .liberia: return CountryData(name: "Liberia", code: "LR", flag: "🇱🇷")
        case .libya: return CountryData(name: "Libya", code: "LY", flag: "🇱🇾")
        case .liechtenstein: return CountryData(name: "Liechtenstein", code: "LI", flag: "🇱🇮")
        case .lithuania: return CountryData(name: "Lithuania", code: "LT", flag: "🇱🇹")
        case .luxembourg: return CountryData(name: "Luxembourg", code: "LU", flag: "🇱🇺")
        case .madagascar: return CountryData(name: "Madagascar", code: "MG", flag: "🇲🇬")
        case .malawi: return CountryData(name: "Malawi", code: "MW", flag: "🇲🇼")
        case .malaysia: return CountryData(name: "Malaysia", code: "MY", flag: "🇲🇾")
        case .maldives: return CountryData(name: "Maldives", code: "MV", flag: "🇲🇻")
        case .mali: return CountryData(name: "Mali", code: "ML", flag: "🇲🇱")
        case .malta: return CountryData(name: "Malta", code: "MT", flag: "🇲🇹")
        case .marshallIslands: return CountryData(name: "Marshall Islands", code: "MH", flag: "🇲🇭")
        case .mauritania: return CountryData(name: "Mauritania", code: "MR", flag: "🇲🇷")
        case .mauritius: return CountryData(name: "Mauritius", code: "MU", flag: "🇲🇺")
        case .mexico: return CountryData(name: "Mexico", code: "MX", flag: "🇲🇽")
        case .micronesia: return CountryData(name: "Micronesia", code: "FM", flag: "🇫🇲")
        case .moldova: return CountryData(name: "Moldova", code: "MD", flag: "🇲🇩")
        case .monaco: return CountryData(name: "Monaco", code: "MC", flag: "🇲🇨")
        case .mongolia: return CountryData(name: "Mongolia", code: "MN", flag: "🇲🇳")
        case .montenegro: return CountryData(name: "Montenegro", code: "ME", flag: "🇲🇪")
        case .morocco: return CountryData(name: "Morocco", code: "MA", flag: "🇲🇦")
        case .mozambique: return CountryData(name: "Mozambique", code: "MZ", flag: "🇲🇿")
        case .myanmar: return CountryData(name: "Myanmar", code: "MM", flag: "🇲🇲")
        case .namibia: return CountryData(name: "Namibia", code: "NA", flag: "🇳🇦")
        case .nauru: return CountryData(name: "Nauru", code: "NR", flag: "🇳🇷")
        case .nepal: return CountryData(name: "Nepal", code: "NP", flag: "🇳🇵")
        case .netherlands: return CountryData(name: "Netherlands", code: "NL", flag: "🇳🇱")
        case .newZealand: return CountryData(name: "New Zealand", code: "NZ", flag: "🇳🇿")
        case .nicaragua: return CountryData(name: "Nicaragua", code: "NI", flag: "🇳🇮")
        case .niger: return CountryData(name: "Niger", code: "NE", flag: "🇳🇪")
        case .nigeria: return CountryData(name: "Nigeria", code: "NG", flag: "🇳🇬")
        case .northKorea: return CountryData(name: "North Korea", code: "KP", flag: "🇰🇵")
        case .northMacedonia: return CountryData(name: "North Macedonia", code: "MK", flag: "🇲🇰")
        case .norway: return CountryData(name: "Norway", code: "NO", flag: "🇳🇴")
        case .oman: return CountryData(name: "Oman", code: "OM", flag: "🇴🇲")
        case .pakistan: return CountryData(name: "Pakistan", code: "PK", flag: "🇵🇰")
        case .palau: return CountryData(name: "Palau", code: "PW", flag: "🇵🇼")
        case .palestine: return CountryData(name: "Palestine", code: "PS", flag: "🇵🇸")
        case .panama: return CountryData(name: "Panama", code: "PA", flag: "🇵🇦")
        case .papuaNewGuinea: return CountryData(name: "Papua New Guinea", code: "PG", flag: "🇵🇬")
        case .paraguay: return CountryData(name: "Paraguay", code: "PY", flag: "🇵🇾")
        case .peru: return CountryData(name: "Peru", code: "PE", flag: "🇵🇪")
        case .philippines: return CountryData(name: "Philippines", code: "PH", flag: "🇵🇭")
        case .poland: return CountryData(name: "Poland", code: "PL", flag: "🇵🇱")
        case .portugal: return CountryData(name: "Portugal", code: "PT", flag: "🇵🇹")
        case .qatar: return CountryData(name: "Qatar", code: "QA", flag: "🇶🇦")
        case .romania: return CountryData(name: "Romania", code: "RO", flag: "🇷🇴")
        case .russia: return CountryData(name: "Russia", code: "RU", flag: "🇷🇺")
        case .rwanda: return CountryData(name: "Rwanda", code: "RW", flag: "🇷🇼")
        case .saintKittsAndNevis: return CountryData(name: "Saint Kitts and Nevis", code: "KN", flag: "🇰🇳")
        case .saintLucia: return CountryData(name: "Saint Lucia", code: "LC", flag: "🇱🇨")
        case .saintVincentAndTheGrenadines: return CountryData(name: "Saint Vincent and the Grenadines", code: "VC", flag: "🇻🇨")
        case .samoa: return CountryData(name: "Samoa", code: "WS", flag: "🇼🇸")
        case .sanMarino: return CountryData(name: "San Marino", code: "SM", flag: "🇸🇲")
        case .saoTomeAndPrincipe: return CountryData(name: "São Tomé and Príncipe", code: "ST", flag: "🇸🇹")
        case .saudiArabia: return CountryData(name: "Saudi Arabia", code: "SA", flag: "🇸🇦")
        case .senegal: return CountryData(name: "Senegal", code: "SN", flag: "🇸🇳")
        case .serbia: return CountryData(name: "Serbia", code: "RS", flag: "🇷🇸")
        case .seychelles: return CountryData(name: "Seychelles", code: "SC", flag: "🇸🇨")
        case .sierraLeone: return CountryData(name: "Sierra Leone", code: "SL", flag: "🇸🇱")
        case .singapore: return CountryData(name: "Singapore", code: "SG", flag: "🇸🇬")
        case .slovakia: return CountryData(name: "Slovakia", code: "SK", flag: "🇸🇰")
        case .slovenia: return CountryData(name: "Slovenia", code: "SI", flag: "🇸🇮")
        case .solomonIslands: return CountryData(name: "Solomon Islands", code: "SB", flag: "🇸🇧")
        case .somalia: return CountryData(name: "Somalia", code: "SO", flag: "🇸🇴")
        case .southAfrica: return CountryData(name: "South Africa", code: "ZA", flag: "🇿🇦")
        case .southKorea: return CountryData(name: "South Korea", code: "KR", flag: "🇰🇷")
        case .southSudan: return CountryData(name: "South Sudan", code: "SS", flag: "🇸🇸")
        case .spain: return CountryData(name: "Spain", code: "ES", flag: "🇪🇸")
        case .sriLanka: return CountryData(name: "Sri Lanka", code: "LK", flag: "🇱🇰")
        case .sudan: return CountryData(name: "Sudan", code: "SD", flag: "🇸🇩")
        case .suriname: return CountryData(name: "Suriname", code: "SR", flag: "🇸🇷")
        case .sweden: return CountryData(name: "Sweden", code: "SE", flag: "🇸🇪")
        case .switzerland: return CountryData(name: "Switzerland", code: "CH", flag: "🇨🇭")
        case .syria: return CountryData(name: "Syria", code: "SY", flag: "🇸🇾")
        case .taiwan: return CountryData(name: "Taiwan", code: "TW", flag: "🇹🇼")
        case .tajikistan: return CountryData(name: "Tajikistan", code: "TJ", flag: "🇹🇯")
        case .tanzania: return CountryData(name: "Tanzania", code: "TZ", flag: "🇹🇿")
        case .thailand: return CountryData(name: "Thailand", code: "TH", flag: "🇹🇭")
        case .timorLeste: return CountryData(name: "Timor-Leste", code: "TL", flag: "🇹🇱")
        case .togo: return CountryData(name: "Togo", code: "TG", flag: "🇹🇬")
        case .tonga: return CountryData(name: "Tonga", code: "TO", flag: "🇹🇴")
        case .trinidadAndTobago: return CountryData(name: "Trinidad and Tobago", code: "TT", flag: "🇹🇹")
        case .tunisia: return CountryData(name: "Tunisia", code: "TN", flag: "🇹🇳")
        case .turkey: return CountryData(name: "Turkey", code: "TR", flag: "🇹🇷")
        case .turkmenistan: return CountryData(name: "Turkmenistan", code: "TM", flag: "🇹🇲")
        case .tuvalu: return CountryData(name: "Tuvalu", code: "TV", flag: "🇹🇻")
        case .uganda: return CountryData(name: "Uganda", code: "UG", flag: "🇺🇬")
        case .ukraine: return CountryData(name: "Ukraine", code: "UA", flag: "🇺🇦")
        case .unitedArabEmirates: return CountryData(name: "United Arab Emirates", code: "AE", flag: "🇦🇪")
        case .unitedKingdom: return CountryData(name: "United Kingdom", code: "GB", flag: "🇬🇧")
        case .unitedStates: return CountryData(name: "United States", code: "US", flag: "🇺🇸")
        case .uruguay: return CountryData(name: "Uruguay", code: "UY", flag: "🇺🇾")
        case .uzbekistan: return CountryData(name: "Uzbekistan", code: "UZ", flag: "🇺🇿")
        case .vanuatu: return CountryData(name: "Vanuatu", code: "VU", flag: "🇻🇺")
        case .vatican: return CountryData(name: "Vatican City", code: "VA", flag: "🇻🇦")
        case .venezuela: return CountryData(name: "Venezuela", code: "VE", flag: "🇻🇪")
        case .vietnam: return CountryData(name: "Vietnam", code: "VN", flag: "🇻🇳")
        case .yemen: return CountryData(name: "Yemen", code: "YE", flag: "🇾🇪")
        case .zambia: return CountryData(name: "Zambia", code: "ZM", flag: "🇿🇲")
        case .zimbabwe: return CountryData(name: "Zimbabwe", code: "ZW", flag: "🇿🇼")
        }
    }
    
    var name: String { data.name }
    var code: String { data.code }
    var flag: String { data.flag }
    
    static var allCountriesData: [CountryData] {
        return Country.allCases.map { $0.data }
    }
    
    static func findCountryByCode(from code: String) -> Country? {
        return Country.allCases.first { $0.rawValue == code.uppercased() }
    }
    
    static func findCountryByName(named name: String) -> Country? {
        return Country.allCases.first { $0.name.lowercased() == name.lowercased() }
    }
}

// MARK: - Usage Examples
extension Country {
    static func exampleUsage() {
        // Get all countries
        let allCountries = Country.allCases
        print("Total countries: \(allCountries.count)")
        
        // Access country data
        let morocco = Country.morocco
        print("Country: \(morocco.name) (\(morocco.code)) \(morocco.flag)")
        
        // Find country by code
        if let country = Country.findCountryByCode(from: "MA") {
            print("Found: \(country.name)")
        }
        
        // Find country by name
        if let country = Country.findCountryByName(named: "Morocco") {
            print("Found: \(country.name)")
        }
        
        // Get all countries data for picker
        let countriesData = Country.allCountriesData
        print("Countries for picker: \(countriesData.count) items")
        
        // Sort countries alphabetically
        let sortedCountries = Country.allCases.sorted { $0.name < $1.name }
        print("First country alphabetically: \(sortedCountries.first?.name ?? "None")")
    }
}
