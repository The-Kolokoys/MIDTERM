import 'dart:async';
import 'package:flutter/cupertino.dart';
import '../../core/biometrics.dart';
import '../../core/constants/colors.dart';
import '../../models/order.dart';
import '../../state/cart_provider.dart';
import '../../state/order_provider.dart';
import '../../tracking/tracking_screen.dart';

class PaymentWebviewScreen extends StatefulWidget {
  const PaymentWebviewScreen({super.key, required this.amount});
  final double amount;

  @override
  State<PaymentWebviewScreen> createState() => _PaymentWebviewScreenState();
}

class _PaymentWebviewScreenState extends State<PaymentWebviewScreen> {
  String _selectedMethod = 'cashless'; // Default based on screenshot
  bool _isProcessing = false;
  bool _showXendit = false;
  String _statusMessage = "";

  /// ===============================
  /// START PAYMENT PROCESS
  /// ===============================
  Future<void> _handleConfirm() async {
    // 1. Biometrics prompt FIRST (as per requirement)
    final authenticated = await Biometrics.authenticate(
      reason: "Confirm your $_selectedMethod payment",
    );

    if (!authenticated) return;

    if (_selectedMethod == 'cash') {
      // Direct to Tracking
      _finalizeOrder('Cash on Delivery');
    } else {
      // Go to Xendit Emulator Screen
      setState(() => _showXendit = true);
    }
  }

  /// ===============================
  /// SIMULATE XENDIT POLLING
  /// ===============================
  Future<void> _simulateXenditPayment() async {
    setState(() {
      _isProcessing = true;
      _statusMessage = "Processing...";
    });

    // POLLING SIMULATION
    for (int i = 1; i <= 3; i++) {
      if (!mounted) return;
      setState(() => _statusMessage = "Status Check... (Attempt $i)");
      await Future.delayed(const Duration(seconds: 2));
    }

    if (!mounted) return;
    setState(() => _statusMessage = "Status: PAID ✅");
    await Future.delayed(const Duration(seconds: 1));

    _finalizeOrder('Paid via Xendit');
  }

  void _finalizeOrder(String status) {
    final cart = CartStore.instance;
    final now = DateTime.now();

    final order = Order(
      orderId: 'ORD-${now.millisecondsSinceEpoch.toString().substring(7)}',
      restaurantName: 'GrabFood Order',
      total: widget.amount,
      createdAtIso: now.toIso8601String(),
      status: status,
    );

    OrderStore.instance.addOrder(order);
    cart.clear();

    if (!mounted) return;
    Navigator.of(context).pushAndRemoveUntil(
      CupertinoPageRoute(builder: (_) => const TrackingScreen()),
      (r) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Payment'),
      ),
      backgroundColor: const Color(0xFFF9FAFB), // Very light grey
      child: SafeArea(
        child: _showXendit ? _buildXenditUI() : _buildMainUI(),
      ),
    );
  }

  Widget _buildMainUI() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        children: [
          /// XENDIT MOCK CARD
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: CupertinoColors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: CupertinoColors.systemGrey.withAlpha(20),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Xendit (Mock Payment)',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 4),
                const Text(
                  'This is UI only. Backend integration will be added later.',
                  style: TextStyle(color: CupertinoColors.systemGrey, fontSize: 13),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Amount',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    Text(
                      '₱${widget.amount.toStringAsFixed(2)}',
                      style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 17),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          /// OPTIONS
          _methodTile('Cash', 'Pay upon arrival (COD)', 'cash'),
          const SizedBox(height: 12),
          _methodTile('Cashless', 'Online payment via Xendit (Mock)', 'cashless'),

          const Spacer(),

          /// CONFIRM BUTTON
          SizedBox(
            width: double.infinity,
            child: CupertinoButton(
              color: const Color(0xFF1B8E6A), // Greenish color from screenshot
              borderRadius: BorderRadius.circular(12),
              onPressed: _handleConfirm,
              child: const Text(
                'Confirm Payment',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),

          const SizedBox(height: 12),

          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel', style: TextStyle(color: Color(0xFF3B82F6))),
          ),
        ],
      ),
    );
  }

  Widget _methodTile(String title, String subtitle, String value) {
    final isSelected = _selectedMethod == value;
    return GestureDetector(
      onTap: () => setState(() => _selectedMethod = value),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: CupertinoColors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? const Color(0xFF1B8E6A) : CupertinoColors.systemGrey5,
            width: isSelected ? 1.5 : 1,
          ),
        ),
        child: Row(
          children: [
            Icon(
              isSelected ? CupertinoIcons.checkmark_circle_fill : CupertinoIcons.circle,
              color: isSelected ? const Color(0xFF1B8E6A) : CupertinoColors.systemGrey4,
              size: 24,
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                  const SizedBox(height: 2),
                  Text(subtitle, style: const TextStyle(color: CupertinoColors.systemGrey, fontSize: 12)),
                ],
              ),
            ),
            const Icon(CupertinoIcons.chevron_right, color: CupertinoColors.systemGrey4, size: 18),
          ],
        ),
      ),
    );
  }

  Widget _buildXenditUI() {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(24),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: CupertinoColors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(color: CupertinoColors.systemGrey.withAlpha(30), blurRadius: 30)
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Xendit Gateway", style: TextStyle(fontWeight: FontWeight.w900, color: Color(0xFF4F46E5))),
            const SizedBox(height: 20),
            Text(_isProcessing ? _statusMessage : "Confirming Cashless Payment",
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 30),
            if (!_isProcessing)
              SizedBox(
                width: double.infinity,
                child: CupertinoButton(
                  color: const Color(0xFF4F46E5),
                  onPressed: _simulateXenditPayment,
                  child: const Text("Pay Now"),
                ),
              )
            else
              const CupertinoActivityIndicator(),
            if (!_isProcessing)
              CupertinoButton(
                onPressed: () => setState(() => _showXendit = false),
                child: const Text("Go Back"),
              )
          ],
        ),
      ),
    );
  }
}
