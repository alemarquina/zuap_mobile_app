// lib/features/stations/presentation/widgets/station_promo_banner.dart

import 'package:flutter/material.dart';
import 'package:zuap_mobile_app/shared/theme/app_theme.dart';

/// Widget that displays a promotional banner for new stations
/// Shows an image thumbnail and promotional text
class StationPromoBanner extends StatefulWidget {
  final String title;
  final String description;

  const StationPromoBanner({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  State<StationPromoBanner> createState() => _StationPromoBannerState();
}

class _StationPromoBannerState extends State<StationPromoBanner> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        color: AppTheme.primaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          // Station Image Thumbnail (Full Height)
          ClipRRect(
            borderRadius: BorderRadiusGeometry.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
            child: Container(
              height: double.infinity,
              width: 150,
              color: Colors.grey[300],
              child: Image.network(
                'https://www.petroperu.com.pe/Storage/modsnw/image/4084-m3Ja5Vt6Vw6Ue0J.jpg',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[400],
                    child: const Icon(
                      Icons.ev_station,
                      color: Colors.white,
                      size: 32,
                    ),
                  );
                },
              ),
            ),
          ),

          // Promotional Text
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    widget.description,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w100,
                      fontSize: 12,
                      height: 1.2,
                      fontFamily: 'Inter',
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
