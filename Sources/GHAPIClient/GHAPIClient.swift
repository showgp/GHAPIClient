public struct GHAPIClient {
    public static let apiClient: IAPIClient = ServerCommunicator()
}

public enum APIError: Error {
    case noData
}
