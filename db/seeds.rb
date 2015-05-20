user_list = [
  ["Burnett", "Adkins", "burnettadkins@greeker.com"],
  ["Burnett", "Adkins", "burnettadkins@greeker.com"],
  ["Wall", "Wilcox", "wallwilcox@greeker.com"],
  ["Justine", "Rojas", "justinerojas@greeker.com"],
  ["Stone", "Bradshaw", "stonebradshaw@greeker.com"],
  ["Roxanne", "Wiggins",  "roxannewiggins@greeker.com"],
  ["Harding",  "Hull",  "hardinghull@greeker.com"],
  ["Amparo",  "Cain",  "amparocain@greeker.com"],
  ["Nichole",  "Wooten",  "nicholewooten@greeker.com"],
  ["Karina", "Graham", "karinagraham@greeker.com"],
  ["Celia",  "Justice",  "celiajustice@greeker.com"],
  ["Clay",  "Gallegos",  "claygallegos@greeker.com"],
  ["Tabatha", "Pruitt", "tabathapruitt@greeker.com"],
  ["Elvira", "Byrd", "elvirabyrd@greeker.com"],
  ["Angeline", "Cooper", "angelinecooper@greeker.com"],
  ["Fitzpatrick", "Moon", "fitzpatrickmoon@greeker.com"],
  ["Angeline", "Glass", "angelineglass@greeker.com"],
  ["Porter", "Calhoun", "portercalhoun@greeker.com"],
  ["Mable", "Erickson", "mableerickson@greeker.com"],
  ["Cotton", "Levy", "cottonlevy@greeker.com"],
  ["Nellie", "Mcfarland", "nelliemcfarland@greeker.com"],
  ["Ball", "Cook","ballcook@greeker.com"],
  ["Helga","Stout","helgastout@greeker.com"],
  ["Lula","Kelley","lulakelley@greeker.com"],
  ["Hattie","James","hattiejames@greeker.com"],
  ["Guerrero","Trevino","guerrerotrevino@greeker.com"],
  ["Brown","Rodriquez","brownrodriquez@greeker.com"],
  ["Alexis",  "Velazquez", "alexisvelazquez@greeker.com"],
  ["Hoffman", "Franco", "hoffmanfranco@greeker.com"],
  ["Valenzuela", "Buckner", "valenzuelabuckner@greeker.com"],
  ["Bethany", "Dyer", "bethanydyer@greeker.com"],
  ["Taylor", "Bradley", "taylorbradley@greeker.com"],
  ["Garcia", "Marquez", "garciamarquez@greeker.com"],
  ["Candy", "Russell", "candyrussell@greeker.com"],
  ["Butler", "Conner", "butlerconner@greeker.com"],
  ["Vickie", "Butler", "vickiebutler@greeker.com"],
  ["Delores", "Rojas", "deloresrojas@greeker.com"],
  ["Lesley", "Rocha", "lesleyrocha@greeker.com"],
  ["Willa", "Harvey", "willaharvey@greeker.com"],
  ["Isabel", "Herring", "isabelherring@greeker.com"],
  ["Isabel", "Herring", "isabelherring@greeker.com"],
  ["Tia", "Case", "tiacase@greeker.com"],
  ["Lopez", "Watkins", "lopezwatkins@greeker.com"],
  ["Spence", "Solomon", "spencesolomon@greeker.com"],
  ["Gabriela", "Barber", "gabrielabarber@greeker.com"],
  ["Odessa", "Stevenson", "odessastevenson@greeker.com"],
  ["Henson", "Paul", "hensonpaul@greeker.com"],
  ["Potts", "Vance", "pottsvance@greeker.com"],
  ["Nguyen", "Scott", "nguyenscott@greeker.com"],
  ["Carissa", "Oneill", "carissaoneill@greeker.com"],
  ["Jeanne", "Kirk", "jeannekirk@greeker.com"],
  ["Lillie", "Stevenson", "lilliestevenson@greeker.com"],
  ["Dawson", "Bullock", "dawsonbullock@greeker.com"],
  ["Blake", "Frank", "blakefrank@greeker.com"],
  ["Patrick", "Witt", "patrickwitt@greeker.com"],
  ["Bernice", "Cervantes", "bernicecervantes@greeker.com"],
  ["Phoebe", "Vasquez", "phoebevasquez@greeker.com"],
  ["Newton", "Pittman", "newtonpittman@greeker.com"],
  ["Hurst", "Langley", "hurstlangley@greeker.com"],
  ["Case", "Mayer", "casemayer@greeker.com"],
  ["Calderon", "Faulkner", "calderonfaulkner@greeker.com"],
  ["Mara", "Carr", "maracarr@greeker.com"],
  ["Simone", "Reed", "simonereed@greeker.com"],
  ["Augusta", "Lawrence", "augustalawrence@greeker.com"],
  ["Gardner", "Delacruz", "gardnerdelacruz@greeker.com"],
  ["Ware", "Zimmerman", "warezimmerman@greeker.com"],
  ["Lucy", "Workman", "lucyworkman@greeker.com"],
  ["Lorna", "Snyder", "lornasnyder@greeker.com"],
  ["Britney", "Key", "britneykey@greeker.com"],
  ["Suarez", "Sherman", "suarezsherman@greeker.com"],
  ["Phyllis", "Luna", "phyllisluna@greeker.com"],
  ["Jacquelyn", "Riley", "jacquelynriley@greeker.com"],
  ["Velez", "Talley", "veleztalley@greeker.com"]
]

user_list.each do |fname, lname, email|
  User.create(
      first_name: fname,
      last_name: lname,
      email: email,
      preferred_matches: User.randomize_user_pref,
      programmer_rating: Random.new.rand(1..5)
      )
end
