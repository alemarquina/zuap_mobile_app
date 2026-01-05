import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:zuap_mobile_app/shared/theme/app_theme.dart';

class StationQrScannerScreen extends StatefulWidget {
  const StationQrScannerScreen({super.key});

  @override
  State<StationQrScannerScreen> createState() => _StationQrScannerScreenState();
}

class _StationQrScannerScreenState extends State<StationQrScannerScreen> {
  MobileScannerController cameraController = MobileScannerController();
  bool isScanning = true;

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  void _onDetect(BarcodeCapture capture) {
    if (isScanning && capture.barcodes.isNotEmpty) {
      final String? code = capture.barcodes.first.rawValue;
      if (code != null) {
        setState(() {
          isScanning = false;
        });
        
        // Navigate to battery QR scanner screen
        Navigator.pushReplacementNamed(
          context,
          '/battery_qr_scanner_screen',
        );
      }
    }
  }

  void _simulateScan() {
    if (isScanning) {
      setState(() {
        isScanning = false;
      });
      
      // Simulate QR code scan and navigate to battery scanner
      Navigator.pushReplacementNamed(
        context,
        '/battery_qr_scanner_screen',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // QR Scanner View
          MobileScanner(
            controller: cameraController,
            onDetect: _onDetect,
          ),
          
          // Overlay with scanning frame
          Container(
            decoration: ShapeDecoration(
              shape: QrScannerOverlayShape(
                borderColor: AppTheme.primaryColor,
                borderRadius: 16,
                borderLength: 40,
                borderWidth: 8,
                cutOutSize: MediaQuery.of(context).size.width * 0.7,
              ),
            ),
          ),
          
          // Top bar with back button
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 28,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ),
          
          // Bottom instruction text and simulate button
          Positioned(
            bottom: 80,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  child: const Text(
                    'Escanea el QR de la estación',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Inter',
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Simulate scan button for testing
                ElevatedButton.icon(
                  onPressed: _simulateScan,
                  icon: const Icon(Icons.qr_code_scanner),
                  label: const Text('Simular escaneo'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primaryColor,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Custom overlay shape for QR scanner
class QrScannerOverlayShape extends ShapeBorder {
  final Color borderColor;
  final double borderWidth;
  final double borderLength;
  final double borderRadius;
  final double cutOutSize;

  const QrScannerOverlayShape({
    this.borderColor = Colors.white,
    this.borderWidth = 3.0,
    this.borderLength = 40,
    this.borderRadius = 10,
    this.cutOutSize = 300,
  });

  @override
  EdgeInsetsGeometry get dimensions => const EdgeInsets.all(10);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return Path()
      ..fillType = PathFillType.evenOdd
      ..addPath(getOuterPath(rect), Offset.zero);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    Path path = Path();
    final double cutOutWidth = cutOutSize;
    final double cutOutHeight = cutOutSize;

    final double left = rect.center.dx - cutOutWidth / 2;
    final double top = rect.center.dy - cutOutHeight / 2;
    final double right = left + cutOutWidth;
    final double bottom = top + cutOutHeight;

    path.moveTo(left, top);
    path.lineTo(right, top);
    path.lineTo(right, bottom);
    path.lineTo(left, bottom);
    path.lineTo(left, top);
    path.close();

    return path;
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    final double cutOutWidth = cutOutSize;
    final double cutOutHeight = cutOutSize;

    final double left = rect.center.dx - cutOutWidth / 2;
    final double top = rect.center.dy - cutOutHeight / 2;
    final double right = left + cutOutWidth;
    final double bottom = top + cutOutHeight;

    final Paint paint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;

    // Draw corners
    // Top left
    canvas.drawPath(
      Path()
        ..moveTo(left, top + borderLength)
        ..lineTo(left, top + borderRadius)
        ..arcToPoint(
          Offset(left + borderRadius, top),
          radius: Radius.circular(borderRadius),
        )
        ..lineTo(left + borderLength, top),
      paint,
    );

    // Top right
    canvas.drawPath(
      Path()
        ..moveTo(right - borderLength, top)
        ..lineTo(right - borderRadius, top)
        ..arcToPoint(
          Offset(right, top + borderRadius),
          radius: Radius.circular(borderRadius),
        )
        ..lineTo(right, top + borderLength),
      paint,
    );

    // Bottom right
    canvas.drawPath(
      Path()
        ..moveTo(right, bottom - borderLength)
        ..lineTo(right, bottom - borderRadius)
        ..arcToPoint(
          Offset(right - borderRadius, bottom),
          radius: Radius.circular(borderRadius),
        )
        ..lineTo(right - borderLength, bottom),
      paint,
    );

    // Bottom left
    canvas.drawPath(
      Path()
        ..moveTo(left + borderLength, bottom)
        ..lineTo(left + borderRadius, bottom)
        ..arcToPoint(
          Offset(left, bottom - borderRadius),
          radius: Radius.circular(borderRadius),
        )
        ..lineTo(left, bottom - borderLength),
      paint,
    );

    // Draw semi-transparent overlay
    final Paint overlayPaint = Paint()
      ..color = Colors.black.withValues(alpha: 0.5);

    canvas.drawPath(
      Path()
        ..addRect(rect)
        ..addRRect(RRect.fromRectAndRadius(
          Rect.fromLTRB(left, top, right, bottom),
          Radius.circular(borderRadius),
        ))
        ..fillType = PathFillType.evenOdd,
      overlayPaint,
    );
  }

  @override
  ShapeBorder scale(double t) => QrScannerOverlayShape(
        borderColor: borderColor,
        borderWidth: borderWidth,
        borderLength: borderLength,
        borderRadius: borderRadius,
        cutOutSize: cutOutSize,
      );
}
