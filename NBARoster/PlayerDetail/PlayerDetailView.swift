

import SwiftUI

struct PlayerDetailView<ViewModel: PlayerDetailViewModelProtocol>: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        VStack(spacing: 24) {
            VStack(spacing: 8) {
                Text(viewModel.player.fullName)
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.center)
                
                Text(viewModel.player.position.isEmpty ? "Position: –" : "Position: \(viewModel.player.position)")
                    .font(.headline)
                    .foregroundColor(.secondary)
            }
            
            Divider()
            
            VStack(spacing: 12) {
                if let height = viewModel.player.height {
                    HStack {
                        Image(systemName: "ruler")
                        Text("Height: \(height) ft")
                        Spacer()
                    }
                }
                
                if let weight = viewModel.player.weight {
                    HStack {
                        Image(systemName: "scalemass")
                        Text("Weight: \(weight) lbs")
                        Spacer()
                    }
                }
            }
            .font(.body)
            .padding(.horizontal)
            
            Spacer()
        }
        .padding()
        .background(Color(.systemGroupedBackground))
        .navigationTitle("Player Info")
    }
}
