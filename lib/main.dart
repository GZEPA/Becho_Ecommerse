// import 'dart:nativewrappers/_internal/vm/lib/internal_patch.dart';
import 'package:flutter/material.dart';
// import 'profile_page.dart';
// void main() => runApp(MaterialApp(
//       home: SearchWithHistoryDemo(),
//     ));

void main() => runApp(Signup());

// Import the ProfilePage

class HomeApp extends StatefulWidget {
  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  int atIndex = 0;

  final pages = [
    Center(child: Text('Home')), // Placeholder for Home
    Center(child: Text('Search')), // Placeholder for Search
    // ProfilePage(), // Add the ProfilePage here
    Center(child: Text('Cart')), // Placeholder for Cart
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('E-commerce App'),
        ),
        body: pages[atIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: atIndex,
          onTap: (index) => setState(() => atIndex = index),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ),
          ],
        ),
      ),
    );
  }
}

class SearchWithHistoryDemo extends StatefulWidget {
  @override
  _SearchWithHistoryDemoState createState() => _SearchWithHistoryDemoState();
}

class _SearchWithHistoryDemoState extends State<SearchWithHistoryDemo> {
  List<String> allItems = [
    "Shoes",
    "Shirts",
    "Pants",
    "Hats",
    "Accessories",
    "Bags",
  ];
  List<String> filteredItems = [];
  List<String> searchHistory = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredItems = allItems; // Display all items initially
  }

  void filterResults(String query) {
    setState(() {
      filteredItems = allItems
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void saveSearchQuery(String query) {
    if (query.isNotEmpty && !searchHistory.contains(query)) {
      setState(() {
        searchHistory.insert(0, query);
        if (searchHistory.length > 10) {
          searchHistory.removeLast();
        }
      });
    }
  }

  Widget buildSearchHistory() {
    return ListView.builder(
      itemCount: searchHistory.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(searchHistory[index]),
          onTap: () {
            String selectedQuery = searchHistory[index];
            searchController.text = selectedQuery;
            filterResults(selectedQuery);
          },
        );
      },
    );
  }

  Widget buildFilteredResults() {
    return filteredItems.isNotEmpty
        ? ListView.builder(
            itemCount: filteredItems.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(filteredItems[index]),
              );
            },
          )
        : Center(
            child: Text("No items found."),
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search Bar
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: "Search...",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onChanged: (value) {
                filterResults(value);
              },
              onSubmitted: (value) {
                saveSearchQuery(value); // Save to history on search submission
                filterResults(value);
              },
            ),
            const SizedBox(height: 20),
            // Display Search Results or History
            Expanded(
              child: searchController.text.isEmpty
                  ? buildSearchHistory()
                  : buildFilteredResults(),
            ),
          ],
        ),
      ),
    );
  }
}

class Becho_Ecommerse extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'login and signup page ',
        initialRoute: './loginn',
        routes: {
          'loginn': (context) => loginapp(),
          './signup': (context) => Signup()
        });
  }
}

class imagedi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('imagechaking'),
        ),
        body: Container(
          child: Image.asset('assets/image/si12.png'),
        ),
      ),
    );
  }
}

class CartApp extends StatelessWidget {
  @override
  
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CartPage(),
    );
  }
}

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int itemCount = 3;
  double totalPrice = 125.99;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Your cart items will appear here'),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.shopping_cart, size: 28),
                SizedBox(width: 10),
                Text('$itemCount items',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
              ],
            ),
            Row(
              children: [
                Text('Total: \$${totalPrice.toStringAsFixed(2)}',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    print('Proceeding to checkout...');
                  },
                  child: Text('Checkout'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SearchApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SearchPage(),
    );
  }
}

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController serchcontroller = TextEditingController();
  String Squary = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            hintText: 'search for product...',
          ),
          onChanged: (quary) {
            setState(() {
              Squary = quary;
            });
          },
        ),
        actions: [
          IconButton(
              onPressed: () {
                serchcontroller.clear();
                setState(() {
                  Squary = '';
                  // Squary = 'searhc for product';
                });
              },
              icon: Icon(
                Icons.clear,
                color: Colors.red,
              ))
        ],
      ),
      body: Center(
        child: Text(
          Squary.isEmpty
              ? 'search result will apear here'
              : 'searching for: $Squary',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

//??????????????????????????????????????????
class catagoryapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: catsgory(),
    );
  }
}

