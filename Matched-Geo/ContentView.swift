//
//  ContentView.swift
//  Matched-Geo

import SwiftUI

struct ContentView: View {
	
	@Namespace private var profileAnimation
	
	@State var isExpanded: Bool = false

    var body: some View {
        VStack {
			if isExpanded {
				expandedProfileView
			} else {
				collapsedProfileView
			}
			videoList
        }
    }

    var collapsedProfileView: some View {
        HStack {
            profileImage
				.matchedGeometryEffect(id: "profileImage", in: profileAnimation)
				.frame(width: 60, height: 60)

            VStack(alignment: .leading) {
                Text("Sean Allen")
                    .font(.title).bold()
					.matchedGeometryEffect(id: "name", in: profileAnimation)

                Text("iOS Developer")
                    .foregroundColor(.secondary)
					.matchedGeometryEffect(id: "desc", in: profileAnimation)
            }

            Spacer()
        }
        .padding()
    }

    var expandedProfileView: some View {
        VStack {
            profileImage
				.matchedGeometryEffect(id: "profileImage", in: profileAnimation)
				.frame(width: 130, height: 130)

            VStack {
                Text("Sean Allen")
                    .font(.title).bold()
					.matchedGeometryEffect(id: "name", in: profileAnimation)

                Text("iOS Developer")
                    .foregroundColor(.pink)
					.matchedGeometryEffect(id: "desc", in: profileAnimation)

                Text("I went full-time content creation in July of 2019. I am focused on building my course business as well as my app, Creator View.")
                    .padding()
            }
        }
        .padding()
    }

    var profileImage: some View {
        Image("my-pic")
            .resizable()
            .clipShape(Circle())
			.scaledToFit()
            .onTapGesture {
				withAnimation(.spring) {
					isExpanded.toggle()
				}
			}
    }

    var videoList: some View {
        List {
            ForEach(0...10, id: \.self) { _ in
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .frame(height: 180)
                        .foregroundColor(.gray.opacity(0.2))

                    Image(systemName: "play.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .opacity(0.3)
                }
                .padding(.vertical)

            }
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(.dark)
    }
}
