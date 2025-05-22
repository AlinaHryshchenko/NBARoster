

import SwiftUI

struct PlayerListView<ViewModel: PlayerListViewModelProtocol>: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(.systemGroupedBackground).ignoresSafeArea()
                
                if viewModel.players.isEmpty && !viewModel.isLoading {
                    Text("No players found")
                        .foregroundColor(.gray)
                        .font(.title2)
                } else {
                    List {
                        ForEach(viewModel.players) { player in
                            Button {
                                viewModel.showDetail(for: player)
                            } label: {
                                VStack(alignment: .leading, spacing: 8) {
                                    HStack {
                                        Text(player.fullName)
                                            .font(.title3)
                                            .bold()
                                        Spacer()
                                    }
                                    HStack {
                                        Text(player.position.isEmpty ? "–" : "Position - \(player.position)")
                                            .font(.subheadline)
                                            .foregroundColor(.secondary)
                                            .padding(6)
                                            .background(Color.blue.opacity(0.1))
                                            .cornerRadius(6)
                                    }
                                    
                                    HStack(spacing: 16) {
                                        
                                        if let height = player.height {
                                            Label("\(height) ft", systemImage: "ruler")
                                        }
                                        if let weight = player.weight {
                                            Label("\(weight) lbs", systemImage: "scalemass")
                                        }
                                    }
                                    .font(.footnote)
                                    .foregroundColor(.secondary)
                                }
                                .padding()
                                .background(Color.white)
                                .cornerRadius(12)
                                .shadow(color: Color.black.opacity(0.05), radius: 6, x: 0, y: 2)
                            }
                            .buttonStyle(PlainButtonStyle())
                            .listRowBackground(Color.clear)
                        }
                    }
                    .listStyle(PlainListStyle())
                }
            }
            .navigationTitle("NBA Players")
            .task {
                await viewModel.loadPlayers()
            }
        }
    }
}
