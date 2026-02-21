import '../../models/restaurant.dart';
import '../../models/menu_item.dart';

class MockContent {
  static const banners = [
    'assets/images/banners/promo1.jpg',
    'assets/images/banners/promo2.jpg',
  ];

  static final restaurants = <Restaurant>[
    // =====================================================
    // JOLLIBEE
    // =====================================================
    Restaurant(
      id: 'r1',
      name: 'Jollibee',
      image: 'assets/images/restaurants/jollibee.jpg',
      heroImage: 'assets/images/restaurants/jollibeehero.jpg',
      rating: 4.6,
      etaText: '25 mins',
      distanceText: '2.1 km',
      promoText: 'Free delivery • Min. ₱199',
      tags: const ['Fast Food', 'Chicken', 'Rice Meals'],
      menu: [
        MenuItem(
          id: 'm1',
          name: 'Chickenjoy 1pc w/ Rice',
          price: 99,
          image: 'assets/images/menu/chickenjoy.jpg',
          description: 'Crispylicious, juicylicious chicken.',
        ),
        MenuItem(
          id: 'm2',
          name: 'Chickenjoy 2pc w/ Rice',
          price: 179,
          image: 'assets/images/menu/chickenjoy.jpg',
          description: 'Double Chickenjoy with rice.',
        ),
        MenuItem(
          id: 'm3',
          name: 'Jolly Spaghetti (Regular)',
          price: 60,
          image: 'assets/images/menu/spaghetti.jpg',
          description: 'Sweet-style spaghetti with hotdog slices.',
        ),
        MenuItem(
          id: 'm4',
          name: 'Jolly Spaghetti (Large)',
          price: 89,
          image: 'assets/images/menu/spaghetti.jpg',
          description: 'Bigger serving of the classic sweet spaghetti.',
        ),
        MenuItem(
          id: 'm5',
          name: 'Yumburger',
          price: 50,
          image: 'assets/images/menu/yumburger.jpg',
          description: 'Classic burger with special dressing.',
        ),
        MenuItem(
          id: 'm6',
          name: 'Cheesy Yumburger',
          price: 69,
          image: 'assets/images/menu/yumburger.jpg',
          description: 'Yumburger with creamy cheese.',
        ),
        MenuItem(
          id: 'm7',
          name: 'Burger Steak Solo',
          price: 75,
          image: 'assets/images/menu/chickenjoy.jpg',
          description: 'Savory burger patty with mushroom gravy.',
        ),
        MenuItem(
          id: 'm8',
          name: 'Burger Steak w/ Rice',
          price: 99,
          image: 'assets/images/menu/burgersteak.jpg',
          description: 'Burger steak with rice and gravy.',
        ),
        MenuItem(
          id: 'm9',
          name: 'Jolly Hotdog',
          price: 85,
          image: 'assets/images/menu/yumburger.jpg',
          description: 'Hotdog with cheese, ketchup, and mayo.',
        ),
        MenuItem(
          id: 'm10',
          name: 'Peach Mango Pie',
          price: 45,
          image: 'assets/images/menu/fries.jpg',
          description: 'Crispy pie with peach mango filling.',
        ),
      ],
    ),

    // =====================================================
    // MCDONALD’S
    // =====================================================
    Restaurant(
      id: 'r2',
      name: 'McDonald’s',
      image: 'assets/images/restaurants/mcdonalds.png',
      heroImage: 'assets/images/restaurants/mcdopromo.jpg',
      rating: 4.5,
      etaText: '22 mins',
      distanceText: '1.6 km',
      promoText: '₱49 delivery • Deals available',
      tags: const ['Fast Food', 'Burgers'],
      menu: [
        MenuItem(
          id: 'm11',
          name: 'McChicken Sandwich',
          price: 95,
          image: 'assets/images/menu/mcchicken.jpg',
          description: 'Crispy chicken patty with mayo.',
        ),
        MenuItem(
          id: 'm12',
          name: 'Big Mac',
          price: 179,
          image: 'assets/images/menu/mcchicken.jpg',
          description: 'Iconic double beef burger with special sauce.',
        ),
        MenuItem(
          id: 'm13',
          name: 'Cheeseburger',
          price: 65,
          image: 'assets/images/menu/mcchicken.jpg',
          description: 'Classic cheeseburger with pickles.',
        ),
        MenuItem(
          id: 'm14',
          name: 'Chicken McDo 1pc w/ Rice',
          price: 99,
          image: 'assets/images/menu/chickenjoy.jpg',
          description: 'McDo fried chicken with rice.',
        ),
        MenuItem(
          id: 'm15',
          name: 'McSpaghetti',
          price: 75,
          image: 'assets/images/menu/spaghetti.jpg',
          description: 'Sweet Filipino-style spaghetti.',
        ),
        MenuItem(
          id: 'm16',
          name: 'Fries (Medium)',
          price: 55,
          image: 'assets/images/menu/fries.jpg',
          description: 'Golden fries, perfectly salted.',
        ),
        MenuItem(
          id: 'm17',
          name: 'McFlurry Oreo',
          price: 65,
          image: 'assets/images/menu/fries.jpg',
          description: 'Creamy vanilla with Oreo bits.',
        ),
      ],
    ),

    // =====================================================
    // KFC
    // =====================================================
    Restaurant(
      id: 'r3',
      name: 'KFC',
      image: 'assets/images/restaurants/kfc.png',
      heroImage: 'assets/images/restaurants/kfc.jpg',
      rating: 4.4,
      etaText: '28 mins',
      distanceText: '3.0 km',
      promoText: 'Free upgrade today',
      tags: const ['Chicken', 'Fast Food'],
      menu: [
        MenuItem(
          id: 'm18',
          name: 'Original Recipe 1pc',
          price: 110,
          image: 'assets/images/menu/chickenjoy.jpg',
          description: 'Signature herbs and spices chicken.',
        ),
        MenuItem(
          id: 'm19',
          name: 'Hot & Crispy 1pc',
          price: 115,
          image: 'assets/images/menu/chickenjoy.jpg',
          description: 'Extra crispy with a spicy kick.',
        ),
        MenuItem(
          id: 'm20',
          name: 'Zinger Burger',
          price: 149,
          image: 'assets/images/menu/yumburger.jpg',
          description: 'Spicy chicken fillet with mayo.',
        ),
        MenuItem(
          id: 'm21',
          name: 'Famous Bowl',
          price: 120,
          image: 'assets/images/menu/fries.jpg',
          description: 'Mashed potato, corn, chicken, gravy.',
        ),
      ],
    ),

    // =====================================================
    // MANG INASAL
    // =====================================================
    Restaurant(
      id: 'r4',
      name: 'Mang Inasal',
      image: 'assets/images/restaurants/mang_inasal.png',
      heroImage: 'assets/images/restaurants/mang_inasalhero.png',
      rating: 4.3,
      etaText: '30 mins',
      distanceText: '3.4 km',
      promoText: 'Unli rice available',
      tags: const ['Chicken', 'Rice Meals'],
      menu: [
        MenuItem(
          id: 'm22',
          name: 'PM1 (Pecho)',
          price: 155,
          image: 'assets/images/menu/chickenjoy.jpg',
          description: 'Grilled chicken pecho with rice.',
        ),
        MenuItem(
          id: 'm23',
          name: 'PM2 (Paa)',
          price: 145,
          image: 'assets/images/menu/chickenjoy.jpg',
          description: 'Grilled chicken paa with rice.',
        ),
        MenuItem(
          id: 'm24',
          name: 'Pork BBQ (2 sticks)',
          price: 110,
          image: 'assets/images/menu/yumburger.jpg',
          description: 'Smoky pork BBQ with rice.',
        ),
      ],
    ),

    // =====================================================
    // CHOWKING
    // =====================================================
    Restaurant(
      id: 'r5',
      name: 'Chowking',
      image: 'assets/images/restaurants/chowking.png',
      heroImage: 'assets/images/restaurants/chowking.png',
      rating: 4.4,
      etaText: '24 mins',
      distanceText: '2.3 km',
      promoText: 'Free siomai this week',
      tags: const ['Chinese', 'Rice Meals'],
      menu: [
        MenuItem(
          id: 'm25',
          name: 'Chao Fan',
          price: 75,
          image: 'assets/images/menu/fries.jpg',
          description: 'Classic fried rice.',
        ),
        MenuItem(
          id: 'm26',
          name: 'Siomai Chao Fan',
          price: 99,
          image: 'assets/images/menu/fries.jpg',
          description: 'Chao fan with siomai.',
        ),
        MenuItem(
          id: 'm27',
          name: 'Pancit Canton',
          price: 95,
          image: 'assets/images/menu/spaghetti.jpg',
          description: 'Stir-fried noodles with savory sauce.',
        ),
        MenuItem(
          id: 'm28',
          name: 'Halo-Halo',
          price: 89,
          image: 'assets/images/menu/fries.jpg',
          description: 'Classic Pinoy dessert.',
        ),
      ],
    ),

    // =====================================================
    // BURGER KING
    // =====================================================
    Restaurant(
      id: 'r6',
      name: 'Burger King',
      image: 'assets/images/restaurants/burgerking.png',
      heroImage: 'assets/images/restaurants/burgerking.png',
      rating: 4.6,
      etaText: '29 mins',
      distanceText: '3.1 km',
      promoText: 'Buy 1 Take 1',
      tags: const ['Burgers', 'Fast Food'],
      menu: [
        MenuItem(
          id: 'm29',
          name: 'Whopper',
          price: 189,
          image: 'assets/images/menu/yumburger.jpg',
          description: 'Flame-grilled beef with fresh veggies.',
        ),
        MenuItem(
          id: 'm30',
          name: 'Cheeseburger',
          price: 99,
          image: 'assets/images/menu/yumburger.jpg',
          description: 'Classic cheeseburger.',
        ),
        MenuItem(
          id: 'm31',
          name: 'Onion Rings',
          price: 79,
          image: 'assets/images/menu/fries.jpg',
          description: 'Crispy onion rings.',
        ),
      ],
    ),

    // =====================================================
    // WENDY’S
    // =====================================================
    Restaurant(
      id: 'r7',
      name: 'Wendy’s',
      image: 'assets/images/restaurants/wendys.png',
      heroImage: 'assets/images/restaurants/wendys.png',
      rating: 4.5,
      etaText: '26 mins',
      distanceText: '2.8 km',
      promoText: '₱0 delivery • Min. ₱199',
      tags: const ['Burgers', 'Fast Food'],
      menu: [
        MenuItem(
          id: 'm32',
          name: 'Baconator',
          price: 220,
          image: 'assets/images/menu/yumburger.jpg',
          description: 'Loaded beef burger with bacon.',
        ),
        MenuItem(
          id: 'm33',
          name: 'Frosty (Small)',
          price: 60,
          image: 'assets/images/menu/fries.jpg',
          description: 'Chocolate frosty dessert.',
        ),
        MenuItem(
          id: 'm34',
          name: 'Fries (Regular)',
          price: 55,
          image: 'assets/images/menu/fries.jpg',
          description: 'Crispy fries.',
        ),
      ],
    ),

    // =====================================================
    // POPEYES
    // =====================================================
    Restaurant(
      id: 'r8',
      name: 'Popeyes',
      image: 'assets/images/restaurants/popeyes.png',
      heroImage: 'assets/images/restaurants/popeyes.png',
      rating: 4.6,
      etaText: '31 mins',
      distanceText: '3.7 km',
      promoText: 'Free drink • Limited',
      tags: const ['Chicken', 'Fast Food'],
      menu: [
        MenuItem(
          id: 'm35',
          name: 'Spicy Chicken Sandwich',
          price: 175,
          image: 'assets/images/menu/mcchicken.jpg',
          description: 'Spicy chicken sandwich with pickles.',
        ),
        MenuItem(
          id: 'm36',
          name: '1pc Chicken w/ Rice',
          price: 125,
          image: 'assets/images/menu/chickenjoy.jpg',
          description: 'Crispy chicken with rice.',
        ),
        MenuItem(
          id: 'm37',
          name: 'Biscuits (2pcs)',
          price: 65,
          image: 'assets/images/menu/fries.jpg',
          description: 'Buttery biscuits.',
        ),
      ],
    ),

    // =====================================================
    // BONCHON
    // =====================================================
    Restaurant(
      id: 'r9',
      name: 'Bonchon',
      image: 'assets/images/restaurants/bonchon.png',
      heroImage: 'assets/images/restaurants/bonchon.png',
      rating: 4.6,
      etaText: '27 mins',
      distanceText: '2.9 km',
      promoText: 'Crunchy chicken deals',
      tags: const ['Chicken', 'Korean'],
      menu: [
        MenuItem(
          id: 'm38',
          name: 'Korean Fried Chicken (Soy Garlic)',
          price: 199,
          image: 'assets/images/menu/chickenjoy.jpg',
          description: 'Crispy chicken in soy garlic glaze.',
        ),
        MenuItem(
          id: 'm39',
          name: 'Korean Fried Chicken (Spicy)',
          price: 199,
          image: 'assets/images/menu/chickenjoy.jpg',
          description: 'Crispy chicken in spicy glaze.',
        ),
        MenuItem(
          id: 'm40',
          name: 'Bibimbowl',
          price: 165,
          image: 'assets/images/menu/fries.jpg',
          description: 'Rice bowl with Korean flavors.',
        ),
      ],
    ),

    // =====================================================
    // ANDOKS
    // =====================================================
    Restaurant(
      id: 'r10',
      name: 'Andoks',
      image: 'assets/images/restaurants/andoks.png',
      heroImage: 'assets/images/restaurants/andoks.png',
      rating: 4.4,
      etaText: '33 mins',
      distanceText: '4.0 km',
      promoText: 'Sulit meals',
      tags: const ['Chicken', 'Rice Meals'],
      menu: [
        MenuItem(
          id: 'm41',
          name: 'Dokito Burger',
          price: 95,
          image: 'assets/images/menu/yumburger.jpg',
          description: 'Crispy chicken burger.',
        ),
        MenuItem(
          id: 'm42',
          name: 'Litson Manok (Whole)',
          price: 320,
          image: 'assets/images/menu/chickenjoy.jpg',
          description: 'Roasted chicken whole.',
        ),
        MenuItem(
          id: 'm43',
          name: 'BBQ (2 sticks)',
          price: 90,
          image: 'assets/images/menu/yumburger.jpg',
          description: 'Savory BBQ sticks.',
        ),
      ],
    ),
  ];
}