import 'package:flutter/cupertino.dart';
import '../../core/constants/colors.dart';
import '../../core/widgets/safe_image.dart';
import '../../models/restaurant.dart';
import '../../state/cart_provider.dart';
import '../cart/cart_screen.dart';
import '../../models/menu_item.dart';
import '../../models/cart_item.dart';

class RestaurantMenuScreen extends StatefulWidget {
  const RestaurantMenuScreen({super.key, required this.restaurant});
  final Restaurant restaurant;

  @override
  State<RestaurantMenuScreen> createState() => _RestaurantMenuScreenState();
}

class _RestaurantMenuScreenState extends State<RestaurantMenuScreen> {
  final cart = CartStore.instance;

  void _addItem(MenuItem m) {
    final currentRestaurant = cart.restaurantName;

    // ✅ CHECK LOGIC: If cart is NOT empty and restaurant is DIFFERENT
    if (currentRestaurant != null && currentRestaurant != widget.restaurant.name) {
      showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: const Text('Change Restaurant?'),
          content: Text(
            'Your basket contains items from $currentRestaurant. '
            'Do you want to clear your basket and add items from ${widget.restaurant.name} instead?',
          ),
          actions: [
            CupertinoDialogAction(
              child: const Text('Cancel'),
              onPressed: () => Navigator.pop(context),
            ),
            CupertinoDialogAction(
              isDestructiveAction: true,
              child: const Text('Confirm'),
              onPressed: () {
                setState(() {
                  cart.clear();
                  // ✅ FIXED: Convert MenuItem to CartItem before adding
                  cart.add(CartItem(id: m.id, name: m.name, price: m.price, image: m.image), widget.restaurant.name);
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    } else {
      // ✅ NORMAL ADD: Same restaurant or empty cart
      setState(() {
        // ✅ FIXED: Convert MenuItem to CartItem before adding
        cart.add(CartItem(id: m.id, name: m.name, price: m.price, image: m.image), widget.restaurant.name);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final r = widget.restaurant;

    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGroupedBackground,
      child: SafeArea(
        child: Stack(
          children: [
            ListView(
              padding: const EdgeInsets.only(bottom: 120),
              children: [
                // Hero
                SafeAssetImage(path: r.heroImage, width: double.infinity, height: 190, radius: 0),
                // floating info card
                Transform.translate(
                  offset: const Offset(0, -18),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: CupertinoColors.systemBackground,
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(color: AppColors.cardBorder),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                              Text(r.name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w900)),
                              const SizedBox(height: 6),
                              Row(
                                children: [
                                  const Icon(CupertinoIcons.star_fill, size: 14, color: Color(0xFFFFB300)),
                                  const SizedBox(width: 4),
                                  Text(r.rating.toStringAsFixed(1), style: const TextStyle(fontWeight: FontWeight.w700)),
                                  const SizedBox(width: 10),
                                  Text('${r.etaText} • ${r.distanceText}',
                                      style: const TextStyle(color: CupertinoColors.systemGrey, fontSize: 12)),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(r.promoText, style: const TextStyle(color: AppColors.greenText, fontWeight: FontWeight.w800)),
                            ]),
                          ),
                          const Icon(CupertinoIcons.check_mark_circled_solid, color: AppColors.grabGreen),
                        ],
                      ),
                    ),
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Text('For you', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900)),
                ),
                const SizedBox(height: 8),

                ...r.menu.map((m) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: CupertinoColors.systemBackground,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppColors.cardBorder),
                    ),
                    child: Row(
                      children: [
                        SafeAssetImage(path: m.image, width: 74, height: 74, radius: 14),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            Text(m.name, style: const TextStyle(fontWeight: FontWeight.w900)),
                            const SizedBox(height: 6),
                            Text(m.description, maxLines: 2, overflow: TextOverflow.ellipsis,
                                style: const TextStyle(color: CupertinoColors.systemGrey, fontSize: 12)),
                            const SizedBox(height: 8),
                            Text('₱${m.price.toStringAsFixed(0)}', style: const TextStyle(fontWeight: FontWeight.w800)),
                          ]),
                        ),
                        const SizedBox(width: 10),
                        CupertinoButton(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          color: CupertinoColors.systemGrey6,
                          borderRadius: BorderRadius.circular(14),
                          onPressed: () => _addItem(m),
                          child: const Text('Add', style: TextStyle(fontWeight: FontWeight.w800)),
                        ),
                      ],
                    ),
                  ),
                )),
              ],
            ),

            // top nav
            Positioned(
              left: 8,
              top: 8,
              child: CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () => Navigator.pop(context),
                child: const Icon(CupertinoIcons.back, color: CupertinoColors.white),
              ),
            ),

            // Basket bar
            if (cart.items.isNotEmpty)
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: SafeArea(
                  top: false,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () async {
                        await Navigator.of(context).push(
                          CupertinoPageRoute(builder: (_) => const CartScreen()),
                        );
                        setState(() {});
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                        decoration: BoxDecoration(
                          color: AppColors.grabGreen,
                          borderRadius: BorderRadius.circular(22),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Basket • ${cart.count} item${cart.count == 1 ? "" : "s"}',
                                style: const TextStyle(color: CupertinoColors.white, fontWeight: FontWeight.w900),
                              ),
                            ),
                            Text('₱${cart.total.toStringAsFixed(2)}',
                                style: const TextStyle(color: CupertinoColors.white, fontWeight: FontWeight.w900)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
