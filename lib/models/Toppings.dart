// ignore_for_file: public_member_api_docs, sort_constructors_first
class Toppings {
  final String name;
  final String image;
  double added;
  final double price;
  Toppings({
    required this.name,
    required this.image,
    required this.added,
    required this.price,
  });
}

List<Toppings> toppings = [
  Toppings(
    name: "tomato",
    image: "assets/Toppings/tomato.png",
    added: 0,
    price: .75,
  ),
  Toppings(
    name: "onion",
    image: "assets/Toppings/onion.png",
    added: 0,
    price: .50,
  ),
  Toppings(
    name: "Pickles",
    image: "assets/Toppings/Pickles.png",
    added: 0,
    price: .25,
  ),
  Toppings(
    name: "Mushroom",
    image: "assets/Toppings/Mushroom.png",
    added: 0,
    price: .75,
  ),
  Toppings(
    name: "Bacons",
    image: "assets/Toppings/Bacons.png",
    added: 0,
    price: 1.25,
  ),
  Toppings(
    name: "Avocado",
    image: "assets/Toppings/Avocado.png",
    added: 0,
    price: 1.50,
  ),
];

List<Toppings> SideOptions = [
  Toppings(
    name: "Fries",
    image: "assets/SideOptions/Fries.png",
    added: 0,
    price: 1.50,
  ),
  Toppings(
    name: "Coleslaw",
    image: "assets/SideOptions/Coleslaw.png",
    added: 0,
    price: 1.25,
  ),
  Toppings(
    name: "Salad",
    image: "assets/SideOptions/Salad.png",
    added: 0,
    price: 1.00,
  ),
  Toppings(
    name: "Onion",
    image: "assets/SideOptions/Onion.png",
    added: 0,
    price: .75,
  ),
  Toppings(
    name: "Mozzarella",
    image: "assets/SideOptions/Mozzarella.png",
    added: 0,
    price: 1.25,
  ),
];
