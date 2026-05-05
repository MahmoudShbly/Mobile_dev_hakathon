class Pharmacy {
  final String name;
  final String imageUrl;
  final String distance;
  final String address;
  final bool isFavorite;
  // <<<<<<< HEAD
  final bool isDisabled;
  final bool isOnDuty;
  // =======
  // >>>>>>> 807f8a359ecd9a04e1594c8097541d4baffe67c3

  const Pharmacy({
    required this.name,
    required this.imageUrl,
    required this.distance,
    required this.address,
    this.isFavorite = false,
    // <<<<<<< HEAD
    this.isDisabled = false,
    this.isOnDuty = false,
    // =======
    // >>>>>>> 807f8a359ecd9a04e1594c8097541d4baffe67c3
  });
}
