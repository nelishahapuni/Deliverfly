//
//  FoodView.swift
//  Deliverfly
//
//  Created by Neli Shahapuni on 5/11/24.
//

import SwiftUI

struct FoodView: View {
    @Environment (\.dismiss) private var dismiss
    @State private var selectedIngredients: [Ingredient] = []
    @State private var quantity: Int = 1
    private var total: Double {
        return food.price*Double(quantity)
    }
    @Binding var orderItems: [Item]
    let food: Food
    
    var body: some View {
        VStack {
            ScrollView {
                image
                VStack(alignment: .leading) {
                    title
                    description
                    if !food.ingredients.isEmpty {
                        subtitle
                        ingredientsList
                    }
                }
                .padding()
            }
            Group {
                Divider()
                HStack {
                    totalPrice
                    Spacer()
                    itemQuantity
                }
                addToCart
            }
            .padding(.horizontal)
        }
    }
}

private extension FoodView {
    
    var image: some View {
        Image(food.image)
            .resizable()
            .scaledToFill()
            .frame(height: 200)
            .clipShape(.rect(
                bottomLeadingRadius: 30,
                bottomTrailingRadius: 30
            ))
    }
    
    var title: some View {
        Text(food.name)
            .font(.title2)
            .bold()
            .foregroundStyle(.darkBlue)
    }
    
    var description: some View {
        Text(food.description)
            .font(.subheadline)
            .lineSpacing(10)
            .foregroundStyle(.gray)
            .padding(.top, 5)
            .lineLimit(2)
    }
    
    var subtitle: some View {
        Text("Ingredients".uppercased())
            .font(.footnote)
            .fontWeight(.light)
            .kerning(1.0)
            .padding(.vertical, 10)
    }
    
    var ingredientsList: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 50), alignment: .top)], content: {
            ForEach(food.ingredients, id: \.self) { ingredient in
                Button {
                    ingredientTapped(ingredient)
                } label: {
                    ingredientButton(ingredient)
                }
            }
        })
    }
    
    @ViewBuilder func ingredientButton(_ ingredient: Ingredient) -> some View {
        VStack {
            Image(ingredient.rawValue)
                .renderingMode(.template)
                .frame(width: 50, height: 50)
                .foregroundStyle(isSelected(ingredient) ? .lightOrange : .darkOrange)
                .background(isSelected(ingredient) ? .darkOrange : .lightOrange)
                .clipShape(Circle())
            Text(ingredient.rawValue.capitalized)
                .font(.footnote)
                .foregroundStyle(.darkGray)
        }
        .padding(.bottom)
    }
    
    var totalPrice: some View {
        Text(total, format: .currency(code: "USD"))
            .font(.title)
            .fontWeight(.medium)
            .padding(.vertical, 10)
    }
    
    var itemQuantity: some View {
        Group {
            Button {
                minusTapped()
            } label: {
                Text("-")
                    .bold()
                    .foregroundStyle(.darkGray)
                    .frame(width: 25, height: 25)
                    .background(.lightGray)
                    .clipShape(Circle())
            }
            Text("\(quantity)")
                .bold()
                .padding(.horizontal)
            Button {
                plusTapped()
            } label: {
                Text("+")
                    .bold()
                    .foregroundStyle(.darkGray)
                    .frame(width: 25, height: 25)
                    .background(.lightGray)
                    .clipShape(Circle())
            }
        }
    }
    
    var addToCart: some View {
        Button {
            addToCartTapped()
            dismiss()
        } label: {
            Text("Add to Cart".uppercased())
                .bold()
                .frame(maxWidth: .infinity, minHeight: 60)
                .foregroundStyle(quantity == 0 ? .gray : .white)
                .background(quantity == 0 ? .lightGray : .darkOrange)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .disabled(quantity == 0)
    }
}

private extension FoodView {
    
    func minusTapped() {
        if quantity > 0 {
            quantity -= 1
        }
    }
    
    func plusTapped() {
        if quantity < 10 {
            quantity += 1
        }
    }
    
    func isSelected(_ ingredient: Ingredient) -> Bool {
        selectedIngredients.contains { $0 == ingredient }
    }
    
    func ingredientTapped(_ ingredient: Ingredient) {
        if selectedIngredients.contains(where: { $0 == ingredient }) {
            selectedIngredients.removeAll { $0 == ingredient }
        } else if selectedIngredients.count < 3 {
            selectedIngredients.append(ingredient)
        }
    }
    
    func addToCartTapped() {
        let item = Item(
            food: food,
            quantity: quantity,
            extras: selectedIngredients
        )
        orderItems.append(item)
    }
}

#Preview {
    FoodView(orderItems: .constant(.previewDataArray), food: .doubleDouble)
}
