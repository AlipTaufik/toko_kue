class Drink {
  final int id;
  final String name;
  final String price;
  final String deskripsi;
  final String imageUrl;
  final bool isFavorite;
  final String subMenu;

  Drink({
    required this.id,
    required this.name,
    required this.price,
    required this.deskripsi,
    required this.imageUrl,
    required this.isFavorite,
    required this.subMenu,
  });
}

final List<Drink> listDrinks = [
  Drink(
    id: 1,
    name: 'Fruit Juice',
    price: '20.000',
    deskripsi: 'Jus Buah Minuman Segar yang sangat enak dinikmati pada musim panas',
    imageUrl: 'https://wiratech.co.id/wp-content/uploads/2018/11/aneka-minuman-segar.jpg',
    isFavorite: true,
    subMenu: 'Drink_box',
  ),
  Drink(
    id: 2,
    name: 'Ice Blend',
    price: '24.000',
    deskripsi: 'Jenis minuman yang sangat digemari, terutama kalangan remaja dan anak muda. Minuman ini terbentuk dari: es batu yang dihancurkan hingga halus',
    imageUrl: 'https://i0.wp.com/indobubbletea.blog/wp-content/uploads/2014/11/ice-blend-coffee-bean.jpg?resize=500%2C375&ssl=1',
    isFavorite: false,
    subMenu: 'Drink_box',
  ),
  Drink(
    id: 5,
    name: 'Milk Shake',
    price: '30.000',
    deskripsi: 'Minuman manis dan dingin yang biasanya terbuat dari es krim, susu panas ataupun susu dingin. Dipadukan dengan bubuk perasa (flavor powder) ataupun sirup yang dibuat dengan cara dikocok',
    imageUrl: 'https://i0.wp.com/indobubbletea.blog/wp-content/uploads/2014/11/milkshake-4.jpg?resize=534%2C401&ssl=1',
    isFavorite: false,
    subMenu: 'Drink_box',
  ),
  Drink(
    id: 6,
    name: 'Fruit Tea',
    price: '15.000',
    deskripsi: 'Fruit Tea adalah minuman teh yang dicampurkan dengan sirup / konsentrat jus buah sebagai pemberi rasa teh tersebut.',
    imageUrl: 'https://i0.wp.com/indobubbletea.blog/wp-content/uploads/2014/11/fruit-tea-2.jpg?resize=750%2C563&ssl=1',
    isFavorite: false,
    subMenu: 'Drink_box',
  ),
  Drink(
    id: 3,
    name: 'Mocktail',
    price: '25.000',
    deskripsi: 'Sejenis minuman dengan karakteristik sama seperti Cocktail, hanya saja Mocktail tidak mengandung alkohol.',
    imageUrl: 'https://i0.wp.com/indobubbletea.blog/wp-content/uploads/2014/11/mocktails2.jpg?resize=580%2C381&ssl=1',
    isFavorite: false,
    subMenu: 'Drink_box',
  ),
  Drink(
    id: 4,
    name: 'Mojito',
    price: '27.000',
    deskripsi: 'Minuman segar yang terbentuk dari perpaduan antara white rum, lime juice (limau), air putih jernih & daun mint',
    imageUrl: 'https://i0.wp.com/indobubbletea.blog/wp-content/uploads/2014/11/smirnoff-apple-mojito-white-stores-alternative-cocktail-recipe-drink.jpg?resize=690%2C460&ssl=1',
    isFavorite: true,
    subMenu: 'Drink_box',
  ),
];
