puts "Cleaning database"
Recipe.destroy_all
Category.destroy_all
User.destroy_all

puts "Creating categories"

CATEGORIES = ["Entrées et apéros", "Plats principaux végétariens", "Plats principaux de viande", "Plats principaux de poisson", "Desserts"]

CATEGORIES.each do |category|
  Category.create!(name: category)
end

ENTREE = Category.find_by(name: "Entrées et apéros" )
PLAT_VEG = Category.find_by(name: "Plats principaux végétariens" )
PLAT_VIANDE = Category.find_by(name: "Plats principaux de viande" )
PLAT_POISSON = Category.find_by(name: "Plats principaux de poisson" )
DESSERT = Category.find_by(name: "Desserts" )

p "========================================================================="

puts "Creating initial publisher"

initial_publisher = User.create!(email: 'greg@recettes.com', username: "Greg", password: "123456", password_confirmation: "123456")


p "========================================================================="

puts "Creating recipes"

RECIPES = [
  { title: "Foie Gras",
    author: "Daddy",
    ingredients: "
    <ul>
      <li>1,8 ou 2kg de foie gras</li>
    </ul>",
    description:"
      <ul><li>Faire tremper les foies, les nettoyer et bien les essuyer après les avoir dénervés</li>
        <li>Saler et poivrer tous les morceaux, puis arroser selon la préférence de porto ou vin doux</li>
        <li>Mettre dans la terrine et couvrir d’aluminium</li>
        <li>Bain marie à four fort (thermo 7 ou 8) pendant plus ou moins 15 min. Baisser une fois fondu.</li>
        <li>Puis 1h à thermo 5.</li>
        <li>S’il fond trop vite, le baisser à four ouvert. Refroidir à l’extérieur.</li>
      </ul>
    ",
    category: ENTREE
  },
  { title: "Pâte à choux pour gougères",
    author: "Marilou",
    ingredients:"
    <ul>
      <li>125gr de farine</li>
      <li>100gr de beurre</li>
      <li>25 cl d’eau chaude</li>
      <li>4 œufs</li>
      <li>100 gr de Gruyère</li>
    </ul>
    ",
    description: "
      <ul>
        <li>Mélanger le beurre et l’eau sur le feu puis quand ça bout, rajouter la farine d’un coup. Quand la pâte n’accroche plus, sortir du feu et ajouter les œufs un par un.</li>
        <li>La pâte doit être comme un ruban.</li>
        <li>Rajouter ensuite le gruyère.</li>
        <li>Faire des petits tas à la cuillère  et faire cuire à four chaud, jusqu’à que ce soit gonflé et doré.</li>
      </ul>
    ",
    category: ENTREE
  },
  { title: "Pain de poisson ",
    author: "?",
    ingredients: "
    <ul>
      <li> 3 œufs</li>
      <li> 5 cuillérées de riz</li>
      <li> Un poing de pain trempé dans le lait</li>
      <li> 250gr de baudroie</li>
      <li> Safran</li>
    </ul>
    ",
    description: "
      <ul>Faire cuire le riz et le poisson bouilli à part.
        <li>Hacher le poisson, mélanger le riz au pain trempé et mettre une bonne pincée de safran.</li>
        <li>Beurrer un plat et mettre au four</li>
      </ul>
    ",
    category: ENTREE
  },
  { title: "Pain de Gêne délicieux",
    author: "Bonne Maman",
    ingredients: "
      <ul>
        <li>80 gr de beurre <li> 2 cuillères à soupe de farine</li>
        <li>1/4 de lait, 80 gr de fromage rapé</li>
        <li>4 jaunes d'oeufs</li>
        <li>chapelure</li>
        <li>coquilles</li>
        <li>moules</li>
        <li>champignons de Paris</li>
        <li>optionnel : jambon d'York</li>
      </ul>
    ",
    description: "
      </ul>
        <li>Faire une béchamel avec 80gr de beurre, 2 cuillérées de farine, ¼ de lait.</li>
        <li>Quand elle est cuite, ajouter 80gr de fromage râpé, 4 jaunes d’œufs et les blancs montés en neige.</li>
        <li>Mettre le tout dans un moule bien beurré et entourer de chapelure.</li>
        <li>Faire cuire 1h30 au bain marie.</li>
        <li>Une fois démoulé, le servir entouré d’une sauce béchamel dans laquelle on met l’intérieur de coquilles, moules, truffes et champignons de Paris.</li>
        <li>On peut aussi, et cela est supérieur, entourer le moule de tranches d’un bon jambon d’York. Alors on lui donne le nom de Pain d’York.</li>
      </ul>
    ",
    category: ENTREE
  },
  { title: "Salade de Pâques à la Mazamétaine",
    author: "Manou",
    ingredients: "
      <ul>
        <li>Foie de porc séché</li>
        <li>Oignons vieux</li>
        <li>Oignons frais</li>
        <li>Artichauts frais, les petits</li>
        <li>Radis</li>
        <li>Œufs durs</li>
      </ul>
      ",
    description: "
      <ul>
        <li>Couper le foie en petits morceaux, si trop salé, le faire dégorger dans de l’eau.</li>
        <li>Tout couper en petits morceaux</li>
        <li>Faire revenir le foie coupé en dés, retirer.</li>
        <li>Faire revenir l’oignon vieux coupé, transparent.</li>
        <li>Mélanger, foie, oignons vieux, oignons frais et radis coupés tout petits, et cœurs d’artichauts frais.</li>
        <li>Ajouter vinaigre, éventuellement un peu d’huile, pas de sel.</li>
        <li>Réserver au frais</li>
        <li>Servir avec les œufs durs coupés en 4.</li>
      </ul>
    ",
    category: ENTREE
  },
  { title: "Pain de crabe (pour 8 personnes)",
    author: "Marilou",
    ingredients: "
      <ul>
        <li>4 boites de crabes égouttés (au moment de Noel, Aldi et Lidl en vendent d’excellents)</li>
        <li>5 granny Smith râpées et bien pressées dans un torchon sec</li>
        <li>5 œufs durs hachés menus</li>
        <li>1 grand bol de mayonnaise citronnée et maison </li>
        <li>Herbes variées (ciboulette, persil)</li>
      </ul>
      ",
    description: "
      <ul>
        <li>Tout mélanger délicatement et mettre dans un moule à Baba, au frais plusieurs heures.</li>
        <li>Servir avec un gaspacho.</li>
      </ul>
    ",
    category: ENTREE
  },
  { title: "Verrines au parmesan",
    author: "Flo",
    ingredients: "
      <ul>
        <li>200gr de parmesan</li>
        <li> 400gr de crème</li>
        <li> ½ verre de lait</li>
      </ul>
    ",
    description: "
      <ul>
        <li>Une fois fondu, ajouter 15g de poudre d’amande</li>
        <li>Mélanger avec le gaspacho</li>
      </ul>
    ",
    category: ENTREE
  },
  { title: "Aubergines en béchamel",
    author: "Bonne Maman",
    ingredients: "
      <ul>
        <li>Aubergines</li>
        <li>Huile d'olive</li>
        <li>Persil</li>
        <li>Ail</li>
        <li>Beurre</li>
        <li>Chapelure</li>
        <li>80 gr de beurre</li>
        <li>2 cuillères à soupe de farine</li>
        <li>1/4 de lait</li>
      </ul>
    ",
    description: "
      <ul>
        <li>Prendre de jolies aubergines</li>
        <li>Les partager en deux, creuser l’intérieur en conservant dans une assiette ce que l’on sort</li>
        <li>Les faire roussir à l’huile dans la poêle</li>
        <li>Faire une béchamel sans fromage, ajouter persil et très peu d’ail et l’intérieur des aubergines que l’on fait cuire à part dans le beurre</li>
        <li>Mélanger le tout, en farcir les aubergines et couvrir de chapelure</li>
        <li>Mettre au four</li>
      </ul>
    ",
    category: ENTREE
  },
  { title: "Pain de lotte",
    author: "?",
    ingredients: "
      <ul>
        <li>1 queue de lotte, pochée et coupée en morceaux</li>
        <li>8 œufs battus</li>
        <li>4 cuillères à soupe de crème fraiche</li>
        <li>3 cuillères à soupe de concentré de tomates</li>
      </ul>
    ",
    description: "
      <ul>
        <li>Tout mélanger et faire cuire au bain marie dans un moule à cake ou à baba</li>
      </ul>
    ",
    category: ENTREE
  },
  { title: "Vol au vent",
    author: "?",
    ingredients: "
      <ul>
        <li>lard</li>
        <li>beurre</li>
        <li>ris de veau</li>
        <li>cervelle</li>
        <li>rognons</li>
        <li>crêtes de coq</li>
        <li>blanc de volaille</li>
        <li>oignons</li>
        <li>fond roux</li>
        <li>bouillon</li>
        <li>Madère</li>
        <li>Jaune d'oeuf</li>
      </ul>
    ",
    description: "
      <ul>
        <li>Passer dans une casserole avec lard et beurre le ris de veau, la cervelle (préalablement blanchis), rognons et crête de coq, blanc de volailles, le tout coupé en gros dés, puis quelques oignons.</li>
        <li>Faire un roux blond. Mouiller d’un bon bouillon dégraissé et d’un demi<li>verre de Madère.</li>
        <li>Laisser cuire tout doucement.</li>
        <li>Avant de verser dans la croute, lier avec un jaune d’œuf.</li>
      </ul>
    ",
    category: ENTREE
  },
  { title: "Galantine de volaille en terrine",
    author: "Bonne Maman et de Mamy",
    ingredients: "
      <ul>
        <li>Une poule (vivante !)</li>
        <li>50 gr de filet de cochon et de veau par poule</li>
        <li>sel</li>
        <li>poivre</li>
        <li>truffes</li>
        <li>foie d'oie</li>
        </ul>
      ",
    description: "
      <ul>
        <li>Tuer la poule, la flamber, fendre la peau (la poule étant encore chaude) sur le milieu du dos et la peler entièrement.</li>
        <li>Mettre cette peau de côté.</li>
        <li>Lever les filets et les garder entiers. Désosser alors les cuisses et les entrecuisses et toutes les parties charnues de la volaille.</li>
        <li>Passer cette viande à la machine et y joindre le foie de la poule et 100g de filet de cochon et de veau (quantité pour 2 poules).</li>
        <li>Mettre 12 g de sel et 1 g de poivre par livre de farce.</li>
        <li>Bien mélanger le tout.</li>
        <li>Mettre alors la peau dans la terrine. Mettre, en pressant avec les doigts, un peu de farce, puis un filet, un peu de sel sur le filet, un peu de lard en petites lamelles, truffes, foie d’oie.</li>
        <li>Terminer par de la farce et couvrir le tout avec la peau de la poule.</li>
        <li>Faire cuire 3h.</li>
      </ul>",
    category: ENTREE
  },
  { title: "Gnocchis à la semoule",
    author: "Manou et Moucky",
    ingredients: "
      <ul>
        <li>1 litre de lait</li>
        <li>125 gr de semoule</li>
        <li>2 jaunes d’œuf</li>
        <li>100 gr de beurre, crème, gruyère</li>
      </ul>
    ",
    description: "
      <ul>
        <li>Faire chauffer ½ litre de lait, rajouter la semoule jusqu’à ce qu’elle soit cuite, il faut que ça fasse une pate assez épaisse.</li>
        <li>Rajouter 2 jaunes d’œuf.</li>
        <li>Faire une béchamel : fondre 80 gr de beurre, rajouter 60 gr de farine et faire bien cuire l’ensemble. Rajouter ensuite le ½ de lait.</li>
        <li>Dans un plat beurré, faire des petits tas à la cuillère à soupe, mettre la béchamel au<li>dessus, un peu de crème et le gruyère.</li>
        <li>Au four pour que ça gratine.</li>
      </ul>
      ",
    category: PLAT_VEG
  },
  { title: "Purée de carottes",
    author: "James de Coquet",
    ingredients: "
      <ul>
        <li>1 kg de carottes</li>
        <li>4 cs de crème <li> beurre</li>
        <li>comté</li>
        <li>crème fouettée</li>
      </ul>
    ",
    description: "
      <ul>
        <li>Faire cuire 1 kg de carottes à l’eau, les égoutter.</li>
        <li>Les mettre en purée, puis sur le feu pour les dessécher.</li>
        <li>Ajouter 4 cuillère à soupe de crème, du beurre et du comté râpé.</li>
        <li>Travailler jusqu’à ce que ça fasse un ruban.</li>
        <li>Mettre dans de grands moules individuels, chapeauter de crème fouettée et mettre à four  chaud pour que ça dore et glace.</li>
      </ul>
    ",
    category: PLAT_VEG
  },
  { title: "Beignets au fromage",
    author: "Bonne Maman",
    ingredients: "
      <ul>
        <li>2 verres d’eau</li>
        <li>Une pincée de sel</li>
        <li>50gr de beurre</li>
        <li>2 verres de farine</li>
        <li>50gr de gruyères râpés</li>
      </ul>
    ",
    description: "
      <ul>
        <li>Mettre les deux verres d’eau dans une casserole, une pincée de sel et 50gr de beurre.</li>
        <li>Dès que le beurre est fondue, mettre les 2 verres de farine, tout à la fois dans l’eau bouillante et remuer vivement.</li>
        <li>Quand la pâte n’adhère plus à la casserole, la retirer du feu.</li>
        <li>Quand la pâte est tiède, commencer à mettre, toujours hors feu, 4 œufs, un par quart d’heure environ.</li>
        <li>Laisser reposer du matin au soir.</li>
        <li>Mettre sur le feu une poêle avec beaucoup d’huile, et mettre dans la friture non bouillante une bonne cuillérée à café de pâte en ménageant un peu de place entre chaque beignet qui doubleront de volume pendant la cuisson.</li>
        <li>Quand la pâte est bien réussie, ils se retournent seuls dans la poêle.</li>
        <li>Egoutter en mettant les beignets dans une passoire.</li>
        <li>Servir chaud !</li>
      </ul>
    ",
    category: PLAT_VEG
  },
  { title: "Pâte levée  pour tarte aux Maroilles",
    author: " Moucky",
    ingredients: "
      Pour 2 tartes :
      <ul>
        <li>1 livre de farine</li>
        <li>4 jaunes d’œufs</li>
        <li>½ livre de beurre fondue</li>
        <li>Sel</li>
        <li>40 à 50gr de levure fraiche de boulanger fondue dans ½ verre d’eau tiède</li>
      </ul>
    ",
    description: "
      <ul>
        <li>Mélanger le tout. Etendre dans les tourtières et couvrir avec un torchon.</li>
        <li>Faire lever un peu au chaud.</li>
        <li>Rajouter un Maroilles coupé en morceaux, plus de la crème fraîche.</li>
        <li>Au four pour que la pâte soit bien levée et dorée</li>
      </ul>",
    category: PLAT_VEG
  },
  { title: "Daube de bœuf",
    author: "?",
    ingredients: "
      <ul>
        <li>1kg de gîte de bœuf</li>
        <li>6 carottes</li>
        <li>Petits oignons</li>
        <li>2 tranches de lard coupées en petits morceaux</li>
        <li>Couennes blanchies dans l’eau</li>
        <li>1 bouquet garni (thym, persil, laurier)</li>
      </ul>
    ",
    description: "
    <ul>
      <li>Faire revenir les oignons et les carottes dans de la graisse d’oie (ou canard / ou huile).</li>
      <li>Une fois roussi, ajouter le lard et faire dorer.</li>
      <li>Ajouter la viande, la faire dorer.</li>
      <li>Ajouter une cuillère à soupe de farine. Faire dorer une minute.</li>
      <li>Recouvrir de bon vin rouge. Le Genentière fût est parfait.</li>
      <li>Ajouter le bouquet garni et les couennes.</li>
      <li>Saler, poivrer, ajouter gousse d’ail entière.</li>
      <li>Cuisson à feu doux couvert. Fermer hermétiquement et laisser cuire 3 à 4h</li>
    </ul>",
    category: PLAT_VIANDE
  },
  { title: "Daube de sanglier",
    author: "Manou et de Moucky",
    ingredients: "
      <ul>
        <li>Couper en morceaux et mettre dans un récipient profond en marinade (pas de sel)</li>
        <li>3 cuillères à soupe de vinaigre</li>
        <li>Poivre 4 épices, thym, laurier</li>
        <li>½ verre d’huile</li>
        <li>2 carottes</li>
        <li>Céleri</li>
        <li>Un gros oignon</li>
        <li>¾ d’un bon rouge vieux</li>
      </ul>
    ",
    description: "
      <ul>
        <li>Mettre 2 à 3 jours à mariner au frigo en tournant tous les jours la viande</li>
        <li>Préparer un bouillon de viande et légumes sur le feu. Garder et dégraisser le bouillon. Un bouillon cube Bio fera aussi l’affaire !</li>
        <li>Cuisiner la daube de préférence la veille du diner</li>
        <li>Egoutter la viande, filtrer la marinade</li>
        <li>Faire revenir la viande dans un peu d’huile ou de graisse de canard, faire saisir puis la mettre dans un saladier</li>
        <li>La fariner et la remettre dans la cocotte avec un peu d’huile, d’oignons, échalotes et verser ½ verre de cognac chaud et l’enflammer hors du feu (et pas sous la hotte !)</li>
        <li>Quand les flammes sont éteintes, remettre sur le feu. Rajouter la marinade jusqu’à ce que la viande soit presque recouverte</li>
        <li>Rajoute encore une louche de bouillon déjà préparé</li>
        <li>Laisser cuire à feu moyen. Saler</li>
        <li>Cuire minimum 2h avec un couvercle</li>
        <li>Rajouter du potage si nécessaire (surtout pas de la marinade qui doit toujours cuire !)</li>
      </ul>
    ",
    category: PLAT_VIANDE
  },
  { title: "Poularde à la crème",
    author: "Manou",
    ingredients: "
      <ul>
        <li>1 Poule</li>
        <li>oignons</li>
        <li>clous de girofle</li>
        <li>carottes</li>
        <li>poireaux</li>
        <li>sel</li>
        <li>poivre</li>
        <li>béchamel</li>
        <li>crème fraiche</li>
        <li>4 jaunes do'euf</li>
        <li>citrons</li>
        <li>truffes</li>
        <li>riz</li>
      </ul>
    ",
    description: "
      <ul>
        <li>Faire cuire une belle poule dans un potage aux oignons, clous de girofle, carottes, poireaux, sel et poivre.</li>
        <li>Faire une béchamel avec le potage de la poule.</li>
        <li>Ajouter à la fin de la crème fraiche, hors du feu, puis lier la sauce avec 3 ou 4 jaunes d’œuf (toujours hors feu).</li>
        <li>Faire frémir.</li>
        <li>Ajouter citrons ou truffes.</li>
        <li>Mettre la sauce sur la poule découpée.</li>
        <li>Servir avec du riz</li>
        <li>On peut farcir la poularde avec du veau haché, du persil et un œuf.</li>
        <li>Faire un potage avec des perles du japon ou du vermicelle.</li>
      </ul>
    ",
    category: PLAT_VIANDE
  },
  { title: "Poulet au riz",
    author: "Mamie",
    ingredients: "
    <ul>
      <li>1 Poulet</li>
      <li>Huile d'olive</li>
      <li>sel</li>
      <li>poivre</li>
      <li>1 oignon</li>
      <li>2 gousses d'ail</li>
      <li>1 tomate</li>
      <li>1 piment rouge</li>
      <li>riz</li>
    </ul>
    ",
    description: "
      <ul>
        <li>Poulet coupé, salé, poivré.</li>
        <li>Le faire dorer dans l’huile pour qu’il soit presque cuit.</li>
        <li>Le sortir de la casserole et faire dorer 1 oignon haché fin, puis mettre 2 gousses d’ail, puis une tomate et 1 piment rouge coupés. Remuer</li>
        <li>Ajouter 2 cuillères à soupe de riz par personne et faire cuire en remuant.</li>
        <li>Ajouter les morceaux de poulet et les recouvrir d’eau.</li>
        <li>Faire cuire 20min.</li>
        <li>La consistance du riz est comme celui de la paella.</li>
      </ul>
    ",
    category: PLAT_VIANDE
  },
  { title: "Blanquette d’agneau",
    author: "?",
    ingredients: "
      <ul>
        <li>côtelettes d'agneau</li>
        <li>huile <li> 1 oignon</li>
        <li>1 cs de farine</li>
        <li>1 bouqet garni</li>
        <li>1 gousse d'ail</li>
        <li>mayonnaise</li>
        <li>vinaigre</li>
        <li>citron</li>
      </ul>
    ",
    description: "
      <ul>
        <li>Faire revenir à l’huile les côtelettes d’agneau. Retirer.</li>
        <li>Faire revenir un gros oignon haché dans le jus.</li>
        <li>Mettre une cuillère à soupe de farine dans le plat quand l’oignon a atteint un roux blond (doré).</li>
        <li>Faire blondir la farine et ajouter de l’eau ainsi que l’agneau (viande couverte).</li>
        <li>Ajouter un bouquet garni et un une gousse d’ail.</li>
        <li>Faire une petite mayonnaise avec 3 jaunes d’œufs puis lier hors feu la sauce.</li>
        <li>Faire attention de ne pas brosser la sauce en laissant sur le feu.</li>
        <li>Ajouter vinaigre et citron</li>
      </ul>
    ",
    category: PLAT_VIANDE
  },
  { title: "Lapin Lardorel ",
    author: "Manou",
    ingredients: "
      <ul>
        <li>1 lapin</li>
        <li>thym</li>
        <li>laurier</li>
        <li>oignons</li>
        <li>persillade</li>
        <li>cornichons</li>
        <li>vinaigre</li>
      </ul>
    ",
    description: "
      <ul>
        <li>Faire dorer le lapin coupé avec thym et laurier dans une grande poêle.</li>
        <li>Couvrir ensuite le lapin de beaucoup d’oignons et faire suer sans dorer. Couvrir et ne pas remuer jusqu’à la fin.</li>
        <li>Faire une persillade, avec de l’ail et du persil, y rajouter le foie cru haché, cornichons coupés fins puis vinaigre</li>
        <li>Déglacer le lapin avec cette persillade</li>
      </ul>
    ",
    category: PLAT_VIANDE
  },
  { title: "Lapin en sauce Saupiquet ",
    author: "Manou",
    ingredients: "
      <ul>
        <li>1 lapin</li>
        <li>1 oignon</li>
        <li>huile</li>
        <li>1 carotte</li>
        <li>jambon</li>
        <li>farine</li>
        <li>vin blanc</li>
        <li>laurier</li>
        <li>thym</li>
        <li>1 gousse d'ail</li>
        <li>vinaigre</li>
        <li>cornichons</li>
        <li>sel</li>
        <li>poivre</li>
        <li>persil</li>
        <li>genièvre</li>
      </ul>
    ",
    description: "
      <ul>
        <li>Faire cuire un lapin si possible sauvage au four.</li>
        <li>Puis, à part :</li>
        <li>Faire dorer un oignon haché dans une petite casserole avec de l’huile.</li>
        <li>Ajouter une carotte coupée en très petits dés, voire un petit peu de jambon coupé menu.</li>
        <li>Ajouter au dernier moment un peu de farine. Dorer.</li>
        <li>Ajouter un verre de vin blanc, laurier et thym. 1 gousse d’ail.</li>
        <li>Ajouter de l’eau si nécessaire.</li>
        <li>Cuire ½ heure.</li>
        <li>Au dernier moment, ajouter le foie du lapin sauvage haché, vinaigre, 1 ou 2 cornichons haché(s).</li>
        <li>Ajouter un peu de jus maigre du lapin en fin de cuisson.</li>
        <li>Ajouter sel, poivre, persil et genièvre.</li>
      </ul>
    ",
    category: PLAT_VIANDE
  },
  { title: "Canard aux olives",
    author: "Manou",
    ingredients: "
      <ul>
        <li>1 canard de 2 kg</li>
        <li>2 oignons</li>
        <li>2 gousses d’ail</li>
        <li>1 carotte</li>
        <li>250gr d’olives vertes</li>
        <li>1 litre de vin blanc sec</li>
        <li>1 bouillon</li>
      </ul>
    ",
    description: "
      <ul>
        <li>Faire revenir le canard en morceaux à l’huile d’olive, l’enlever et rajouter oignons, ails, carottes  coupés en petits dés et faire dorer.</li>
        <li>Faire blanchir les olives vertes à l’eau bouillante, car trop salées.</li>
        <li>Saupoudrer sur le canard la  farine, (cuire la farine), rajouter vin et bouillon, puis olives et cuire 1h.</li>
        <li>Servir ave la purée d’olive noires</li>
        <li>1 kg de pommes de terre</li>
        <li>lait et huile d’olive pour la purée</li>
        <li>rajouter 250 gr d’olives noires CONFITES à la grecque mixées.</li>
      </ul>",
    category: PLAT_VIANDE
  },
  { title: "Civet de lièvre",
    author: "?",
    ingredients: "
      <ul>
        <li>1 lapin</li>
        <li>huile</li>
        <li>sel</li>
        <li>poivre</li>
        <li>cognac</li>
        <li>300 à 400g de couenne</li>
        <li>1 oignon</li>
        <li>1 cs de farine</li>
        <li>1l de vin rouge</li>
        <li>1 carotte</li>
        <li>thym</li>
        <li>laurier</li>
        <li>1 gousse d'ail</li>
        <li>crème</li>
      </ul>
    ",
    description: "
      <ul>
        <li>Après avoir découpé le lapin, le faire roussir au beurre additionné d’un peu d’huile dans une poêle, saler, poivrer, le mettre dans le récipient où l’on veut le faire cuire et le flamber avec un petit verre de cognac.</li>
        <li>Y ajouter 300 ou 400gr de couennes blanchies 10 minutes.</li>
        <li>Hacher un oignon assez gros, le faire roussir dans la poêle avec un peu de lard de poitrine coupé en petits carrés.</li>
        <li>Y ajouter une grosse cuillérée à soupe de farine, remuer ce mélange jusqu’à ce qu’il soit bien roux et à ce moment, verser dans la poêle un litre de bon vin rouge qu’on allume quand il bout.</li>
        <li>Verser ce cette préparation sur le lièvre afin qu’il en soit légèrement recouvert.</li>
        <li>Attacher une petite carotte avec un brin de thym, une feuille de laurier, une tête d’ail.</li>
        <li>Ajouter tout cela et mettre à cuire tout doucement thermostat 5 à 6 suivant l’âge du lièvre.</li>
        <li>A la fin de la cuisson, lier la sauce avec le foie haché, additionnée de sang qu’on aura eu soin de recueillir et auquel on aura ajouté une cuillérée de vinaigre.</li>
        <li>Si la sauce est trop claire, la lier avec peu de farine en supplément.</li>
        <li>Certains y ajoutent quelques cuillérées de crème fraiche quand la sauce est un peu forte, facultatif et au goût de chacun.</li>
      </ul>",
    category: PLAT_VIANDE
  },
  { title: "Beignets de cervelle",
    author: "Bonne Maman",
    ingredients: "
      <ul>
        <li>cervelles de veau ou de porc</li>
        <li>4 œufs</li>
        <li>250 gr de farine</li>
        <li>Eau</li>
        <li>2 cuillères à soupe d’huile</li>
      <li>sel",
    description: "
      <ul>
        <li>Cervelle de veau ou de porc, la faire dégorger dans de l’eau vinaigrée afin d’enlever le sang ; la faire  bien cuire à l’eau avec sel, vinaigre, laurier, thym</li>
        <li>Mettre les jaunes d’œufs avec une bonne pincée de sel.</li>
        <li>Monter les jaunes d’œufs puis rajouter peu à peu la farine pour faire une pate épaisse, 2 cuillères d’huile et ajouter un peu d’eau pour éclaircir, il faut que la pate soit épaisse et tienne.</li>
        <li>Mélanger délicatement la pate et mettre un peu de pâte, un peu de cervelle ; faire frire les beignets dans la friture bouillante.</li>
        <li>Quand les beignets sont dorés d’un côté, les retourner, puis les égoutter dans une passoire avec papier absorbant.</li>
        <li>Au moment de faire cuire les beignets, monter les blancs d’œufs en neige.</li>
      </ul>
    ",
    category: PLAT_VIANDE
  },
  { title: "Croquettes de viande ",
    author: "Maria",
    ingredients: "
      <ul>
        <li>Hacher le bouilli</li>
        <li>Béchamel bien épaisse</li>
        <li>2 œufs entiers</li>
      </ul>
    ",
    description: "
      <ul>
        <li>Mélanger le tout, laisser reposer jusqu’au lendemain</li>
        <li>Faire des petites boules, fariner, puis chapelure puis œuf battu</li>
        <li>Friture bouillante, et penser à égoutter</li>
      </ul>
    ",
    category: PLAT_VIANDE
  },
  { title: "Cassoulet",
    author: "Bonne Maman et de Moucky",
    ingredients: "
      Pour 8 personnes environ
      <ul>
        <li>1 kg de bons haricots secs</li>
        <li>Travers de porc coupés et salés (1h avant)</li>
        <li>Couennes de porc (blanchies 5 min)</li>
        <li>Oignons</li>
        <li>Saucisse fraiche</li>
        <li>Tomates fraiches ou en boite</li>
        <li>Confit d’oie ou de canard</li>
      </ul>
    ",
    description: "
      <ul>
        <li>Blanchir dans l’eau froide les haricots 50min. Jeter cette eau de cuisson</li>
        <li>Dans une poêle, faire roussir dans la graisse de canard la saucisse, les couennes, les travers de porc</li>
        <li>Retirer la viande</li>
        <li>Dans ce jus, verser un gros oignon, une bonne persillade et tomates</li>
        <li>Bien dorer</li>
        <li>Dans un grand pot en terre, mettre les haricots, toutes les viandes (saucisse coupées en morceau), recouvrir d’eau chaude avec le jus de viande, d’oignons</li>
        <li>Mettre au four et cuire tout doucement pendant 2h</li>
        <li>Rajouter de l’eau si nécessaire</li>
        <li>Il est préférable de mettre le confit en fin de cuisson (1/4 d’heure</li>
        <li>Saler à votre goût</li>
        <li>Les couennes doivent être entièrement débarrassées de la graisse, blanchies et coupées en morceau</li>
      </ul>
    ",
    category: PLAT_VIANDE
  },
  { title: "Ni Gou Yeng",
    author: "Flo",
    ingredients: "
      Pour 6 personnes gourmandes
        <ul>
          <li>Environ 800gr de porc en lamelles</li>
          <li>2 poivrons rouges / 1 vert</li>
          <li>1 grande boite d’ananas en morceaux</li>
          <li>½ bouteille de soja (max) Prendre le bio réduit en sel !</li>
          <li>1 grand verre de vinaigre</li>
          <li>1 oignon en lamelles</li>
          <li>2 à 5 cuillères de sucre roux</li>
          <li>2 à 5 cuillères Maïzena</li>
        </ul>
      ",
    description: "
      <ul>
        <li>Porc en lamelles à revenir avec farine, puis caraméliser avec sucre roux</li>
        <li>Mélanger maïzena avec sauce soja et vinaigre</li>
        <li>Couper les légumes en lamelles</li>
        <li>Mélanger avec le porc, l’ananas (le tout)</li>
        <li>Environ 10 minutes de cuisson</li>
        <li>Ne pas trop faire cuire la première fois si vous réchauffer</li>
        <li>Servir avec riz</li>
      </ul>
    ",
    category: PLAT_VIANDE
  },
  { title: "Chorba algérien",
    author: "Flo",
    ingredients: "
      <ul>
        <li>1 kg de boulettes de bœuf français aux oignons (picard)</li>
        <li>500gr de tomates pelées en boite</li>
        <li>Coriandre (à la fin)</li>
        <li>2 épices : Ras el<li>hanout, épices à couscous, cannelle, paprika</li>
        <li>1 bouillon cube / sel</li>
        <li>2 oignons</li>
        <li>1 citron pressé</li>
        <li>Pois chiches</li>
        <li>Boulghour</li>
      </ul>
    ",
    description: "
      <ul>
        <li>Cuisson = tomates + oignons + épices (sauf coriandre) + eau</li>
        <li>Environ ½ heure puis mixer le tout</li>
        <li>Ajouter du citron avant la fin, puis les boulettes, les pois chiches et le boulghour</li>
        <li>Finissez par la coriandre</li>
      </ul>
    ",
    category: PLAT_VIANDE
  },
  { title: "Morue salée sèche ",
    author: "Xinha",
    ingredients: "
      <ul>
        <li>1 morue <li> Oignons en rondelles</li>
        <li>Pommes de terre en rondelle</li>
        <li>Morue effilochée</li>
        <li>Ail coupé</li>
        <li>Tomates coupées</li>
        <li>Lamelles de poivrons</li>
        <li>Huile d’olive</li>
      </ul>
    ",
    description: "
      <ul>
        <li>Laisser la morue salée 14h dans de l’eau, changer d’eau une fois</li>
        <li>Dans un pyrex, mélanger tous les autres ingrédients</li>
        <li>Au four 1h30</li>
      </ul>
      ",
    category: PLAT_POISSON
  },
  { title: "Sauce hollandaise à servir avec un turbot poché ou un loup en croute de sel",
    author: "Bonne Maman",
    ingredients: "
      <ul>
        <li>2 jaunes d’œuf</li>
        <li>2 cuillérées à soupe d’eau froide <li> 200 gr de beurre <li> sel <li> 1/2 citron</li>
      </ul>
    ",
    description: "
      <ul>Monter au fouet au bain marie
        <li>Quand les jaunes sont épais, ajouter 200gr de beurre en morceaux (pour 5), sel</li>
        <li>La sauce Hollandaise ne doit pas être liquid</li>
        <li>Mettre ½ citron</li>
        <li>Bain marie sans bouillir</li>
        <li>Maintenir au chaud ainsi</li>
      </ul>
    ",
    category: PLAT_POISSON
  },
  { title: "Baudroie en Bourride",
    author: "Manou",
    ingredients: "
      <ul>
        <li>1,5 kg de baudroie</li>
        <li>4 blancs de poireaux</li>
        <li>un peu de céleri vert</li>
        <li>le blanc d’une salade frisée</li>
        <li>½ litre de vin blanc et un peu d’eau</li>
      </ul>
    ",
    description: "
      <ul>
        <li>Bien parer la baudroie et la couper en gros morceaux</li>
        <li>Faire frire la baudroie dans une casserole. Flamber avec du cognac</li>
        <li>Hacher le blanc de 4 poireaux, un peu de céleri, le blanc d’une salade frisée</li>
        <li>Faire frire dans l’huile du poisson</li>
        <li>Ajouter eau + vin blanc et cuire ½ heure</li>
        <li>Mayonnaise 4 jaunes (+huile) au dernier moment</li>
        <li>NE PAS FAIRE BOUILLIR</li>
        <li>Servir avec des pommes de terre</li>
      </ul> ",
    category: PLAT_POISSON
  },
  { title: "Pain de Lotte",
    author: "Manou",
    ingredients: "
      <ul>
        <li>6 œufs</li>
        <li>Lotte très peu cuite au court bouillon de poisson</li>
        <li>250 gr de Crème fraiche</li>
        <li>Concentré de tomate</li>
        <li>Kirsch</li>
      </ul>
    ",
    description: "
      <ul>
        <li>Bien faire égoutter la lotte cuite et coupée en gros morceaux dans une passoire.</li>
        <li>Mélanger les œufs la crème fraiche, deux cuillères à soupe de concentré et un peu de kirsch</li>
        <li>Rajouter la lotte et faire cuire au bain marie dans un moule à cake.</li>
      </ul>
    ",
    category: PLAT_POISSON
  },
  { title: "Lotte",
    author: "Manou",
    ingredients: "
      Pour 9 personnes
      <ul>
        <li>2 kg de lotte</li>
        <li>1 oignon</li>
        <li>sel</li>
        <li>poivre</li>
        <li>Béchamel</li>
        <li>3 tomates</li>
        <li>estragon</li>
        <li>optionnel : coquillages et champignons</li>
      </ul>
    ",
    description: "
      <ul>
        <li>La faire pocher dans 1 peu d’eau avec 1 oignon, sel et poivre. Cuire 5min</li>
        <li>Béchamel : beurre + farine + 1.5 verre de vin blanc, faire cuire un petit peu et mélanger le fumet de poisson ; ajouter 250 g de crème fraiche.</li>
        <li>Ajouter éventuellement coquillages + champignons</li>
        <li>Peler 3 tomates ; Garder la pulpe. Mélanger à la sauce + estragon.</li>
        <li>Servir avec pâtes fraiches</li>
      </ul>
    ",
    category: PLAT_POISSON
  },
  { title: "Soles normandes",
    author: "Manou et Bonne Maman",
    ingredients: "
      <ul>
        <li>1,3 Kg de soles ou des filets de soles</li>
        <li>1 Kg de moules</li>
        <li>Une boite de champignons de Paris de 9e</li>
        <li>Une petite boite de truffes</li>
        <li>Des crevettes</li>
        <li>1 L de lait</li>
      </ul>
    ",
    description: "
      <ul>
        <li>Peler les soles. Couper les filets de la largeur du doigt</li>
        <li>Garder les peaux de la sole, les arêtes et la tête</li>
        <li>Faire roussir un petit oignon et une carotte</li>
        <li>Quand tout est roussi, y mettre un verre de vin blanc sec et les peaux, arêtes, têtes et un peu de sel et de poivre.</li>
        <li>Laisser cuire tout doucement.</li>
        <li>Faire blanchir les moules et les crevettes et mettre environ un verre et demi d’eau des moules dans le court bouillon.</li>
        <li>Laisser cuire 1h environ, passer ce court bouillon et y ajouter les champignons de Paris avec le jus.</li>
        <li>Laisser cuire 1h environ.</li>

        <li>Beurrer un plat allant au feu, y ranger les filets de sole, saler légèrement, papier beurré dessus et mettre 10 minutes à four moyen.</li>
        <li>Le jus peut se mettre dans la sauce.</li>
        <li>Servir les filets chauds.</li>

        <li>Un quart d’heure avant de servir, faire une bonne béchamel avec environ 1 L de lait.</li>
        <li>Quand elle est terminée, y ajouter tout doucement la sauce et les moules, et laisser cuire doucement 10 minutes.</li>
        <li>Ajouter les truffes avec le jus des truffes.</li>
        <li>Verser cette sauce sur les filets de sole.</li>
        <li>Faire une béchamel avec moules, coquilles, crevettes, champignons et truffes</li>
        <li>Napper le pain démoulé.</li>
      </ul>
    ",
    category: PLAT_POISSON
  },
  { title: "Terrine aux deux saumons ",
    author: "Marie Laure",
    ingredients: "
      <ul>
        <li>600 gr de saumon frais, poché, mais très peu cuit</li>
        <li>300 gr de saumon fumé</li>
      </ul>
    ",
    description: "
      <ul>
        <li>Emietter (mais non hacher !) à la fourchette le saumon faire et effilocher le saumon fumé</li>
        <li>Rajouter 150 gr de beurre ramolli, un œuf entier, citron, sel et poivre</li>
        <li>Mettre au frais une nuit</li>
        <li>Servir avec, crème fraiche et ciboulette, ou mayo</li>
      </ul>
    ",
    category: PLAT_POISSON
  },
  { title: "Soupe de poissons",
    author: "?",
    ingredients: "
      <ul>
        <li>1 ou 2 têtes de Merlan, ailerons de Baudroie, rognures de poissons</li>
        <li>1 oignon</li>
        <li>huile</li>
        <li>A tomate</li>
        <li>5 à 6 gousses d'ail</li>
        <li>légume de pot au feau</li>
        <li>1 branche de thym</li>
        <li>1 feuille de laurier</li>
        <li>safran</li>
        <li>optionnel : crème de riz</li>
      </ul>
    ",
    description: "
      <ul>
        <li>1 ou 2 têtes de Merlan, des ailerons de baudroie, des rognures de poisson ou des têtes.</li>
        <li>Vous pouvez ajouter quelques moules auparavant ouvertes.</li>
        <li>Hacher un oignon et le faire revenir vivement dans l’huile d’olive ainsi qu’une tomate et 5 à 6 gousses d’ail.</li>
        <li>Ajouter environ deux litres d’eau, y mettre quelques légumes comme pour le pot au feu, une branche de thym, une feuille de laurier, un peu de safran.</li>
        <li>Laisser bouillir le tout 20 minutes à gros bouillons. Passer la mixture ainsi obtenue au moulin à légumes. Si la soupe n’est pas assez onctueuse, ajouter 1 ou 2 cuillérées de crème de riz.</li>
        <li>Il faut que la soupe ait la consistance d’une béchamel légère.</li>
      </ul>
    ",
    category: PLAT_POISSON
  },
  { title: "Bouillabaisse",
    author: "?",
    ingredients: "
      <ul>
        <li>Un gros oignon haché très fin</li>
        <li>3 tomates moyennes (pelées et graines enlevées)</li>
        <li>1 grain d’ail</li>
        <li>Un bouquet de persil, 3 feuilles de laurier, thym, serpolet</li>
        <li>Un peu de peau de citron, safran, poivre de Cayenne</li>
        <li>Sel et poivre</li>
      </ul>
    ",
    description: "
      Mettre dans une casserole large ½ verre d’huile, oignon, tomates…
      Mettre par couches :
      <ul>
        <li>Saint Pierre</li>
        <li>Baudroie</li>
        <li>Merlan</li>
        <li>Rascasses</li>
        <li>Rougets</li>
        <li>Turbot</li>
        <li>Crabes*</li>
        <li>Langoustine*</li>
        <li>Langouste*</li>
      </ul>
      <ul>
        <li>Poissons durs dessous, tendres dessus</li>
        <li>Ajouter un verre et demi de vin blanc, un peu d’eau</li>
        <li>Cuire 20 minutes</li>
        <li>Feu vif au début, doux à la fin, liaison si l’on désire</li>
        <li>Crabes, langoustine, langouste : 10 minutes de cuisson dans l’eau salée avant</li>
      </ul>
    ",
    category: PLAT_POISSON
  },
  { title: "Beignets soufflés",
    author: "?",
    ingredients: "
      <ul>
        <li>80 gr de beurre</li>
        <li>30 g de sucre</li>
        <li>sel</li>
        <li>1/4 l d'eau</li>
        <li>150 gr de farine</li>
        <li>4 oeufs frais</li>
        <li>sucre</li>
      </ul>
    ",
    description: "
      <ul>
        <li>Mettre dans une casserole 80gr de beurre, 30 gr de sucre, une pincée de sel et ¼ de litre d’eau</li>
        <li>Placer la casserole sur le feu et y verser 150gr de farine qui aura été tamisée, remuer avec une spatule de manière à obtenir un mélange consistant et homogène</li>
        <li>Remettre la casserole sur le feu sans cesser de remuer afin de la dessécher un peu en la cuisant</li>
        <li>La laisser jusqu’à ce que la pâte n’adhère plus à la spatule</li>
        <li>A ce moment, sortir la casserole du feu et sans attendre, ajouter successivement 4 œufs frais entiers en les incorporant l’un après l’autre, ajouter le dernier blanc monté en neige</li>
        <li>Laisser reposer la pâte. Mettre gros comme des noix de pâte dans la friture modérément chaude. Egoutter et servir chaud. Saupoudrer de sucre</li>
      </ul>
    ",
    category: DESSERT
  },
  { title: "Gratin de fruits rouges",
    author: "Manou",
    ingredients: "
      <ul>
        <li>300gr de framboises</li>
        <li>300gr de myrtilles / groseilles</li>
        <li>Egoutter les fruits</li>
        <li>4 jaunes d’œufs</li>
        <li>15cl de crème</li>
        <li>2 cuillères à café de sucre vanillé</li>
      </ul>
    ",
    description: "
      <ul>
        <li>Mettre fruits dans un grand plat à gratin</li>
        <li>Chauffer fort le grill du four</li>
        <li>Mélanger le jaunes d’œufs, la crème, le sucre vanillé + 2 cuillères d’eau et faire cuire doucement l’ensemble dans une casserole à fond épais, il faut que ce soit épais comme une crème pâtissière</li>
        <li>Napper les fruits bien égouttés avec cette crème et mettre au grill le temps que ca dore, 3/5 minutes</li>
        <li>Servir tout de suite</li>
      </ul>
    ",
    category: DESSERT
  },
  { title: "Gâteau au chocolat",
    author: "Fifi",
    ingredients: "
      <ul>
        <li>200gr de chocolat noir</li>
        <li>200gr de pralinoise  (en supermarché)</li>
        <li>250/300 gr de beurre</li>
        <li>250gr de sucre roux</li>
        <li>8 œufs</li>
        <li>8 cuillères à soupe rase de farine</li>
      </ul>
    ",
    description: "
      <ul>
        <li>Faire fondre chocolat, pralinoise + beurre.</li>
        <li>Mélanger sucre roux, œufs, farine. Mixer le tout jusque ce soit mousseux.</li>
        <li>Tout mélanger.</li>
        <li>Faire cuire 15min à four 205°C.</li>
      </ul>
    ",
    category: DESSERT
  },
  { title: "Vacherin à la vanille ",
    author: "Manou",
    ingredients: "
      Pour 10 personnes :
      <ul>
        <li>8 œufs</li>
        <li>100gr de sucre normal</li>
        <li>400gr de crème</li>
        <li>5 sachets de  Vanille en poudre</li>
        <li>100gr de sucre glace</li>
        <li>1 paquet de meringues ou meringue faite maison</li>
      </ul>
    ",
    description: "
      <ul>
        <li>Mélanger les jaunes d’œufs, le sucre normal, la crème et la vanille.</li>
        <li>Mélanger  le blanc d’œuf en neige bien ferme et le  sucre glace.</li>
        <li>Mélanger le tout à la fourchette.</li>
        <li>Intercaler dans un moule rond la meringue écrasée et les mélanger.</li>
        <li>Mettre au congélateur.</li>
        <li>Servir avec du chocolat fondu et de la chantilly ou avec des fruits rouges, des kiwis, etc…</li>
      </ul>
    ",
    category: DESSERT
  },
  { title: "Compote de pommes",
    author: "Fifi",
    ingredients: "
      <ul>
        <li>1kg de pommes pelées</li>
        <li>250 gr de sucre</li>
        <li>¼ L d’eau</li>
        <li>Zeste citron</li>
      </ul>
    ",
    description: "
      <ul>
        <li>Faire cuire ensemble à la casserole jusqu’à obtention d’une compote. Laisser quelques morceaux</li>
      </ul>
    ",
    category: DESSERT
  },
  { title: "Malakoff",
    author: "Fifi",
    ingredients: "
      <ul>
        <li>Crème à la vanille</li>
        <li>12 blancs d'oeuf</li>
        <li>caramel</li>
        <li>20 morceaux de sucre</li>
      </ul>
    ",
    description: "
      <ul>
        <li>Faire crème à la vanille</li>
        <li>Monter 12 blancs d’œuf</li>
        <li>Faire beaucoup de caramel, 20 morceaux de sucre à peine mouillés</li>
        <li>Quand c’est très chaud (bouilli), consistance caramel rajouter aux blancs d’œuf et continuer à fouetter</li>
        <li>Servir avec la crème à la vanille</li>
      </ul>
    ",
    category: DESSERT
  },
  { title: "Flan à la noix de Coco",
    author: "Fifi",
    ingredients: "
      <ul>
        <li>4 œufs</li>
        <li>Lait de coco</li>
        <li>Crème liquide</li>
        <li>½ sachet de poudre de coco</li>
        <li>1 petite boite de lait concentré sucré</li>
        <li>Zeste de citron</li>
        <li>Vanille</li>
      </ul>
    ",
    description: "
      <ul>
        <li>Mélanger le jaune d’œuf + lait coco + crème + poudre + lait concentré + citron + vanille.</li>
        <li>Monter les blancs d’œufs en neige.</li>
        <li>Mélanger les deux.</li>
        <li>Mettre au bain marie chaud ½ heure thermostat 7.</li>
        <li>Mettre plus chaud puis baisser.</li>
      </ul>
    ",
    category: DESSERT
  },
  { title: "Petits fours à la noix de coco",
    author: "?",
    ingredients: "
      Pour 35 petits fours:
      <ul>
        <li>250gr de noix de coco</li>
        <li>250gr de sucre</li>
        <li>5 cuillérées à soupe de farine</li>
        <li>5 cuillérées à soupe de lait</li>
        <li>3 œufs entiers</li>
      </ul>
    ",
    description: "
      <ul>
        <li>Travailler les œufs avec le sucre, y ajouter la noix de coco, la farine et le lait</li>
        <li>Faire des petits tas, y mettre des petits morceaux de cerises confites</li>
        <li>Four à Th 6 environ ½ heure, à surveiller</li>
      </ul>
    ",
    category: DESSERT
  },
  { title: "Petits fours aux amandes",
    author: "?",
    ingredients: "
      <ul>
        <li>200gr d’amandes émondées et moulues</li>
        <li>150gr de sucre en poudre</li>
        <li>2 blancs d’œufs non battus</li>
        <li>Un peu d’écorce d’orange confite, hachée très menu</li>
      </ul>
    ",
    description: "
      <ul>
        <li>Tout mélanger puis, rouler dans les amandes effilées. Passer du lait au pinceau</li>
        <li>Mettre à four chaud pendant 10min</li>
      </ul>
    ",
    category: DESSERT
  },
  { title: "Tarte flamande",
    author: "?",
    ingredients: "
      <ul>
        <li>1 œuf entier</li>
        <li>5 cuillérées à soupe de farine</li>
        <li>3 cuillérées de sucre</li>
        <li>3 cuillérées de lait</li>
        <li>2 cuillérées d’huile</li>
        <li>½ paquet de beurre</li>
        <li>Travailler le tout</li>
      </ul>
    ",
    description: "
      <ul>
        <li>Mettre dans un moule à tarte beurrée.</li>
        <li>Ajouter dessus 3 poires ou pommes coupées minces.</li>
        <li>Mettre à four Th 7 ou 8 un quart d’heure.</li>
        <li>Préparer une crème avec 80gr de beurre ramolli, 3 cuillérées de sucre, un œuf. Mettre dessus.</li>
        <li>Cuire ¼ d’heure de plus.</li>
      </ul>
    ",
    category: DESSERT
  },
  { title: "Tarte au citron",
    author: "Maria",
    ingredients: "
    Pâte :
    <ul>
      <li>1 œuf et un jaune</li>
      <li>80g de beurre</li>
      <li>Farine</li>
      <li>2 cuillères de sucre</li>
    </ul>
    Crème au citron:
    <ul>
      <li>75g de beurre</li>
      <li>2 œufs entiers</li>
      <li>Rapper 2 citrons</li>
      <li>7 cuillérées de sucre</li>
      <li>2 cuillérées d’eau</li>
      <li>Le jus de 3 citrons</li>
    </ul>",
    description: "
      <ul>
        <li>Faire la crême au citron au bain marie</li>
        <li>Faire cuire la pâte puis rajouter la crème quand tout est bien froid.</li>
      </ul>
    ",
    category: DESSERT
  },
  { title: "Fudge",
    author: "Fifi",
    ingredients: "
      <ul>
        <li>450gr de sucre</li>
        <li>1 tasse à thé de lait concentré non sucré</li>
        <li>6 grandes cuillères à soupe de beurre</li>
        <li>1 cuillère à café d’essence de vanille</li>
      </ul>
    ",
    description: "
      </ul>
        <li>Faire fondre le beurre (pas cuit). Ajouter sucre puis vanille puis le lait.</li>
        <li>Faire cuire à gros bouillon de 15 à 20 min avec 1 cuillère en bois.</li>
        <li>Quand le sucre se détache, ôter du feu et remuer</li>
        <li>Laisser refroidir</li>
      </ul>
    ",
    category: DESSERT
  },
  { title: "Baba au rhum",
    author: "Manou",
    ingredients: "
      <ul>
        <li>4 cuillères à soupe de sucre</li>
        <li>3 œufs</li>
        <li>6 cuillères de farine</li>
        <li>4/5 cuillères de lait</li>
        <li>1 paquet de levure maxi</li>
        <li>Sirop : ½ litre au moins d’eau / 200<li>225g de sucre / 1 grand verre de rhum</li>
      </ul>
    ",
    description: "
      <ul>
        <li>Bien beurrer un grand moule à savarin (baba) (25 cm de diamètre)</li>
        <li>Mettre les jaunes d’œufs dans une terrine, garder les blancs</li>
        <li>Ajouter  petit à petit en tournant le sucre, bien travailler le mélange pour qu’il devienne blanc et mousseux</li>
        <li>Incorporer ensuite la farine en remuant, puis le lait, la levure et battre les blancs en neige</li>
        <li>Mélanger le tout légèrement et mettre à four doux (4/5 Th) 20 à 30 minutes. Le baba doit être bien doré et l’aiguille sèche</li>
        <li>Démouler le baba tiède sur une grille, laver le moule, le sécher</li>
        <li>Préparer le sirop</li>
        <li>Remettre le baba dans le moule, l’imprégner petit à petit de sirop chaud</li>
        <li>Ne le démouler qu’avant le repas</li>
        <li>Ajouter de la chantilly et des fruits rouges selon les goûts</li>
      </ul>
    ",
    category: DESSERT
  },
  { title: "Les Mazamétains",
    author: "?",
    ingredients: "
      <ul>
        <li>4 blancs d'œufs</li>
        <li>200 gr de sucre</li>
        <li>150 gr de beurre fondu</li>
        <li>70 gr de farine</li>
        <li>70 gr d'amandes en poudre</li>
        <li>1 sachet de sucre vanillé</li>
      </ul>
    ",
    description: "
      <ul>
        <li>A feu doux, remuer sans s’arrêter pendant 5 minutes le sucre, les amandes, la farine et les blancs d'œufs</li>
        <li>Ajouter le beurre et le sucre vanillé</li>
        <li>Verser la préparation au 3/4 dans des petits moules (type financiers ou muffins)</li>
        <li>Cuire à four préchauffé à 150° (th.5) pendant 25 à 30 minutes</li>
      </ul>
    ",
    category: DESSERT
  },
]

RECIPES.each do |recipe|
  Recipe.new(recipe).tap do |r|
    r.user = initial_publisher
    r.save!
  end
end

