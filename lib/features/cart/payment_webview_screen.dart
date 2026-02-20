import 'package:flutter/cupertino.dart';
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
  bool _processing = false;
  bool _isPaid = false;

  /// ===============================
  /// SIMULATE EXTERNAL PAYMENT (XENDIT EMULATOR)
  /// ===============================
  Future<void> _processPayment() async {
    setState(() => _processing = true);
    
    // Simulate network delay to the payment gateway
    await Future.delayed(const Duration(seconds: 3));

    if (!mounted) return;
    setState(() {
      _processing = false;
      _isPaid = true;
    });

    // Show success for a brief moment then go to tracking
    await Future.delayed(const Duration(seconds: 2));

    final cart = CartStore.instance;
    final now = DateTime.now();

    final order = Order(
      orderId: 'ORD-${now.millisecondsSinceEpoch.toString().substring(7)}',
      restaurantName: 'GrabFood Order',
      total: widget.amount,
      createdAtIso: now.toIso8601String(),
      status: 'Paid',
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
      navigationBar: CupertinoNavigationBar(
        middle: Text(_isPaid ? 'Payment Successful' : 'Xendit Checkout'),
        automaticallyImplyLeading: !_processing && !_isPaid,
      ),
      backgroundColor: const Color(0xFFF3F4F6),
      child: SafeArea(
        child: Center(
          child: _isPaid ? _buildSuccessUI() : _buildEmulatorUI(),
        ),
      ),
    );
  }

  Widget _buildEmulatorUI() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: CupertinoColors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: CupertinoColors.systemGrey.withAlpha(50),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Logo Simulation
          Container(
            height: 40,
            width: 120,
            decoration: BoxDecoration(
              color: const Color(0xFF6366F1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Center(
              child: Text(
                'Xendit',
                style: TextStyle(
                  color: CupertinoColors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Payment Confirmation',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            'Order #PAY-${DateTime.now().millisecondsSinceEpoch.toString().substring(9)}',
            style: const TextStyle(color: CupertinoColors.systemGrey, fontSize: 14),
          ),
          
          // REPLACED MATERIAL DIVIDER WITH CUPERTINO SEPARATOR
          Container(
            height: 1,
            color: CupertinoColors.separator,
            margin: const EdgeInsets.symmetric(vertical: 20),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Amount to Pay', style: TextStyle(color: CupertinoColors.systemGrey)),
              Text(
                '₱${widget.amount.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w900, color: Color(0xFF1F2937)),
              ),
            ],
          ),
          const SizedBox(height: 30),
          SizedBox(
            width: double.infinity,
            child: CupertinoButton(
              color: const Color(0xFF6366F1),
              onPressed: _processing ? null : _processPayment,
              child: _processing
                  ? const CupertinoActivityIndicator(color: CupertinoColors.white)
                  : const Text('Confirm Payment', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
          const SizedBox(height: 12),
          if (!_processing)
            CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel', style: TextStyle(color: CupertinoColors.systemGrey)),
            ),
        ],
      ),
    );
  }

  Widget _buildSuccessUI() {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          CupertinoIcons.checkmark_circle_fill,
          color: AppColors.grabGreen,
          size: 100,
        ),
        SizedBox(height: 20),
        Text(
          'Payment Received!',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Text(
          'Redirecting to tracking...',
          style: TextStyle(color: CupertinoColors.systemGrey),
        ),
        SizedBox(height: 40),
        CupertinoActivityIndicator(),
      ],
    );
  }
}
