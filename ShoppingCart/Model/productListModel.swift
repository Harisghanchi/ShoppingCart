

import Foundation

// MARK: - Welcome
struct productListModel: Codable {
    let success: Int?
    let error: [JSONAny]?
    let data: DataClass?
}

// MARK: - DataClass
struct DataClass: Codable {
    let cart: Cart?
    let recommendedProducts: RecommendedProducts?

    enum CodingKeys: String, CodingKey {
        case cart
        case recommendedProducts = "recommended_products"
    }
}

// MARK: - Cart
struct Cart: Codable {
    let products: [CartProduct]?
    let vouchers: [JSONAny]?
    let couponStatus, coupon: String?
    let voucherStatus: JSONNull?
    let voucher: String?
    let rewardStatus: Int?
    let reward: String?
    let totals: [Total]?
    let offer: String?
    let offerAverage: Int?
    let total: String?
    let totalRaw: Double?
    let totalProductCount: Int?

    enum CodingKeys: String, CodingKey {
        case products, vouchers
        case couponStatus = "coupon_status"
        case coupon
        case voucherStatus = "voucher_status"
        case voucher
        case rewardStatus = "reward_status"
        case reward, totals, offer
        case offerAverage = "offer_average"
        case total
        case totalRaw = "total_raw"
        case totalProductCount = "total_product_count"
    }
}

// MARK: - CartProduct
struct CartProduct: Codable {
    let key: String?
    let thumb: String?
    let name, productID, categoryID, manufacturerName: String?
    let model: JSONNull?
    let option: [JSONAny]?
    let quantity, minimum, maximum: String?
    let stock: Bool?
    let reward: String?
    let priceNoTax: Int?
    let priceNoTaxFormatted, price, priceFormatted, total: String?
    let totalFormatted: String?
    let avaialbleQuantity: Int?
    let crossDiscount: JSONNull?
    let enName, eventPrice: String?
    let special: [PurpleSpecial]?
    let categoryHierarchy: [PurpleCategoryHierarchy]?

    enum CodingKeys: String, CodingKey {
        case key, thumb, name
        case productID = "product_id"
        case categoryID = "category_id"
        case manufacturerName = "manufacturer_name"
        case model, option, quantity, minimum, maximum, stock, reward
        case priceNoTax = "price_no_tax"
        case priceNoTaxFormatted = "price_no_tax_formatted"
        case price
        case priceFormatted = "price_formatted"
        case total
        case totalFormatted = "total_formatted"
        case avaialbleQuantity = "avaialble_quantity"
        case crossDiscount = "cross_discount"
        case enName = "en_name"
        case eventPrice = "event_price"
        case special
        case categoryHierarchy = "category_hierarchy"
    }
}

// MARK: - PurpleCategoryHierarchy
struct PurpleCategoryHierarchy: Codable {
    let categoryID, name, enName: String?

    enum CodingKeys: String, CodingKey {
        case categoryID = "category_id"
        case name
        case enName = "en_name"
    }
}

// MARK: - PurpleSpecial
struct PurpleSpecial: Codable {
    let discountRatio, originalPrice, priceFormated: String?
    let originalPriceWithoutCurrency, priceWithoutCurrency: Double?

    enum CodingKeys: String, CodingKey {
        case discountRatio = "discount_ratio"
        case originalPrice = "original_price"
        case priceFormated = "price_formated"
        case originalPriceWithoutCurrency, priceWithoutCurrency
    }
}

// MARK: - Total
struct Total: Codable {
    let title, text, value, code: String?
}

// MARK: - RecommendedProducts
struct RecommendedProducts: Codable {
    let products: [RecommendedProductsProduct]?
    let ad: Ad?

    enum CodingKeys: String, CodingKey {
        case products
        case ad = "Ad"
    }
}

// MARK: - Ad
struct Ad: Codable {
    let filters: [JSONAny]?
}

