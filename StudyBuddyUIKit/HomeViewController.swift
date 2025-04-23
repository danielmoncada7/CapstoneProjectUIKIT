import UIKit

// Model matching the API‑Ninjas JSON
struct NinjaQuote: Codable {
    let quote: String
    let author: String
    // category, etc. are ignored
}

class HomeViewController: UIViewController {
    @IBOutlet weak var quoteLabel: UILabel!

    private let apiKey = "zQkfsjfZ0IxpsJ0jt79PTg==CQ5FVdcEdNsyBANg"

    override func viewDidLoad() {
        super.viewDidLoad()
        quoteLabel.text = "Loading quote…"
        fetchNinjaQuote()
    }

    func fetchNinjaQuote() {
        guard let url = URL(string: "https://api.api-ninjas.com/v1/quotes") else { return }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(apiKey, forHTTPHeaderField: "X-Api-Key")

        URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil, let data = data else {
                DispatchQueue.main.async {
                    self.quoteLabel.text = "Failed to load quote."
                }
                return
            }
            do {
                let quotes = try JSONDecoder().decode([NinjaQuote].self, from: data)
                if let first = quotes.first {
                    DispatchQueue.main.async {
                        self.quoteLabel.text = "\"\(first.quote)\"\n— \(first.author)"
                    }
                } else {
                    DispatchQueue.main.async {
                        self.quoteLabel.text = "No quote found."
                    }
                }
            } catch {
                DispatchQueue.main.async {
                    self.quoteLabel.text = "Parsing error."
                }
            }
        }.resume()
    }
}
