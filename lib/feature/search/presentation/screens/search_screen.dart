import 'package:flutter/material.dart';
import 'package:mobile_dev_hakathon/core/models/pharmacy.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController(
    text: 'حجوزاتي',
  );
  bool _isSearching = false;

  final List<Pharmacy> _pharmacies = [
    const Pharmacy(
      name: 'صيدلية النهدي',
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuBmURaHeAG_l8j0v7JagIxPuK4gAd3PK4_DWA_qM2hAtV8Xd9KN2YkC3Y1RfOOP5LaD-UMdZfKDfcH-1DxRP6O8qwb8cmJmyM-ieYOVSn7u2V6ESmGWOT0goxUKp06bTUMI-eY-km5kjHlgUP1PAeUzWTg-enWt_mao0T5RQ2xKPMZhvHScSlzkmvIUf5gDDhaGrmR-8s9Ucmr7uWZqMrDapRGBh97ARy8q3NZ_fvEPYRpSE8t9xmEX8R_yQqxO8K-1fHLEiZrZi1PA',
      distance: 'على بعد 80 متر',
      address: 'شارع الملك فهد، جدة',
    ),
    const Pharmacy(
      name: 'صيدلية الدواء',
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuBwqwTSTyySxn8Kx7b7bbo9aL8RCKLCWq8WUhm6fkQNhPPYV0L_9APbiAzM3E0CAg_fE4ay8sMoP0-h0RtQIZ1QCDeEYVRhiimoni4E4dgtiWb0u3GTGST0viA_e8wYz7gC4XKxbT__SD2brRmF_WWhhvJmWB8B_Y4WhA1ly4f4q6OIPX0BCpVQHtJJrLwXxUsjg7HHnLCXjPCrY6pRW7QDtXua7v-B4Asui1nf0-HIf_sWO7kVqpIJp2pJqRt28tXDUnOrNaHUlwWB',
      distance: 'على بعد 250 متر',
      address: 'حي الروضة، مبنى 42',
    ),
    const Pharmacy(
      name: 'صيدلية وايتس',
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuD7JnB-UBi9S3YZa7tIGs_vn9Wp2wd4XxH-NSWiWmg850sGZghT2HpbqfFcJ2OJGwHBbXabnswvmFdU-hysBAFIqwv6AzmgXqurniKcySy02PtDv2CHDVCwZ9idfZHvhbCRk3jhcg-cU7G0Mq7Ku6DGDdi51u99nPva6fYiyCsvtilXj_FZ2qcsj85trQxtxXeUQwzWj0XYtN2SgaT0nCvrs4Ea5NVn37np9j2W-hVRQi6Ud79r_y9i-gsIoU-dc8i1DLZW2J2x73Nh',
      distance: 'على بعد 400 متر',
      address: 'التحلية مول، الدور الأرضي',
    ),
    const Pharmacy(
      name: 'صيدلية كنوز',
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuAvOqbZ1i-lk_fxxqUWSrc3-byBPjAf1GnWb72dbB6wLRaxPcm09BKWEKVlppE7jMKfXnD6g-re2yJXlJV3if1PJDGgKtSykT-83Lg_4zAdI5X7jPrVSVvjSF49PT_XR5T4-c9TJhqV0xHB8xbmk7VbyF73grzAl0mmAa1qNKCYdBMGZhS2IblBe6Vs9g_e80uh5qDhUNdvsKN2-m4xA3iK7DJOY8BOVEHGqOArztaq1FP_FNTCcn2QKZslTeFjCF5WSPuRNsLNIUkf',
      distance: 'على بعد 1.2 كم',
      address: 'حي الصفا، الشارع العام',
      isFavorite: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'الدواء',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Field
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'ابحث عن دواء...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _isSearching = value.isNotEmpty;
                });
              },
            ),
            const SizedBox(height: 16),
            // Search Results Text
            Text(
              'نتائج البحث عن دواء في الصيدليات المجاورة',
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            const SizedBox(height: 16),
            // Pharmacy List
            Expanded(
              child: ListView.builder(
                itemCount: _pharmacies.length,
                itemBuilder: (context, index) {
                  final pharmacy = _pharmacies[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 16),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          // Pharmacy Image
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.grey[100],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                pharmacy.imageUrl,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(
                                    Icons.local_pharmacy,
                                    size: 40,
                                  );
                                },
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          // Pharmacy Details
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      pharmacy.name,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge
                                          ?.copyWith(
                                            fontWeight: FontWeight.w800,
                                          ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        // Toggle favorite
                                      },
                                      icon: Icon(
                                        pharmacy.isFavorite
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        color: pharmacy.isFavorite
                                            ? Colors.red
                                            : Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      size: 18,
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.primary,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      pharmacy.distance,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall
                                          ?.copyWith(
                                            fontWeight: FontWeight.w700,
                                            color: Theme.of(
                                              context,
                                            ).colorScheme.primary,
                                          ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  pharmacy.address,
                                  style: Theme.of(context).textTheme.labelSmall
                                      ?.copyWith(
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.onSurfaceVariant,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