class catsgory extends StatefulWidget {
  @override
  itemcatagorystate createState() => itemcatagorystate();
}

class itemcatagorystate extends State<catsgory> {
  final List<Map<String, String>> catagor = [
    {'name': 'Electronics', 'image': 'assets/image/Furniture-Business.jpg'},
    {'name': 'elecronics', 'image': 'assets/image/Furniture-Business.jpg'},
    {'name': 'Electronics', 'image': 'assets/image/Furniture-Business.jpg'},
    {'name': 'elecronics', 'image': 'assets/image/Furniture-Business.jpg'},
    {'name': 'Electronics', 'image': 'assets/image/Furniture-Business.jpg'},
    {'name': 'elecronics', 'image': 'assets/image/Furniture-Business.jpg'},
    {'name': 'Electronics', 'image': 'assets/image/Furniture-Business.jpg'},
    {'name': 'elecronics', 'image': 'assets/image/Furniture-Business.jpg'},
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 10,
              childAspectRatio: 1),
          itemCount: catagor.length,
          itemBuilder: (BuildContext context, int index) {
            final catagory = catagor[index];
            return GestureDetector(
              onTap: () => print("you tapped ${catagor.length}"),
              child: Card(
                shadowColor: Colors.black,
                elevation: 4,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(11)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Padding(
                      padding: EdgeInsets.all(0),
                      child: Image.asset(
                        'assets/image/signup.png',
                        fit: BoxFit.contain,
                      ),
                    )),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Text('Nike air',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w800)),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    ));
  }
}

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

class homeapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: home());
  }
}

class home extends StatefulWidget {
  @override
  homestate createState() => homestate();
}

class homestate extends State<home> {
  int atindex = 0;
  static List<Widget> pages = [
    catagoryapp(),
    SearchWithHistoryDemo(),
    CartApp(),
    HomeApp()
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(''),
        ),
        body: pages[atindex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: atindex,
          unselectedItemColor: Colors.red,
          selectedItemColor: Colors.blue,
          onTap: (index) => setState(() => atindex = index),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.category,
                ),
                label: 'Category'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: 'Cart'),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), label: 'Profile'),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      backgroundImage:
                          AssetImage('assets/image/Furniture-Business.jpg'),
                      backgroundColor: Colors.white,
                      child: SizedBox(
                        height: 30,
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(15)),
                    Text('Gezpa',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          backgroundColor: Colors.black,
                        ))
                  ],
                ),
                decoration: BoxDecoration(color: Colors.blue),
              ),
              ListTile(
                leading: Icon(Icons.home_filled),
                title: Text('home'),
                onTap: () => Navigator.of(context).pop,
              ),
              ListTile(
                leading: Icon(Icons.local_grocery_store_outlined),
                title: Text("wishlist"),
                onTap: Navigator.of(context).pop,
              ),
              ListTile(
                leading: Icon(Icons.refresh),
                title: Text('history'),
                onTap: Navigator.of(context).pop,
              ),
              ListTile(
                leading: Icon(Icons.description_outlined),
                title: Text('terms and condition'),
                onTap: () => Navigator.of(context).pop,
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text("Setting"),
                onTap: Navigator.of(context).pop,
              ),
              ListTile(
                  leading: Icon(Icons.info),
                  title: Text('about us'),
                  onTap: Navigator.of(context).pop),
              ListTile(
                leading: Icon(Icons.support_agent_rounded),
                title: Text('support'),
                onTap: Navigator.of(context).pop,
              ),
              ListTile(
                leading: Icon(Icons.toggle_off_outlined),
                title: Text('darkmode'),
              ),
              ListTile(
                leading: Icon(Icons.logout_outlined),
                title: Text('logout'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    return MaterialApp(
      home: Scaffold(
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: screenWidth * 0.5,
              height: screenheight * 0.9,
              color: Colors.green,
              child: Image.asset(
                'assets/image/fur.png',
                // 'assets/image/si.png',
                fit: BoxFit.cover, // Optional: How
              ),
            ),
            Container(
              width: screenWidth * 0.5,
              color: const Color.fromARGB(255, 51, 51, 51),
              padding: EdgeInsets.all(100.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Persenal informatations',
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const TextField(
                      style:
                          TextStyle(color: Color.fromARGB(255, 173, 239, 255)),
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.person_outline_sharp,
                            size: 30,
                            color: Colors.white,
                          ),
                          hintStyle: TextStyle(color: Colors.white),
                          labelText: 'First name',
                          labelStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 4),
                          fillColor: Colors.white),
                    ),
                    const TextField(
                      style:
                          TextStyle(color: Color.fromARGB(255, 117, 210, 247)),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                          label: Text('Last Name'),
                          labelStyle: TextStyle(color: Colors.white),
                          hintStyle: TextStyle(color: Colors.white)),
                    ),
                    const TextField(
                      style: TextStyle(color: Colors.white),
                      // style: TextStyle(Colors.white),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(
                            Icons.search_rounded,
                            color: Colors.white,
                          ),
                          label: Text(
                            '@username',
                            style: TextStyle(color: Colors.white),
                          ),
                          hintStyle: TextStyle(color: Colors.white)),
                    ),
                    const TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text(
                            'Phone number',
                            style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1)),
                          ),
                          prefixIcon: Icon(
                            Icons.phone_outlined,
                            color: Colors.white,
                          ),
                          labelStyle: TextStyle(color: Colors.white)),
                      keyboardType: TextInputType.numberWithOptions(),
                    ),
                    const TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          hintStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(
                            Icons.lock_open,
                            color: Colors.white,
                          ),
                          label: Text(
                            'Password',
                          ),
                          labelStyle: TextStyle(color: Colors.white)),
                    ),
                    const TextField(
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(
                            Icons.mark_email_unread,
                            color: Colors.white,
                          ),
                          label: Text(
                            'gzepa123@gmail.com',
                            style: TextStyle(color: Colors.white),
                          ),
                          hintStyle: TextStyle(color: Colors.white)),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.yellow,
                            iconColor: Colors.black,
                            padding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 49),
                          ),
                          onPressed: () => {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                                    content: Text(
                              'you just clicked',
                            )))
                          },
                          // style: ButtonStyle(backgroundColor: ),
                          child: Container(
                            child: Row(
                              children: [
                                Text(
                                  'Sign up',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.blue),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
class loginapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: login());
  }
}

