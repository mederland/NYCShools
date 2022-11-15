//
//  ScoreView.swift
//  20221028-MederIzimov-NYCSchools
//
//  Created by Consultant on 10/29/22.
//

import SwiftUI

@available(iOS 16.0, *)
struct DetailView: View {
    @ObservedObject var viewModel: DetailViewModel
    var body: some View {
        VStack {
        
            HStack {
                BackButton {
                    viewModel.dismiss()
                }
                Spacer()
            }
                    
            GeometryReader { geo in
            
                VStack {
                    
                    
                    ZStack{
                        Image("School")
                            .resizable()
                            .scaledToFill()
                            .edgesIgnoringSafeArea(.all)
                            .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
                            .opacity(1.0)
                        
                        ScrollView {
                            VStack {
                                Spacer()
                                    .frame(height: 12)
                                HStack {
                                    
                                    Text(viewModel.name(for: viewModel.school))
                                        .foregroundColor(.blue)
                                        .font(.system(size: 30))
                                        .fixedSize(horizontal: false, vertical: true)
                                        .frame(maxWidth: .infinity, alignment: .center)
                                    
                                    Spacer()
                                }
                                .padding(.horizontal, 24)
                                
                                VStack {
                                    HStack {
                                        Spacer()
                                        Text("Scores :")
                                            .foregroundColor(.blue)
                                            .font(.system(size: 25))
                                        Spacer()
                                    }
                                    .padding(.top, 16)
                                    VStack {
                                        HStack {
                                            Text("Students: ")
                                                .font(.system(size: 18))
                                                .padding(.leading, 8)
                                                .padding(.vertical, 4)
                                            Text(viewModel.numberOfStudents(for: viewModel.testScores))
                                                .font(.system(size: 18))
                                            Spacer()
                                            
                                        }
                                        .padding(.all, 6)
                                        
                                        HStack {
                                            Text("Math: ")
                                                .font(.system(size: 18))
                                                .padding(.leading, 8)
                                                .padding(.vertical, 4)
                                            Text(viewModel.math(for: viewModel.testScores))
                                                .font(.system(size: 18))
                                            Spacer()
                                            
                                        }
                                        .padding(.all, 6)
                                        
                                        HStack {
                                            Text("Reading: ")
                                                .font(.system(size: 18))
                                                .padding(.leading, 8)
                                                .padding(.vertical, 4)
                                            Text(viewModel.criticalReading(for: viewModel.testScores))
                                                .font(.system(size: 18))
                                            Spacer()
                                            
                                        }
                                        .padding(.all, 6)
                                        
                                        HStack {
                                            Text("Writing: ")
                                                .font(.system(size: 18))
                                                .padding(.leading, 8)
                                                .padding(.vertical, 4)
                                            
                                            Text(viewModel.writing(for: viewModel.testScores))
                                                .font(.system(size: 18))
                                            Spacer()
                                        }
                                        .padding(.all, 6)
                                    }
                                    .foregroundColor(.blue)
                                    .padding(.vertical, 6)
                                }
                                .padding(.bottom, 12)
                                .padding(.horizontal, 24)
                                .padding(.horizontal, 24)
                                
                                Spacer()
                                
                                VStack {
                                    HStack {
                                        Spacer()
                                    }
                                    VStack {
                                        HStack {
                                            Text("Address : ")
                                                .font(.system(size: 25))
                                                .foregroundColor(.blue)
                                            VStack {
                                                Text(viewModel.addressFirstLine(for: viewModel.school))
                                                    .frame(maxWidth: .infinity, alignment: .leading)
                                                    .foregroundColor(.blue)
                                                    .font(.system(size: 16))
                                                Spacer()
                                                Text(viewModel.addressSecondLine(for: viewModel.school))
                                                    .frame(maxWidth: .infinity, alignment: .leading)
                                                    .foregroundColor(.blue)
                                                    .font(.system(size: 16))
                                            }
                                            
                                        }
                                        
                                        
                                    }
                                    
                                    .padding(.horizontal, 24)
                                    .padding(.vertical, 6)
                                    
                                }
                                .padding(.bottom, 12)
                                .padding(.horizontal, 24)
                                .padding(.horizontal, 24)
                                
                                Spacer()
                                    .frame(height: 16)
                            }
                            Spacer()
                        }
                    }
                    .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                }
            }
        }
        .toolbar(.hidden, for: .navigationBar)
    }
}
