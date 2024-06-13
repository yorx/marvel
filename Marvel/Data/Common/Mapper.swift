import Foundation

protocol DomainMapper {
    associatedtype Mappeable
    associatedtype DomainObject: DomainModel
    static func toDomain(_ model: Mappeable) -> DomainObject
}
