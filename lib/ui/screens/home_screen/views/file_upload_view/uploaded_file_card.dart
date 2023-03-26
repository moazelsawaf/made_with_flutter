import 'package:flutter/material.dart';
import 'package:made_with_flutter/utils/colors_palette.dart';

class UploadedFileCard extends StatelessWidget {
  const UploadedFileCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ColorsPalette.gray100,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(
                Icons.insert_drive_file_outlined,
                color: ColorsPalette.primaryColor,
                size: 32,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'android.apk',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '1.2KB - 2 seconds left',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: ColorsPalette.gray700,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Material(
                      color: Colors.transparent,
                      child: InkResponse(
                        customBorder: const CircleBorder(),
                        onTap: () {},
                        child: const Icon(
                          Icons.close,
                          color: ColorsPalette.gray800,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '23%',
                    style: TextStyle(
                      color: ColorsPalette.gray700,
                      fontSize: 12,
                    ),
                  )
                ],
              )
            ],
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: const LinearProgressIndicator(
              value: 0.75,
              backgroundColor: ColorsPalette.gray300,
              valueColor: AlwaysStoppedAnimation<Color>(
                ColorsPalette.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
