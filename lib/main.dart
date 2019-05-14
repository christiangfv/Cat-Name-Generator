import 'package:flutter/material.dart';
import "dart:math";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cat Name Generator',  
      theme: ThemeData(
        primaryColor: Colors.lightGreen,
      ),                   
      home: RandomWords(),
    );
  }
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <String>[];
  final Set<String> _saved = Set<String>();
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final _names = <String>["Akira", "Angie", "Anubis", "Akiles", "Bandido", "Baldi", "Blacky (negrito)", "Boby", "Bú", "Bigotes", "Charlie", "Chasky", "Cheto", "Chico", "Chicho", "Chispas", "Calcetines", "Cat", "Cuki", "Cookie", "Cupcake", "Dominó", "Eno", "Estepario", "Frijolito", "Galleta", "Garfield", "General", "Gemelier", "Goliath", "Gordito", "Gus", "Guero", "Gold (oro)", "Gris", "Héctor", "Kaiser", "Keops", "Kiko", "Kiwi", "Leo", "Limón", "Lobo", "Lolo", "Manchitas", "Michu", "Misifú", "Morito", "Neptuno", "Niko", "Neo", "Oreo", "Panda", "Panther", "Petsi", "Pinto", "Popeye", "Pokemon", "Pipi", "Pompas", "Puma", "Punky", "Raspas", "Rabbit", "Rasputín", "Rubito", "Ruso", "Runa", "Sirio", "Starman", "Sunny", "Silver (plata)", "Snow (nieve)", "Tiger", "Tizón", "Vainilla", "Vikingo", "Zarpas", "Zipi", "Angel", "Comandante", "Eliott", "Eric", "Diamond", "Duende", "Duque", "Katmandhú", "Moscú", "Otto", "Ónix", "Puma", "Pantera", "Paris", "Ramsés", "Rey", "Sherkan", "Teo", "Tigre", "Urano", "Zar", "Wolf (lobo)", "Neko (significa gato)", "Akihiko (príncipe que brilla)", "Aoi (color azul)", "Daiki (elegante, glorioso y excelente)", "Hachiro (el 8º hijo)", "Haru (significa sol y luz del sol)", "Hiroshi (hombre generoso)", "Hayato (hombre valiente)", "Ichiro (es el primer hijo)", "Kuma (significa oso)", "Kenji (saludable, sano)", "Kiku (Flor del crisantemo)", "Kin (oro)", "Kichiro (el niño de la fortuna)", "Kazuki (deseo y esperanza)", "MouKou (tigre feroz)", "Orochi (la gran serpiente)", "Puchi (diminuto, pequeño)", "Shiro (de color blanco)", "Sora (cielo)", "Takeshi (fuerte)", "Takao (héroe)", "Toshi (alerta, inteligente)", "Yuki (elegante, feliz/ Nieve)", "Yoshiro (correcto, hombre bueno)", "Yuji (hijo valiente)", "Asia", "Akiles", "Arabia", "Bolita", "Chanel", "Champion (campeón)", "Chino", "Dior", "Fluffy (peludo)", "Lanitas", "Néstor", "Orient", "Peludo", "Pelos", "Príncipe", "Persa", "Pachá", "Peluca", "ZapAngel", "Angie", "Azul", "Bandit (bandido)", "Blue (azul)", "Celeste", "Calcetines", "Coco", "Chico", "Chocolate", "Guantes", "Gunter", "Nube", "Niño", "Nepal", "Piky", "Siam", "Thai", "Twitter", "Waldo", "Gold (oro)", "Goldie", "Güero", "Rubito", "Tiger", "Leo", "Sol", "Sunny (soleado)", "Naranjito", "Dólar", "Aurum", "Rayito", "Algodón", "Muñeco", "Plumita", "Snow (nieve)", "Snowy", "Blanquito", "Bianco", "Nube", "Copito", "Copi", "Cotton (algodón)", "Milky (de leche)", "Ángel", "Anubis", "Blacky", "Tizón", "Noche", "Dark (oscuro)", "Morito.", "Falcon", "Nero", "Panda ", "Oreo ", "Dominó", "Akhenatón", "Amón", "Atón", "Apis", "Anubis", "Cairo", "Calvito", "Faraón", "Giza", "Horus", "Nilo", "Pelusa", "Papiro", "Osiris", "Ptolomeo", "Ramses", "Ra", "Set", "Thot", "Tutankamón", "Doraemon (manga, series y películas de anime)", "Meowth (Pokemon)", "Happy (gato de Fairy Tail)", "Yourichi Sihouin (gato negro de Bleach)", "Lector (Fairy Tail)", "Chesire Cat (Pandora Hearts)", "Chii (Chiis Sweet Home)", "Jiji (Kiki’s Delivery Service)", "Gatomon (Digimon Adventure)", "Kyle (Under the moon)", "Sakamoto (My ordinary life)", "Kuro (Blue exorcist)", "Uri (reborn)", "Achilles", "Ajax", "Amadeus", "Ambrose", "Amos", "Apache", "Arlo", "Ash", "Augustus", "Aztec", "Baxter", "Beau", "Bogart", "Bomber", "Brady", "Bronson", "Broody", "Bugsy", "Buster", "Cadbury", "Casanova", "Catbert", "Chester", "Chevy", "Chomps", "Clyde", "Colonel", "Dalton", "Dante", "Darrow", "DaVinci", "Dean", "Dilbert", "Double", "Seven", "Duke", "Earl", "Eastwood", "Elway", "Excalibur", "Fabio", "Felix", "Fenton", "Finn", "Floyd", "Gideon", "Gil", "Graham", "Harrison", "Hickory", "Hobbs", "Hutch", "Jackson", "Jenner", "Keegan", "King", "Linux", "Luxor", "Macho", "Maestro", "Mogul", "Nelson", "Niles", "Nubby", "Malley", "Odie", "Orlando", "Pacey", "Palmer", "Perkins", "Prince", "Quentin", "Quimby", "Rasta", "Razo", "Ricky Ticky Tabby", "Riff Raff", "Ringo", "Ruddykins", "Sargeant", "Scorpio", "Sergio", "Shaq", "Teddy", "Theo", "Tiberius", "Tripper", "Truman", "Turbo", "Usher", "Waldo", "Whitman", "Wycliff", "Xavier", "Zepplin", "Zigfried", "Ziggy", "Unique female cat names.", "Abba", "Acura", "Adele", "Aida", "Aiko", "Aki", "Amaya", "Ambroisa", "Amore", "Angel", "Apricot", "Aspen", "Asrta", "Athena", "Autumn", "Barbie", "Biana", "Bliss", "Bonita", "Boots", "Bubbles", "Burgundy", "Butterscotch", "Buttons", "Calia", "Celeste", "Cha Cha", "Chakra", "Chanel", "Cheerio", "Cheesecake", "Cheri", "Chic", "Chicklet", "China", "Cinnamon", "Cleopatra", "Cookie", "Coral", "Countess", "Cuddles", "Cupcake", "Cutsie", "Dandelion", "Darlene", "Destiny", "Dior", "Dixie", "Dolly", "Dot", "Eden", "Ellie", "Elvira", "Emmy", "Enya", "Evita", "Fancy", "Felicity", "Fifi", "Friskie", "Gardenia", "Gemma", "Georgie", "Gidget", "Godiva", "Goldie", "Gracie", "Gucci", "Gypsy", "Harlow", "Harmony", "Heidi", "Hissy", "Honey", "Ida", "Ima", "Iris", "Isis", "Ivory", "Jada", "Jade", "Jana", "Jewel", "Jipsee", "June", "Kenya", "Kia", "Kiki", "Kiwi", "Kokomo", "Ladybug", "Layla", "Littlebit", "Lollypop", "Lovebug", "Marshmallow", "Mimsy", "Neela", "Nikia", "Nokia", "Nutmeg", "Odette", "Paisley", "Peaches", "Pearl", "Periwinkle", "Princess", "Queenie", "Rainbow", "Razzie", "Ribbon", "Rizzo", "Roxy", "Ruby", "Sabrina", "Sahara", "Sapphire", "Savannah", "Selby", "Selena", "Sierra", "Sissy", "Skyler", "Slippers", "Taffy", "Tasha", "Tawny", "Tula", "Tulip", "Uma", "Vera", "Wanda", "Xany", "Yoko", "Zoe", "Zola", "Zula", "Ace", "Alderon", "Almond", "Asa", "Avalon", "Bacon", "Badger", "Bamboo", "Barley", "Biscuit", "Blackjack", "Boo Boo", "Bug", "Cashew", "Chompz", "Chubbs", "Cody", "Crouton", "Curly", "Dagger", "Digger", "Dinger", "Dinky", "Furball", "Furby", "Gadget", "Gopher", "Hershey", "Jelly", "Jersey", "Jiggles", "Jinxy", "Jitterbug", "Juniper", "Kabuki", "Kinko", "Kobi", "Lemmy", "Lex", "Locke", "Macintosh", "Mackie", "Max", "Muffin", "Nacho", "Nemo", "Neopolitan", "Nibbles", "Niko", "Noodles", "Noogie", "Nugget", "Oakley", "Oatmeal", "Opie", "Oreo", "Panda", "Patches", "Peppa", "Pepper", "Percy", "Pickles", "Pizza", "Pookie", "Pumpkin", "Ramsey", "Random", "Reagan", "Reese", "Ren", "Rocket", "Ryder", "Sassafrass", "Scrapper", "Smokey", "Spazzy", "Taco", "Taylor", "Tiger", "Toby", "Toffee", "Tortilla", "Tricky", "Triscuit", "Truffle", "Tummy", "Waffles", "Walnut", "Widget", "Yummy", "Agnes", "Allyn", "Altalune", "Amada", "Anaca", "Apollo", "Ariela", "Arkadina", "Arlo", "Arusha", "Audio", "Aviana", "Axel", "Bean", "Bear", "Bing", "Bingham", "Birdie", "Blue Ivy", "Bluebell", "Blythe", "Bodhi", "Booker", "Bowie", "Briar", "Bronx", "Brooklyn", "Chicago", "Clio", "Coco", "Coco", "Cosima", "Cricket", "Cyrus", "Daisy", "Delilah", "Denim", "Destry", "Diezel", "Dilys", "Doone", "Dream", "Egypt", "Elias", "Elsie", "Elula", "Emerson", "Ennio", "Everest", "Faith", "Fifi", "Florence", "Flynn", "Frankie", "Fuchsia", "Future", "Gaia", "Genoveva", "Gravity", "Gulliver", "Hal", "Harlow", "Harper", "Hart", "Haven", "Hayes", "Homer", "Honor", "Hopper", "Huckleberry", "Ignatius", "India", "Indiana", "Java", "Journey", "Kai", "Kal-El", "Kash", "Keen", "Kit", "Kulture", "Kyla", "Lark", "Lennon", "Lio", "Livingston", "Locklyn", "Lottie", "Lourdes", "Lula", "Luna", "Maddox", "Maple", "Marlowe", "Mason", "Midnight", "Milan", "Miles", "Miriam", "Monroe", "Monte", "Moroccan", "Mowgli", "Nahla", "North", "Onyx", "Otis", "Otter", "Pearl", "Penelope", "Phinnaeus", "Pilot", "Prince", "Puma", "Racer", "Rae", "Rainbow", "Ransom", "Rayne", "Reign", "Reiley", "Remington", "Rex", "River", "Roman", "Romilly", "Rosalind", "Royal", "Rumi", "Sage", "Sailor", "Saint", "Santiago", "Satchel", "Seraphina", "Seven", "Shiloh", "Silas", "Sir", "Sonny", "Sparrow", "Stella", "Stormi", "Story", "Strummer", "Sunday", "Sunny", "Suri", "Tallulah", "Tennessee", "Theodora", "Titan", "Trixie", "True", "Usher", "Vida", "Violet", "Wilder", "Willow", "Winter", "Wyatt", "Wylda", "Zolten", "Zuma", "Abu", "Aladdin", "Alice", "Ariel", "Baloo", "Bambi", "Bashful", "Baymax", "Beast", "Belle", "Boo", "Bruce", "Bubbles", "Buzz", "Charming", "Cinderella", "Cogsworth", "Crush", "Darla", "Dash", "Dinah", "Doc", "Dopey", "Dory", "Duchess", "Dumbo", "Elastigirl", "Esmerelda", "Fauna", "Flora", "Flounder", "Flower", "Gaston", "Genie", "Gill", "Go Go", "Grumpy", "Gus Gus", "Happy", "Hera", "Hercules", "Hiro", "Iago", "Jane", "Jasmine", "Jessie", "Joy", "Judy", "Kronk", "Kuzco", "Lady", "Lilo", "Lumiere", "Marlin", "Meg", "Merida", "Merlin", "Merryweather", "Mike Wazowski", "Mishu", "Moana", "Mufasa", "Mulan", "Nala", "Naveen", "Nemo", "Pacha", "Perdy", "Pongo", "Pumbaa", "Rafiki", "Rajah", "Ralph", "Rapunzel", "Rex", "Scar", "Sebastian", "Simba", "Sleepy", "Sneezy", "Squirt", "Stitch", "Sulley", "Tadashi", "Tarzan", "Tiana", "Timon", "Tinkerbell", "Triton", "Ursula", "Vanellope", "Wasabi", "Wendy", "Woody", "Yzma", "Zazu", "Zeus", "Aesop", "Aragorn", "Aslan", "Atticus", "Augie", "Beowulf", "Bilbo", "Cedric", "Crookshanks", "Dartagnan", "Eloise", "Finch", "Fitzgerald", "Frodo", "Gale", "Gandalf", "Gatsby", "Ginny", "Gollum", "Hannibal", "Harry", "Hazel", "Hermione", "Holden", "Katniss", "Kipling", "Legalos", "Lolita", "Matilda", "Moriarty", "Peeta", "Pippi", "Prim", "Radley", "Scarlett", "Scout", "Seuss", "Sherlock", "Ulysses", "Watson", "Weasley", "Zelda", "Apollo", "Balboa", "Bogart", "Bruiser", "Buttercup", "Cyclops", "Darth Vader", "Doolittle", "Durden", "Ewok", "Ferris", "Fievel", "Gizmo", "Goldfinger", "Han Solo", "Inigo", "Keanu", "Kenobi", "Leia", "Morpheus", "Neo", "Optimus Prime", "Phoenix", "Rambo", "Ripley", "Rocky", "Rogue", "Skywalker", "Storm", "Vito", "Wolverine", "Yoda", "Animal", "Archie", "Arya", "Bam Bam", "Boober", "Buffy", "Bugs", "Carrie", "Cersei", "Charlotte", "Chekov", "Daenerys", "Daffy", "Drogon", "Dunphy", "Fonzie", "Fozzie", "Giles", "Gilligan", "Ginger", "Gobo", "Gonzo", "Goofy", "Homer", "Itchy", "Jaime", "Kermit", "Kirk", "Leonard", "Linus", "Lucy", "Marge", "McCoy", "Mickey", "Minnie", "Miranda", "Miss Piggy", "Mokey", "Mr. Big", "Mulder", "Nymeria", "Penny", "Pepe", "Pikachu", "Pluto", "Popeye", "Ricky", "Rizzo", "Samantha", "Sansa", "Scooter", "Scotty", "Scully", "Seinfeld", "Sheldon", "Simpson", "Skipper", "Snoopy", "Soprano", "Spock", "Sractchy", "Sulu", "Trekky", "Tweety", "Tyrion", "Uhura", "Wembley", "Xander", "Xena", "Yogi", "Zenon", "Zorro", "Abraham Lynxin", "Ali Cat", "Anderson Pooper", "Bing Clawsby", "Brad Kitt", "Butch Catsidy", "Cat Benatar", "Cat Damon", "Cat Middleton", "Cat Sajak", "Cat Stevens", "Cat Winslet", "Catalie Portman", "Catnip Everdeen", "Catpernicus", "Catrick Swayze", "Catsanova", "Catsy Cline", "Catticus Finch", "Catzilla", "Charles Lickens", "Cindy Clawford", "Clawdia", "Cleo Catra", "Colin Furth", "Dalai Clawma", "David Meowie", "Diane Kitten", "Don Drapurr", "Draco Meowfoy", "Drew Hairymoore", "Ebefleazer Scrooge", "Edward Scissor Paws", "Elvis Catsley", "Emily Lickinson", "Ferris Mewler", "Fleas Witherspoon", "Fleyonce Knowles", "Fuzz Aldrin", "Genghis Cat", "George Catstanza", "George Cloonflea", "Great Catsby", "Hairy Potter", "Halle Purry", "Hello Kitty", "Holden Clawfield", "J.R.R. Tolkitten", "Jane Pawsten", "Jennifurr", "Jennifurr Aniston", "JK Meowling", "Jude Paw", "Juliet Catulet", "Katy Purry", "Kit-Kat", "Kitty Cudi", "Kitty Poppins", "Leopardo DiCatrio", "LeVar Purrton", "Lickeris", "Lionel Itchy", "Lucifur", "Luke Skywhisker", "Margaret Scratcher", "Mariah Hairy", "Meowly Cyrus", "Meowrio Lopez", "Mr. Meowgi", "Neil Catrick Harris", "Notorious C.A.T.", "Oedipuss", "Oprah Whisker", "Paw McCartney", "Paw Newman", "Pawdrey Hepburn", "Picatso", "Puma Thurman", "Ricky Purrvais", "Ron Fleasley", "Ron Furgandy", "Ryan Fleacrest", "Santa Claws", "Sir Purr A Lot", "Tabbytha", "Teri Scratcher", "Tina Spay", "Tobey Catguire", "Veronicat", "Walt Whiskers", "Whispurr", "Winston Furchill", "Achilles", "Ali", "Angus", "Apollo", "Beast", "Big Boi", "Big Boy", "Boomer", "Bruno", "Bubba", "Colossus", "Conan", "Czar", "Dough Boy", "Duke", "Emperor", "Gordon", "Grand", "Grant", "Hoss", "Hugo", "King", "Lord", "Magnum", "Mr. T", "Quarterback", "Rex", "Tank", "Viking", "Bertha", "Duchess", "Ellie", "Fatima", "Fatma", "Lady", "Marge", "Queenie", "Amazon", "Beefcake", "Behemoth", "Belly", "Big", "Big Foot", "Biggy", "Blimpy", "Buddha", "Captain", "Dragon", "Epic", "Fluffy", "Fridge", "Giant", "Hefty", "Hurley", "Husky", "Jiggles", "Koa", "Mac", "Major", "Mammoth", "Max", "Meaty", "Mega", "Mighty", "Mondo", "Monster", "Pharaoh", "President", "Quake", "Roly", "Stocky", "Stubby", "T-Rex", "Titanic", "Tummy", "Uber", "Waddles", "Names for fat, lazy cats.", "Blob", "Blubber", "Butterball", "Butterworth", "Chubbalub", "Chubby", "Chubbles", "Chubz", "Chunk", "Chunk Norris", "Chunky", "Garfield", "Gordo", "Gordy", "Jumbo", "Lumpy", "Poof", "Porky", "Pudge", "Pudgers", "Tubbs", "Tubby", "Big Wheel", "Ram", "Ranger", "Tacoma", "Titan", "Tonka", "Tundra", "Ant", "Atom", "Baby", "Bug", "Button", "Dot", "Molecule", "Munchkin", "Slim", "Speck", "Teeny", "Thimble", "Thumbelina", "Tinkerbell", "Tiny", "Big Ben", "Eiffel", "Empire", "Giza", "Hoover", "Machu Pichu", "Rushmore", "Sphinx", "Taj", "Trevi", "Yosemite", "Bagheera", "Balboa", "Baloo", "Baymax", "Bowser", "Cartman", "Cheshire", "Clifford", "Cookie Monster", "Crookshanks", "Cujo", "Darth", "Dudley", "Fat Louie", "Frankenstein", "Godzilla", "Goliath", "Gus Gus", "Hagrid", "Heathcliff", "Heffalump", "Hercules", "Hulk", "Igor", "Jabba", "King Kong", "Kraken", "Krypton", "Megatron", "Miss Piggy", "Mr. Big", "Mufasa", "Nala", "Optimus Prime", "Pugsley", "Pumbaa", "Raiju", "Rajah", "Rambo", "Rocky", "Sasquatch", "Scar", "Simba", "Spartacus", "Sully", "Thanos", "Thor", "Tigger", "Ultron", "Ulysses", "Ursula", "Vader", "Voltron", "Zeus", "Aries", "Cassiopeia", "Gemini", "Jupiter", "Leo", "Libra", "Mars", "Mercury", "Neptune", "Orion", "Pluto", "Saturn", "Sunny", "Taurus", "Venus", "Africa", "Asia", "Bombay", "Brazil", "Cairo", "Chicago", "China", "India", "London", "Montana", "Paris", "Rio", "Russia", "Seoul", "Sydney", "Texas", "Tokyo", "Bear", "Bengal", "Buffalo", "Canyon", "Cheetah", "Cliff", "Elephant", "Everest", "Grizzly", "Hippo", "Hurricane", "Lava", "Leopard", "Lion", "Lynx", "Moose", "Mountain", "Orca", "Ox", "Panther", "Puma", "Rhino", "Sequoia", "Sierra", "Snowball", "Thunder", "Tiger", "Tornado", "Tsunami", "Volcano", "Whale", "Avocado", "Bacon", "Big Mac", "Bon Bon", "Butter", "Brownie", "Burrito", "Cake", "Cheddar", "Cheeseburger", "Cheesecake", "Cheeto", "Chip", "Chocolate", "Cookie", "Cookie Dough", "Crisco", "Cupcake", "Donut", "Dorito", "Dulce", "Eggo", "French Fry", "Gnocchi", "Ham", "Hershey", "Hot Dog", "Jello", "Jelly", "Marshmallow", "Meatloaf", "Milkshake", "Muffin", "Oreo", "Pancake", "Pepper", "Pie", "Pillsbury", "Pizza", "Popcorn", "Pork Chop", "Pudding", "Pumpkin", "Reeses", "Salt", "Sausage", "Slim Jim", "Taco", "Twinkie", "Waffles", "Whopper"];
  final _random = new Random();
  int min = 0;
int max = 2;
  int next(int min, int max) => min + _random.nextInt(max - min);
  
  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: /*1*/ (context, i) {
          if (i.isOdd) return Divider(); /*2*/

          final index = i ~/ 2; /*3*/
          if (index >= _suggestions.length) {
            _suggestions.add(_names[_random.nextInt(_names.length)]);
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(String pair) {
    final bool alreadySaved = _saved.contains(pair);
    return ListTile(
      title: Text(
        pair,
        style: _biggerFont,
      ),
      trailing: Icon(
      alreadySaved ? Icons.favorite : Icons.favorite_border,
      color: alreadySaved ? Colors.red : null,
    ), 
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else { 
            _saved.add(pair); 
          }
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cat Name Generator'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.list), onPressed: _pushSaved),
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          final Iterable<ListTile> tiles = _saved.map(
            (String pair) {
              return ListTile(
                title: Text(
                  pair,
                  style: _biggerFont,
                ),
              );
            },
          );
          final List<Widget> divided = ListTile
            .divideTiles(
              context: context,
              tiles: tiles,
            )
            .toList();
          return Scaffold(
            appBar: AppBar(
              title: Text('Saved Names'),
            ),
            body: ListView(children: divided),
          );                      
        },
      ),  
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}
