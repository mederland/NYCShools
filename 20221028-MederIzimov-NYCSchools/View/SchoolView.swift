//
//  SchoolView.swift
//  20221028-MederIzimov-NYCSchools
//
//  Created by Consultant on 10/29/22.
//

import SwiftUI

@available(iOS 16.0, *)
struct SchoolView: View {
    @ObservedObject var viewModel: SchoolViewModel

    var body: some View {
        GeometryReader { geo in
            ZStack{
                Image("School")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
                    .opacity(1.0)
                VStack(spacing: 0) {
                    HStack{
                        Spacer()
                    }
                    Spacer(minLength: 40)

                    ScrollView {
                        ForEach(viewModel.schools) { school in
                            Button {
                                viewModel.selectSchoolIntent(model: school)
                            }
                        label: {
                                schoolCell(viewModel.name(for: school), viewModel.dbn(for: school))
                            }
                        }
                        .padding(.top, 24)
                        .padding(.bottom, 24)
                    }
                    
                    Spacer()
                }
                .overlay(loader(isLoading: viewModel.isLoading))
                .navigationDestination(for: DetailViewModel.self) { detailViewModel in
                    DetailView(viewModel: detailViewModel)
            }
            .overlay(
                ZStack {
                    Color.clear
                        .background(.ultraThinMaterial)
                        .blur(radius: 5)
                    Text("NYC Schools")
                        .foregroundColor(.blue)
                        .font(.largeTitle.weight(.bold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 20)
                }
                    .frame(height: 70)
                    .frame(maxHeight: .infinity, alignment: .top)
                   
            )
        }
        }
        .alert("SAT scores are not available.", isPresented: $viewModel.showingNoSATAlert) {
            Button("Got it!") { }
        }
        .alert("Unable to load.", isPresented: $viewModel.showingErrorAlert) {
            Button("Got it") { }
        }
        
        
    }
    
    func schoolCell(_ text: String, _ tidbit: String) -> some View {
        HStack {
            VStack {
                HStack {
                Text(text)
                    .foregroundColor(.blue)
                    .font(.system(size: 20))
                    .padding(.all, 8)
                    .padding(.leading, 12)
                    .lineLimit(3)
                    .multilineTextAlignment(.leading)
                }
            }
            Spacer()
            Image(systemName: "chevron.compact.right")
                .foregroundColor(.blue)
                .font(.system(size: 24))
                .padding(.all, 8)
                .padding(.trailing, 8)
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 6)
        
    }
    
    @ViewBuilder
    func loader(isLoading: Bool) -> some View {
        if isLoading {
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    ZStack {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .gray))
                            .scaleEffect(CGSize(width: 2.0, height: 2.0))
                            .padding(.all, 32)
                    }
                    .background(RoundedRectangle(cornerRadius: 12).fill().foregroundColor(.blue.opacity(0.05)))
                    Spacer()
                }
                Spacer()
            }
            .background(Color.blue)
        }
    }
}