// MARK: - RecommendedProductsProduct
struct RecommendedProductsProduct: Codable {
    let id: String?
    let thumb: String?
    let priceFormated, priceWithoutCurrency: String?
    let price: Double?
    let name, enName, description, sku: String?
    let isbn: Isbn?
    let hasOption: Bool?
    let categoryID, quantity: Int?
    let special: [FluffySpecial]?
    let manufacturer: String?
    let isNew, isExclusive: Bool?
    let order: Int?
    let score: JSONNull?
    let eventPrice: String?
    let rating: Double?
    let totalReviews: String?
    let seoURLAr, seoURLEn: String?
    let shareURL: ShareURL?
    let options: [Option]?
    let categoryHierarchy: [FluffyCategoryHierarchy]?
    let tag: Tag?

    enum CodingKeys: String, CodingKey {
        case id, thumb
        case priceFormated = "price_formated"
        case priceWithoutCurrency, price, name
        case enName = "en_name"
        case description, sku, isbn
        case hasOption = "has_option"
        case categoryID = "category_id"
        case quantity, special, manufacturer
        case isNew = "is_new"
        case isExclusive = "is_exclusive"
        case order, score
        case eventPrice = "event_price"
        case rating
        case totalReviews = "total_reviews"
        case seoURLAr = "seo_url_ar"
        case seoURLEn = "seo_url_en"
        case shareURL = "share_url"
        case options
        case categoryHierarchy = "category_hierarchy"
        case tag
    }
}

// MARK: - FluffyCategoryHierarchy
struct FluffyCategoryHierarchy: Codable {
    let categoryID: Int?
    let name, enName: String?

    enum CodingKeys: String, CodingKey {
        case categoryID = "category_id"
        case name
        case enName = "en_name"
    }
}

enum Isbn: String, Codable {
    case empty = ""
    case the607845012375 = "607845012375"
    case the8681217213173 = "8681217213173"
}

// MARK: - Option
struct Option: Codable {
    let optionID, productOptionID: Int?
    let type: String?
    let optionRequired: Int?
    let name, enName: String?
    let optionValue: [OptionValue]?

    enum CodingKeys: String, CodingKey {
        case optionID = "option_id"
        case productOptionID = "product_option_id"
        case type
        case optionRequired = "required"
        case name
        case enName = "en_name"
        case optionValue = "option_value"
    }
}

// MARK: - OptionValue
struct OptionValue: Codable {
    let productOptionVariantID, quantity: Int?
    let image: String?
    let hexColor, sku, price: String?
    let priceFormated: PriceFormated?
    let eventPrice, name, enName: String?

    enum CodingKeys: String, CodingKey {
        case productOptionVariantID = "product_option_variant_id"
        case quantity, image
        case hexColor = "hex_color"
        case sku, price
        case priceFormated = "price_formated"
        case eventPrice = "event_price"
        case name
        case enName = "en_name"
    }
}

enum PriceFormated: String, Codable {
    case sar0 = "SAR 0"
    case sar17825 = "SAR 178.25"
    case sar5520 = "SAR 55.20"
}

enum ShareURL: String, Codable {
    case empty = "-"
}

// MARK: - FluffySpecial
struct FluffySpecial: Codable {
    let discountRatio, originalPrice, priceFormated: String?
    let originalPriceWithoutCurrency: Double?
    let priceWithoutCurrency, dateStart, dateEnd: Int?
    let tagName, tagColor: String?

    enum CodingKeys: String, CodingKey {
        case discountRatio = "discount_ratio"
        case originalPrice = "original_price"
        case priceFormated = "price_formated"
        case originalPriceWithoutCurrency, priceWithoutCurrency
        case dateStart = "date_start"
        case dateEnd = "date_end"
        case tagName = "tag_name"
        case tagColor = "tag_color"
    }
}

// MARK: - Tag
struct Tag: Codable {
    let text, backgroundColor: String?

    enum CodingKeys: String, CodingKey {
        case text
        case backgroundColor = "background_color"
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}

