class Pharmacy {
  final String name;
  final String imageUrl;
  final String distance;
  final String address;
  final bool isFavorite;
  final bool isDisabled;
  final bool isOnDuty;

  const Pharmacy({
    required this.name,
    required this.imageUrl,
    required this.distance,
    required this.address,
    this.isFavorite = false,
    this.isDisabled = false,
    this.isOnDuty = false,
  });
}
