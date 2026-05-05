import 'package:flutter/material.dart';
import 'package:mobile_dev_hakathon/core/models/pharmacy.dart';
import 'package:mobile_dev_hakathon/feature/trainings/presentation/screens/widgets/trainings_filter_bar.dart';
import 'package:mobile_dev_hakathon/feature/trainings/presentation/screens/widgets/trainings_list_view.dart';

class TrainingsScreenBody extends StatefulWidget {
  const TrainingsScreenBody({super.key});

  @override
  State<TrainingsScreenBody> createState() => _TrainingsScreenBodyState();
}

class _TrainingsScreenBodyState extends State<TrainingsScreenBody> {
  int _selectedFilter = 0;

  final List<Pharmacy> pharmacies = [
    const Pharmacy(
      name: 'صيدلية النهدي',
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuBmURaHeAG_l8j0v7JagIxPuK4gAd3PK4_DWA_qM2hAtV8Xd9KN2YkC3Y1RfOOP5LaD-UMdZfKDfcH-1DxRP6O8qwb8cmJmyM-ieYOVSn7u2V6ESmGWOT0goxUKp06bTUMI-eY-km5kjHlgUP1PAeUzWTg-enWt_mao0T5RQ2xKPMZhvHScSlzkmvIUf5gDDhaGrmR-8s9Ucmr7uWZqMrDapRGBh97ARy8q3NZ_fvEPYRpSE8t9xmEX8R_yQqxO8K-1fHLEiZrZi1PA',
      distance: 'على بعد 80 متر',
      address: 'شارع الملك فهد، جدة',
      isFavorite: false,
    ),
    const Pharmacy(
      name: 'صيدلية الدواء',
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuBwqwTSTyySxn8Kx7b7bbo9aL8RCKLCWq8WUhm6fkQNhPPYV0L_9APbiAzM3E0CAg_fE4ay8sMoP0-h0RtQIZ1QCDeEYVRhiimoni4E4dgtiWb0u3GTGST0viA_e8wYz7gC4XKxbT__SD2brRmF_WWhhvJmWB8B_Y4WhA1ly4f4q6OIPX0BCpVQHtJJrLwXxUsjg7HHnLCXjPCrY6pRW7QDtXua7v-B4Asui1nf0-HIf_sWO7kVqpIJp2pJqRt28tXDUnOrNaHUlwWB',
      distance: 'على بعد 250 متر',
      address: 'حي الروضة، مبنى 42',
      isFavorite: false,
    ),
    const Pharmacy(
      name: 'صيدلية وايتس',
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuD7JnB-UBi9S3YZa7tIGs_vn9Wp2wd4XxH-NSWiWmg850sGZghT2HpbqfFcJ2OJGwHBbXabnswvmFdU-hysBAFIqwv6AzmgXqurniKcySy02PtDv2CHDVCwZ9idfZHvhbCRk3jhcg-cU7G0Mq7Ku6DGDdi51u99nPva6fYiyCsvtilXj_FZ2qcsj85trQxtxXeUQwzWj0XYtN2SgaT0nCvrs4Ea5NVn37np9j2W-hVRQi6Ud79r_y9i-gsIoU-dc8i1DLZW2J2x73Nh',
      distance: 'على بعد 400 متر',
      address: 'التحلية مول، الدور الأرضي',
      isFavorite: false,
    ),
    const Pharmacy(
      name: 'صيدلية كنوز',
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuAvOqbZ1i-lk_fxxqUWSrc3-byBPjAf1GnWb72dbB6wLRaxPcm09BKWEKVlppE7jMKfXnD6g-re2yJXlJV3if1PJDGgKtSykT-83Lg_4zAdI5X7jPrVSVSF49PT_XR5T4-c9TJhqV0xHB8xbmk7VbyF73grzAl0mmAa1qNKCYdBMGZhS2IblBe6Vs9g_e80uh5qDhUNdvsKN2-m4xA3iK7DJOY8BOVEHGqOArztaq1FP_FNTCcn2QKZslTeFjCF5WSPuRNsLNIUkf',
      distance: 'على بعد 1.2 كم',
      address: 'حي الصفا، الشارع العام',
      isFavorite: false,
    ),
  ];

  List<Pharmacy> get filteredPharmacies {
    return pharmacies;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          // Filter bar widget
          TrainingsFilterBar(
            selectedFilter: _selectedFilter,
            onFilterChanged: (value) {
              setState(() => _selectedFilter = value);
            },
          ),
          // List view widget
          Expanded(child: TrainingsListView(pharmacies: filteredPharmacies)),
        ],
      );
  }
}