class login extends StatefulWidget {
  @override
  loginstate createState() => loginstate();
}

class loginstate extends State<login> {
  bool isobscurre = true;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;

    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.orange),
      home: Scaffold(
          appBar:
              AppBar(backgroundColor: const Color.fromARGB(153, 102, 102, 100)),
          backgroundColor: const Color.fromARGB(253, 221, 253, 255),
          body: Container(
            child: Container(
              height: screenheight * .9,
              color: Colors.black26,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.person,
                      size: 140,
                      color: const Color.fromARGB(106, 36, 37, 36),
                    ),
                    const SizedBox(
                        width: 240,
                        child: TextField(
                          maxLines: 1,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.person, size: 40),
                              labelText: 'Email',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(Checkbox.width)),
                                  borderSide: BorderSide(
                                    color: Colors.yellow,
                                  ))),
                        )),
                    SizedBox(
                        width: 240,
                        child: TextField(
                          maxLines: 1,
                          obscureText: isobscurre,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.lock),
                              suffixIcon: IconButton(
                                icon: Icon(isobscurre
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    isobscurre = !isobscurre;
                                  });
                                },
                              ),
                              labelText: 'Password',
                              hintStyle: TextStyle(fontWeight: FontWeight.w600),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.yellow,
                                  ),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(Checkbox.width)))),
                        )),
                    ElevatedButton(
                        onPressed: () => MaterialApp(
                              home: catsgory(),
                            ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.lightBlue,
                            foregroundColor:
                                const Color.fromARGB(255, 228, 217, 217),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 70, vertical: 15)),
                        child: const Text(
                          'Login',
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(padding: EdgeInsets.all(40)),
                        Text('continue Facebook'),
                        Icon(
                          Icons.facebook_rounded,
                          color: const Color.fromARGB(255, 20, 5, 224),
                        ),
                        Padding(padding: EdgeInsets.all(10)),
                        RichText(
                            text: const TextSpan(children: [
                          TextSpan(
                            text: "don't have anccount?    ",
                            style: TextStyle(
                                color: Color.fromARGB(255, 15, 129, 223)),
                          ),
                        ])),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
