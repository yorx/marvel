protocol DomainModel { }

extension Array: DomainModel where Element: DomainModel {}
extension Optional: DomainModel where Wrapped: DomainModel {}
