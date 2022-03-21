class Beer {
  final int consumedAt;

  const Beer(this.consumedAt);
}

class BeerPrice {
  final int lastUpdated;
  final double price;
  final String lastChangedBy;

  const BeerPrice({required this.lastUpdated, required this.price, required this.lastChangedBy});
}