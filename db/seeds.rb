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
    ingredients: "1,8 ou 2kg de foie gras",
    description:"Faire tremper les foies, les nettoyer et bien les essuyer après les avoir dénervés
    Saler et poivrer tous les morceaux, puis arroser selon la préférence de porto ou vin doux
    Mettre dans la terrine et couvrir d’aluminium
    Bain marie à four fort (thermo 7 ou 8) pendant plus ou moins 15 min. Baisser une fois fondu.
    Puis 1h à thermo 5.
    S’il fond trop vite, le baisser à four ouvert. Refroidir à l’extérieur.",
    category: ENTREE
  },
  { title: "Pâte à choux pour gougères",
    author: "Marilou",
    ingredients: "    • 125gr de farine
    • 100gr de beurre
    • 25 cl d’eau chaude
    • 4 œufs
    • 100 gr de Gruyère",
    description: "Mélanger le beurre et l’eau sur le feu puis quand ça bout, rajouter la farine d’un coup. Quand la pâte n’accroche plus, sortir du feu et ajouter les œufs un par un.
La pâte doit être comme un ruban.
Rajouter ensuite le gruyère.
Faire des petits tas à la cuillère  et faire cuire à four chaud, jusqu’à que ce soit gonflé et doré.",
    category: ENTREE
  },
  { title: "Pain de poisson ",
    author: "?",
    ingredients: "-   3 œufs
      - 5 cuillérées de riz
      - Un poing de pain trempé dans le lait
      - 250gr de baudroie
      - Safran
      ",
    description: "Faire cuire le riz et le poisson bouilli à part.
Hacher le poisson, mélanger le riz au pain trempé et mettre une bonne pincée de safran.
Beurrer un plat et mettre au four",
    category: ENTREE
  },
  { title: "Pain de Gêne délicieux",
    author: "Bonne Maman",
    ingredients: "- 80 gr de beurre - 2 cuillères à soupe de farine - 1/4 de lait, 80 gr de fromage rapé - 4 jaunes d'oeufs - chapelure - coquilles - moules - champignons de Paris - optionnel : jambon d'York",
    description: "Faire une béchamel avec 80gr de beurre, 2 cuillérées de farine, ¼ de lait.
Quand elle est cuite, ajouter 80gr de fromage râpé, 4 jaunes d’œufs et les blancs montés en neige.
Mettre le tout dans un moule bien beurré et entourer de chapelure.
Faire cuire 1h30 au bain marie.
Une fois démoulé, le servir entouré d’une sauce béchamel dans laquelle on met l’intérieur de coquilles, moules, truffes et champignons de Paris.
On peut aussi, et cela est supérieur, entourer le moule de tranches d’un bon jambon d’York. Alors on lui donne le nom de Pain d’York. ",
    category: ENTREE
  },
  { title: "Salade de Pâques à la Mazamétaine",
    author: "Manou",
    ingredients: " • Foie de porc séché.
    • Oignons vieux
    • Oignons frais
    • Artichauts frais, les petits
    • Radis
    • Œufs durs",
    description: "Couper le foie en petits morceaux, si trop salé, le faire dégorger dans de l’eau.
Tout couper en petits morceaux
Faire revenir le foie coupé en dés, retirer.
Faire revenir l’oignon vieux coupé, transparent.
Mélanger, foie, oignons vieux, oignons frais et radis coupés tout petits, et cœurs d’artichauts frais.
Ajouter vinaigre, éventuellement un peu d’huile, pas de sel.
Réserver au frais
Servir avec les œufs durs coupés en 4.
",
    category: ENTREE
  },
  { title: "Pain de crabe (pour 8 personnes)",
    author: "Marilou",
    ingredients: "    • 4 boites de crabes égouttés (au moment de Noel, Aldi et Lidl en vendent d’excellents)
    • 5 granny Smith râpées et bien pressées dans un torchon sec
    • 5 œufs durs hachés menus
    • 1 grand bol de mayonnaise citronnée et maison 
    • Herbes variées (ciboulette, persil)",
    description: "Tout mélanger délicatement et mettre dans un moule à Baba, au frais plusieurs heures.
Servir avec un gaspacho. ",
    category: ENTREE
  },
  { title: "Verrines au parmesan",
    author: "Flo",
    ingredients: "    • 200gr de parmesan
    •  400gr de crème
    •  ½ verre de lait",
    description: "Une fois fondu, ajouter 15g de poudre d’amande
Mélanger avec le gaspacho ",
    category: ENTREE
  },
  { title: "Aubergines en béchamel",
    author: "Bonne Maman",
    ingredients: "- Aubergines - Huile d'olive - Persil - Ail - Beurre - Chapelure - 80 gr de beurre - 2 cuillères à soupe de farine - 1/4 de lait",
    description: "Prendre de jolies aubergines.
Les partager en deux, creuser l’intérieur en conservant dans une assiette ce que l’on sort 
Les faire roussir à l’huile dans la poêle.
Faire une béchamel sans fromage, ajouter persil et très peu d’ail et l’intérieur des aubergines que l’on fait cuire à part dans le beurre.
Mélanger le tout, en farcir les aubergines et couvrir de chapelure.
Mettre au four.",
    category: ENTREE
  },
  { title: "Pain de lotte",
    author: "?",
    ingredients: " • 1 queue de lotte, pochée et coupée en morceaux
    • 8 œufs battus
    • 4 cuillères à soupe de crème fraiche
    • 3 cuillères à soupe de concentré de tomates",
    description: "Tout mélanger et faire cuire au bain marie dans un moule à cake ou à baba",
    category: ENTREE
  },
  { title: "Vol au vent",
    author: "?",
    ingredients: "- lard - beurre - ris de veau - cervelle - rognons - crêtes de coq - blanc de volaille - oignons - fond roux - bouillon - Madère - Jaune d'oeuf",
    description: "Passer dans une casserole avec lard et beurre le ris de veau, la cervelle (préalablement blanchis), rognons et crête de coq, blanc de volailles, le tout coupé en gros dés, puis quelques oignons.
Faire un roux blond. Mouiller d’un bon bouillon dégraissé et d’un demi-verre de Madère.
Laisser cuire tout doucement.
Avant de verser dans la croute, lier avec un jaune d’œuf. ",
    category: ENTREE
  },
  { title: "Galantine de volaille en terrine",
    author: "Bonne Maman et de Mamy",
    ingredients: "- Une poule (vivante !) - 50 gr de filet de cochon et de veau par poule - sel - poivre - truffes - foie d'oie",
    description: "Tuer la poule, la flamber, fendre la peau (la poule étant encore chaude) sur le milieu du dos et la peler entièrement.
Mettre cette peau de côté.
Lever les filets et les garder entiers. Désosser alors les cuisses et les entrecuisses et toutes les parties charnues de la volaille.
Passer cette viande à la machine et y joindre le foie de la poule et 100g de filet de cochon et de veau (quantité pour 2 poules).
Mettre 12 g de sel et 1 g de poivre par livre de farce.
Bien mélanger le tout.
Mettre alors la peau dans la terrine. Mettre, en pressant avec les doigts, un peu de farce, puis un filet, un peu de sel sur le filet, un peu de lard en petites lamelles, truffes, foie d’oie.
Terminer par de la farce et couvrir le tout avec la peau de la poule.
Faire cuire 3h.",
    category: ENTREE
  },
  { title: "Gnocchis à la semoule",
    author: "Manou et Moucky",
    ingredients: "    • 1 litre de lait
    • 125 gr de semoule
    • 2 jaunes d’œuf
    • 100 gr de beurre, crème, gruyère",
    description: "Faire chauffer ½ litre de lait, rajouter la semoule jusqu’à ce qu’elle soit cuite, il faut que ça fasse une pate assez épaisse.
Rajouter 2 jaunes d’œuf.
Faire une béchamel : fondre 80 gr de beurre, rajouter 60 gr de farine et faire bien cuire l’ensemble. Rajouter ensuite le ½ de lait.
Dans un plat beurré, faire des petits tas à la cuillère à soupe, mettre la béchamel au-dessus, un peu de crème et le gruyère.
Au four pour que ça gratine.",
    category: PLAT_VEG
  },
  { title: "Purée de carottes",
    author: "James de Coquet",
    ingredients: "- 1 kg de carottes - 4 cs de crème - beurre - comté - crème fouettée",
    description: "Faire cuire 1 kg de carottes à l’eau, les égoutter.
Les mettre en purée, puis sur le feu pour les dessécher.
Ajouter 4 cuillère à soupe de crème, du beurre et du comté râpé.
Travailler jusqu’à ce que ça fasse un ruban.
Mettre dans de grands moules individuels, chapeauter de crème fouettée et mettre à four  chaud pour que ça dore et glace. ",
    category: PLAT_VEG
  },
  { title: "Beignets au fromage",
    author: "Bonne Maman",
    ingredients: "    • 2 verres d’eau
    • Une pincée de sel
    • 50gr de beurre
    • 2 verres de farine
    • 50gr de gruyères râpés",
    description: "Mettre les deux verres d’eau dans une casserole, une pincée de sel et 50gr de beurre.
Dès que le beurre est fondue, mettre les 2 verres de farine, tout à la fois dans l’eau bouillante et remuer vivement.
Quand la pâte n’adhère plus à la casserole, la retirer du feu.
Quand la pâte est tiède, commencer à mettre, toujours hors feu, 4 œufs, un par quart d’heure environ.
Laisser reposer du matin au soir.
Mettre sur le feu une poêle avec beaucoup d’huile, et mettre dans la friture non bouillante une bonne cuillérée à café de pâte en ménageant un peu de place entre chaque beignet qui doubleront de volume pendant la cuisson.
Quand la pâte est bien réussie, ils se retournent seuls dans la poêle.
Egoutter en mettant les beignets dans une passoire.
Servir chaud !",
    category: PLAT_VEG
  },
  { title: "Pâte levée  pour tarte aux Maroilles",
    author: " Moucky",
    ingredients: "Pour 2 tartes :

    • 1 livre de farine
    • 4 jaunes d’œufs
    • ½ livre de beurre fondue
    • Sel
    • 40 à 50gr de levure fraiche de boulanger fondue dans ½ verre d’eau tiède",
    description: "Mélanger le tout. Etendre dans les tourtières et couvrir avec un torchon.
Faire lever un peu au chaud.
Rajouter un Maroilles coupé en morceaux, plus de la crème fraîche.
Au four pour que la pâte soit bien levée et dorée",
    category: PLAT_VEG
  },
  { title: "Daube de bœuf",
    author: "?",
    ingredients: "    • 1kg de gîte de bœuf
    • 6 carottes
    • Petits oignons
    • 2 tranches de lard coupées en petits morceaux
    • Couennes blanchies dans l’eau
    • 1 bouquet garni (thym, persil, laurier)",
    description: "Faire revenir les oignons et les carottes dans de la graisse d’oie (ou canard / ou huile).
Une fois roussi, ajouter le lard et faire dorer.
Ajouter la viande, la faire dorer.
Ajouter une cuillère à soupe de farine. Faire dorer une minute.
Recouvrir de bon vin rouge. Le Genentière fût est parfait.
Ajouter le bouquet garni et les couennes.
Saler, poivrer, ajouter gousse d’ail entière.
Cuisson à feu doux couvert. Fermer hermétiquement et laisser cuire 3 à 4h",
    category: PLAT_VIANDE
  },
  { title: "Daube de sanglier",
    author: "Manou et de Moucky",
    ingredients: "    • Couper en morceaux et mettre dans un récipient profond en marinade (pas de sel) :
    • 3 cuillères à soupe de vinaigre
    • Poivre 4 épices, thym, laurier
    • ½ verre d’huile
    • 2 carottes
    • Céleri
    • Un gros oignon
    • ¾ d’un bon rouge vieux",
    description: "    • Mettre 2 à 3 jours à mariner au frigo en tournant tous les jours la viande.
Préparer un bouillon de viande et légumes sur le feu. Garder et dégraisser le bouillon. Un bouillon cube Bio fera aussi l’affaire !
    • Cuisiner la daube de préférence la veille du diner.
Egoutter la viande, filtrer la marinade.
Faire revenir la viande dans un peu d’huile ou de graisse de canard, faire saisir puis la mettre dans un saladier. La fariner et la remettre dans la cocotte avec un peu d’huile, d’oignons, échalotes et verser ½ verre de cognac chaud et l’enflammer hors du feu (et pas sous la hotte !)
Quand les flammes sont éteintes, remettre sur le feu. Rajouter la marinade jusqu’à ce que la viande soit presque recouverte.
Rajoute encore une louche de bouillon déjà préparé.
Laisser cuire à feu moyen. Saler.
Cuire minimum 2h avec un couvercle.
Rajouter du potage si nécessaire (surtout pas de la marinade qui doit toujours cuire !)",
    category: PLAT_VIANDE
  },
  { title: "Poularde à la crème",
    author: "Manou",
    ingredients: "- 1 Poule - oignons - clous de girofle - carottes - poireaux - sel - poivre - béchamel - crème fraiche - 4 jaunes do'euf - citrons - truffes - riz",
    description: "Faire cuire une belle poule dans un potage aux oignons, clous de girofle, carottes, poireaux, sel et poivre.
Faire une béchamel avec le potage de la poule.

Ajouter à la fin de la crème fraiche, hors du feu, puis lier la sauce avec 3 ou 4 jaunes d’œuf (toujours hors feu).
Faire frémir.
Ajouter citrons ou truffes.
Mettre la sauce sur la poule découpée.
Servir avec du riz
On peut farcir la poularde avec du veau haché, du persil et un œuf.
Faire un potage avec des perles du japon ou du vermicelle.",
    category: PLAT_VIANDE
  },
  { title: "Poulet au riz",
    author: "Mamie",
    ingredients: "1 Poulet - Huile d'olive - sel - poivre - 1 oignon - 2 gousses d'ail - 1 tomate - 1 piment rouge - riz",
    description: "Poulet coupé, salé, poivré.
Le faire dorer dans l’huile pour qu’il soit presque cuit.
Le sortir de la casserole et faire dorer 1 oignon haché fin, puis mettre 2 gousses d’ail, puis une tomate et 1 piment rouge coupés. Remuer
Ajouter 2 cuillères à soupe de riz par personne et faire cuire en remuant.
Ajouter les morceaux de poulet et les recouvrir d’eau.
Faire cuire 20min.
La consistance du riz est comme celui de la paella.",
    category: PLAT_VIANDE
  },
  { title: "Blanquette d’agneau",
    author: "?",
    ingredients: "- côtelettes d'agneau - huile - 1 oignon - 1 cs de farine - 1 bouqet garni - 1 gousse d'ail - mayonnaise - vinaigre - citron",
    description: "Faire revenir à l’huile les côtelettes d’agneau. Retirer.
Faire revenir un gros oignon haché dans le jus.
Mettre une cuillère à soupe de farine dans le plat quand l’oignon a atteint un roux blond (doré).
Faire blondir la farine et ajouter de l’eau ainsi que l’agneau (viande couverte).
Ajouter un bouquet garni et un une gousse d’ail.
Faire une petite mayonnaise avec 3 jaunes d’œufs puis lier hors feu la sauce.
Faire attention de ne pas brosser la sauce en laissant sur le feu.
Ajouter vinaigre et citron",
    category: PLAT_VIANDE
  },
  { title: "Lapin Lardorel ",
    author: "Manou",
    ingredients: "- 1 lapin - thym - laurier - oignons - persillade - cornichons - vinaigre",
    description: "Faire dorer le lapin coupé avec thym et laurier dans une grande poêle.
Couvrir ensuite le lapin de beaucoup d’oignons et faire suer sans dorer. Couvrir et ne pas remuer jusqu’à la fin.
Faire une persillade, avec de l’ail et du persil, y rajouter le foie cru haché, cornichons coupés fins puis vinaigre
Déglacer le lapin avec cette persillade",
    category: PLAT_VIANDE
  },
  { title: "Lapin en sauce Saupiquet ",
    author: "Manou",
    ingredients: "- 1 lapin - 1 oignon - huile - 1 carotte - jambon - farine - vin blanc - laurier - thym - 1 gousse d'ail - vinaigre - cornichons - sel - poivre - persil - genièvre",
    description: "Faire cuire un lapin si possible sauvage au four.
Puis, à part :
Faire dorer un oignon haché dans une petite casserole avec de l’huile.
Ajouter une carotte coupée en très petits dés, voire un petit peu de jambon coupé menu.
Ajouter au dernier moment un peu de farine. Dorer.
Ajouter un verre de vin blanc, laurier et thym. 1 gousse d’ail.
Ajouter de l’eau si nécessaire.
Cuire ½ heure.
Au dernier moment, ajouter le foie du lapin sauvage haché, vinaigre, 1 ou 2 cornichons haché(s).
Ajouter un peu de jus maigre du lapin en fin de cuisson.
Ajouter sel, poivre, persil et genièvre.",
    category: PLAT_VIANDE
  },
  { title: "Canard aux olives",
    author: "Manou",
    ingredients: "    • 1 canard de 2 kg
    • 2 oignons
    • 2 gousses d’ail
    • 1 carotte
    • 250gr d’olives vertes
    • 1 litre de vin blanc sec
    • 1 bouillon",
    description: "Faire revenir le canard en morceaux à l’huile d’olive, l’enlever et rajouter oignons, ails, carottes  coupés en petits dés et faire dorer.
Faire blanchir les olives vertes à l’eau bouillante, car trop salées.
Saupoudrer sur le canard la  farine, (cuire la farine), rajouter vin et bouillon, puis olives et cuire 1h.
Servir ave la purée d’olive noires :
    • 1 kg de pommes de terre
    • lait et huile d’olive pour la purée
    • rajouter 250 gr d’olives noires CONFITES à la grecque mixées.",
    category: PLAT_VIANDE
  },
  { title: "Civet de lièvre",
    author: "?",
    ingredients: "- 1 lapin - huile - sel - poivre - cognac - 300 à 400g de couenne - 1 oignon - 1 cs de farine - 1l de vin rouge - 1 carotte - thym - laurier - 1 gousse d'ail - crème",
    description: "Après avoir découpé le lapin, le faire roussir au beurre additionné d’un peu d’huile dans une poêle, saler, poivrer, le mettre dans le récipient où l’on veut le faire cuire et le flamber avec un petit verre de cognac.
Y ajouter 300 ou 400gr de couennes blanchies 10 minutes.
Hacher un oignon assez gros, le faire roussir dans la poêle avec un peu de lard de poitrine coupé en petits carrés.
Y ajouter une grosse cuillérée à soupe de farine, remuer ce mélange jusqu’à ce qu’il soit bien roux et à ce moment, verser dans la poêle un litre de bon vin rouge qu’on allume quand il bout.
Verser ce cette préparation sur le lièvre afin qu’il en soit légèrement recouvert.
Attacher une petite carotte avec un brin de thym, une feuille de laurier, une tête d’ail.
Ajouter tout cela et mettre à cuire tout doucement thermostat 5 à 6 suivant l’âge du lièvre.
A la fin de la cuisson, lier la sauce avec le foie haché, additionnée de sang qu’on aura eu soin de recueillir et auquel on aura ajouté une cuillérée de vinaigre.
Si la sauce est trop claire, la lier avec peu de farine en supplément.
Certains y ajoutent quelques cuillérées de crème fraiche quand la sauce est un peu forte, facultatif et au goût de chacun.",
    category: PLAT_VIANDE
  },
  { title: "Beignets de cervelle",
    author: "Bonne Maman",
    ingredients: "  - cervelles de veau ou de porc  • 4 œufs
    • 250 gr de farine
    • Eau
    • 2 cuillères à soupe d’huile
    • sel",
    description: "Cervelle de veau ou de porc, la faire dégorger dans de l’eau vinaigrée afin d’enlever le sang ; la faire  bien cuire à l’eau avec sel, vinaigre, laurier, thym
Mettre les jaunes d’œufs avec une bonne pincée de sel.
Monter les jaunes d’œufs puis rajouter peu à peu la farine pour faire une pate épaisse, 2 cuillères d’huile et ajouter un peu d’eau pour éclaircir, il faut que la pate soit épaisse et tienne.
Mélanger délicatement la pate et mettre un peu de pâte, un peu de cervelle ; faire frire les beignets dans la friture bouillante.
Quand les beignets sont dorés d’un côté, les retourner, puis les égoutter dans une passoire avec papier absorbant.
Au moment de faire cuire les beignets, monter les blancs d’œufs en neige.",
    category: PLAT_VIANDE
  },
  { title: "Croquettes de viande ",
    author: "Maria",
    ingredients: "- Hacher le bouilli - Béchamel bien épaisse - 2 œufs entiers",
    description: "
Mélanger le tout, laisser reposer jusqu’au lendemain
Faire des petites boules, fariner, puis chapelure puis œuf battu
Friture bouillante, et penser à égoutter.",
    category: PLAT_VIANDE
  },
  { title: "Cassoulet",
    author: "Bonne Maman et de Moucky",
    ingredients: "Pour 8 personnes environ

    • 1 kg de bons haricots secs
    • Travers de porc coupés et salés (1h avant)
    • Couennes de porc (blanchies 5 min)
    • Oignons
    • Saucisse fraiche
    • Tomates fraiches ou en boite
    • Confit d’oie ou de canard",
    description: "Blanchir dans l’eau froide les haricots 50min. Jeter cette eau de cuisson.
Dans une poêle, faire roussir dans la graisse de canard la saucisse, les couennes, les travers de porc.
Retirer la viande.
Dans ce jus, verser un gros oignon, une bonne persillade et tomates.
 Bien dorer.
Dans un grand pot en terre, mettre les haricots, toutes les viandes (saucisse coupées en morceau), recouvrir d’eau chaude avec le jus de viande, d’oignons…
Mettre au four et cuire tout doucement pendant 2h.
Rajouter de l’eau si nécessaire.
Il est préférable de mettre le confit en fin de cuisson (1/4 d’heure)
Saler à votre goût.
Les couennes doivent être entièrement débarrassées de la graisse, blanchies et coupées en morceau.",
    category: PLAT_VIANDE
  },
  { title: "Ni Gou Yeng",
    author: "Flo",
    ingredients: "pour 6 personnes gourmandes

    • Environ 800gr de porc en lamelles.
    • 2 poivrons rouges / 1 vert
    • 1 grande boite d’ananas en morceaux
    • ½ bouteille de soja (max) Prendre le bio réduit en sel !
    • 1 grand verre de vinaigre
    • 1 oignon en lamelles
    • 2 à 5 cuillères de sucre roux
    • 2 à 5 cuillères Maïzena",
    description: "Porc en lamelles à revenir avec farine, puis caraméliser avec sucre roux.
Mélanger maïzena avec sauce soja et vinaigre.
Couper les légumes en lamelles.
Mélanger avec le porc, l’ananas (le tout).
Environ 10 minutes de cuisson.
Ne pas trop faire cuire la première fois si vous réchauffer.
Servir avec riz.",
    category: PLAT_VIANDE
  },
  { title: "Chorba algérien",
    author: "Flo",
    ingredients: "- 1 kg de boulettes de bœuf français aux oignons (picard)
- 500gr de tomates pelées en boite
- Coriandre (à la fin)
- 2 épices : Ras el-hanout, épices à couscous, cannelle, paprika
- 1 bouillon cube / sel
- 2 oignons
- 1 citron pressé
- Pois chiches
- Boulghour",
    description: "Cuisson = tomates + oignons + épices (sauf coriandre) + eau
Environ ½ heure puis mixer le tout
Ajouter du citron avant la fin, puis les boulettes, les pois chiches et le boulghour
Finissez par la coriandre",
    category: PLAT_VIANDE
  },
  { title: "Morue salée sèche ",
    author: "Xinha",
    ingredients: " - 1 morue - Oignons en rondelles
- Pommes de terre en rondelle
- Morue effilochée
- Ail coupé
- Tomates coupées
- Lamelles de poivrons
- Huile d’olive",
    description: "Laisser la morue salée 14h dans de l’eau, changer d’eau une fois
Dans un pyrex, mélanger tous les autres ingrédients
Au four 1h30",
    category: PLAT_POISSON
  },
  { title: "Sauce hollandaise à servir avec un turbot poché ou un loup en croute de sel",
    author: "Bonne Maman",
    ingredients: "- 2 jaunes d’œuf
- 2 cuillérées à soupe d’eau froide - 200 gr de beurre - sel - 1/2 citron",
    description: "Monter au fouet au bain marie
Quand les jaunes sont épais, ajouter 200gr de beurre en morceaux (pour 5), sel.
La sauce Hollandaise ne doit pas être liquide
Mettre ½ citron.
Bain marie sans bouillir.
Maintenir au chaud ainsi. ",
    category: PLAT_POISSON
  },
  { title: "Baudroie en Bourride",
    author: "Manou",
    ingredients: "    • 1,5 kg de baudroie
    • 4 blancs de poireaux
    • un peu de céleri vert
    • le blanc d’une salade frisée
    • ½ litre de vin blanc et un peu d’eau",
    description: "Bien parer la baudroie et la couper en gros morceaux
Faire frire la baudroie dans une casserole. Flamber avec du cognac
Hacher le blanc de 4 poireaux, un peu de céleri, le blanc d’une salade frisée.
Faire frire dans l’huile du poisson.
Ajouter eau + vin blanc et cuire ½ heure.
Mayonnaise 4 jaunes (+huile) au dernier moment.
NE PAS FAIRE BOUILLIR
Servir avec des pommes de terre",
    category: PLAT_POISSON
  },
  { title: "Pain de Lotte",
    author: "Manou",
    ingredients: "    • 6 œufs
    • Lotte très peu cuite au court bouillon de poisson
    • 250 gr de Crème fraiche
    • Concentré de tomate
    • Kirsch ",
    description: "Bien faire égoutter la lotte cuite et coupée en gros morceaux dans une passoire.
Mélanger les œufs la crème fraiche, deux cuillères à soupe de concentré et un peu de kirsch
Rajouter la lotte et faire cuire au bain marie dans un moule à cake.",
    category: PLAT_POISSON
  },
  { title: "Lotte",
    author: "Manou",
    ingredients: "Pour 9 personnes - 2 kg de lotte - 1 oignon - sel - poivre - Béchamel - 3 tomates - estragon - optionnel : coquillages et champignons",
    description: "La faire pocher dans 1 peu d’eau avec 1 oignon, sel et poivre. Cuire 5min.
- Béchamel : beurre + farine + 1.5 verre de vin blanc, faire cuire un petit peu et mélanger le fumet de poisson ; ajouter 250 g de crème fraiche.
- Ajouter éventuellement coquillages + champignons
- Peler 3 tomates ; Garder la pulpe. Mélanger à la sauce + estragon.
         Servir avec pâtes fraiches",
    category: PLAT_POISSON
  },
  { title: "Soles normandes",
    author: "Manou et Bonne Maman",
    ingredients: "- 1,3 Kg de soles ou des filets de soles.
- 1 Kg de moules
- Une boite de champignons de Paris de 9e
- Une petite boite de truffes
- Des crevettes
- 1 L de lait",
    description: "Peler les soles. Couper les filets de la largeur du doigt
Garder les peaux de la sole, les arêtes et la tête
Faire roussir un petit oignon et une carotte
Quand tout est roussi, y mettre un verre de vin blanc sec et les peaux, arêtes, têtes et un peu de sel et de poivre.
Laisser cuire tout doucement.
Faire blanchir les moules et les crevettes et mettre environ un verre et demi d’eau des moules dans le court bouillon.
Laisser cuire 1h environ, passer ce court bouillon et y ajouter les champignons de Paris avec le jus.
Laisser cuire 1h environ.

Beurrer un plat allant au feu, y ranger les filets de sole, saler légèrement, papier beurré dessus et mettre 10 minutes à four moyen.
Le jus peut se mettre dans la sauce.
Servir les filets chauds.

Un quart d’heure avant de servir, faire une bonne béchamel avec environ 1 L de lait.
Quand elle est terminée, y ajouter tout doucement la sauce et les moules, et laisser cuire doucement 10 minutes.
Ajouter les truffes avec le jus des truffes.
Verser cette sauce sur les filets de sole.
Faire une béchamel avec moules, coquilles, crevettes, champignons et truffes
Napper le pain démoulé.
",
    category: PLAT_POISSON
  },
  { title: "Terrine aux deux saumons ",
    author: "Marie Laure",
    ingredients: "    • 600 gr de saumon frais, poché, mais très peu cuit
    • 300 gr de saumon fumé",
    description: "Emietter (mais non hacher !) à la fourchette le saumon faire et effilocher le saumon fumé.
Rajouter 150 gr de beurre ramolli, un œuf entier, citron, sel et poivre.
Mettre au frais une nuit.
Servir avec, crème fraiche et ciboulette, ou mayo. ",
    category: PLAT_POISSON
  },
  { title: "Soupe de poissons ",
    author: "?",
    ingredients: "- 1 ou 2 têtes de Merlan, ailerons de Baudroie, rognures de poissons - 1 oignon - huile - A tomate - 5 à 6 gousses d'ail - légume de pot au feau - 1 branche de thym - 1 feuille de laurier - safran - optionnel : crème de riz",
    description: "1 ou 2 têtes de Merlan, des ailerons de baudroie, des rognures de poisson ou des têtes.
Vous pouvez ajouter quelques moules auparavant ouvertes.
Hacher un oignon et le faire revenir vivement dans l’huile d’olive ainsi qu’une tomate et 5 à 6 gousses d’ail.
Ajouter environ deux litres d’eau, y mettre quelques légumes comme pour le pot au feu, une branche de thym, une feuille de laurier, un peu de safran.
Laisser bouillir le tout 20 minutes à gros bouillons. Passer la mixture ainsi obtenue au moulin à légumes. Si la soupe n’est pas assez onctueuse, ajouter 1 ou 2 cuillérées de crème de riz.
Il faut que la soupe ait la consistance d’une béchamel légère.",
    category: PLAT_POISSON
  },
  { title: "Bouillabaisse",
    author: "?",
    ingredients: "- Un gros oignon haché très fin
- 3 tomates moyennes (pelées et graines enlevées)
- 1 grain d’ail
- Un bouquet de persil, 3 feuilles de laurier, thym, serpolet
- Un peu de peau de citron, safran, poivre de Cayenne
- Sel et poivre",
    description: "Mettre dans une casserole large ½ verre d’huile, oignon, tomates…
Mettre par couches :
- Saint Pierre
- Baudroie
- Merlan
- Rascasses
- Rougets
- Turbot
- Crabes*
- Langoustine*
- Langouste*

Poissons durs dessous, tendres dessus.
Ajouter un verre et demi de vin blanc, un peu d’eau.
Cuire 20 minutes.
Feu vif au début, doux à la fin, liaison si l’on désire.

*  Crabes, langoustine, langouste : 10 minutes de cuisson dans l’eau salée avant",
    category: PLAT_POISSON
  },
  { title: "Beignets soufflés",
    author: "?",
    ingredients: "- 80 gr de beurre - 30 g de sucre - sel - 1/4 l d'eau - 150 gr de farine - 4 oeufs frais - sucre",
    description: "Mettre dans une casserole 80gr de beurre, 30 gr de sucre, une pincée de sel et ¼ de litre d’eau.
Placer la casserole sur le feu et y verser 150gr de farine qui aura été tamisée, remuer avec une spatule de manière à obtenir un mélange consistant et homogène.
Remettre la casserole sur le feu sans cesser de remuer afin de la dessécher un peu en la cuisant.
La laisser jusqu’à ce que la pâte n’adhère plus à la spatule.
A ce moment, sortir la casserole du feu et sans attendre, ajouter successivement 4 œufs frais entiers en les incorporant l’un après l’autre, ajouter le dernier blanc monté en neige.
Laisser reposer la pâte. Mettre gros comme des noix de pâte dans la friture modérément chaude. Egoutter et servir chaud. Saupoudrer de sucre.   ",
    category: DESSERT
  },
  { title: "Gratin de fruits rouges",
    author: "Manou",
    ingredients: "    • 300gr de framboises
    • 300gr de myrtilles / groseilles
    • Egoutter les fruits
    • 4 jaunes d’œufs
    • 15cl de crème
    • 2 cuillères à café de sucre vanillé",
    description: "Mettre fruits dans un grand plat à gratin.
Chauffer fort le grill du four.
Mélanger le jaunes d’œufs, la crème, le sucre vanillé + 2 cuillères d’eau et faire cuire doucement l’ensemble dans une casserole à fond épais, il faut que ce soit épais comme une crème pâtissière.
Napper les fruits bien égouttés avec cette crème et mettre au grill le temps que ca dore, 3/5 minutes.
Servir tout de suite",
    category: DESSERT
  },
  { title: "Gâteau au chocolat",
    author: "Fifi",
    ingredients: "• 200gr de chocolat noir
    • 200gr de pralinoise  (en supermarché)
    • 250/300 gr de beurre
    • 250gr de sucre roux
    • 8 œufs
    • 8 cuillères à soupe rase de  farine",
    description: "Faire fondre chocolat, pralinoise + beurre.
Mélanger sucre roux, œufs, farine. Mixer le tout jusque ce soit mousseux.
Tout mélanger.
Faire cuire 15min à four 205°C.",
    category: DESSERT
  },
  { title: "Vacherin à la vanille ",
    author: "Manou",
    ingredients: "Pour 10 personnes :
    • 8 œufs
    • 100gr de sucre normal
    • 400gr de crème
    • 5 sachets de  Vanille en poudre
    • 100gr de sucre glace
    • 1 paquet de meringues ou meringue faite maison ",
    description: "Mélanger les jaunes d’œufs, le sucre normal, la crème et la vanille.
Mélanger  le blanc d’œuf en neige bien ferme et le  sucre glace.
Mélanger le tout à la fourchette.
Intercaler dans un moule rond la meringue écrasée et les mélanger.
Mettre au congélateur.
Servir avec du chocolat fondu et de la chantilly ou avec des fruits rouges, des kiwis, etc…",
    category: DESSERT
  },
  { title: "Pommes",
    author: "Fifi",
    ingredients: "    • 1kg de pommes pelées
    • 250 gr de sucre
    • ¼ L d’eau
    • Zeste citron ",
    description: "Faire cuire ensemble à la casserole jusqu’à obtention d’une compote. Laisser quelques morceaux.",
    category: DESSERT
  },
  { title: "Malakoff",
    author: "Fifi",
    ingredients: "- Crème à la vanille - 12 blancs d'oeuf - caramel - 20 morceaux de sucre",
    description: "Faire crème à la vanille.
Monter 12 blancs d’œuf.
Faire beaucoup de caramel, 20 morceaux de sucre à peine mouillés.
Quand c’est très chaud (bouilli), consistance caramel rajouter aux blancs d’œuf et continuer à fouetter.
Servir avec la crème à la vanille.",
    category: DESSERT
  },
  { title: "Flan à la noix de Coco",
    author: "Fifi",
    ingredients: "    • 4 œufs
    • Lait de coco
    • Crème liquide
    • ½ sachet de poudre de coco
    • 1 petite boite de lait concentré sucré
    • Zeste de citron
    • Vanille",
    description: "Mélanger le jaune d’œuf + lait coco + crème + poudre + lait concentré + citron + vanille.
Monter les blancs d’œufs en neige.
Mélanger les deux.
Mettre au bain marie chaud ½ heure thermostat 7.
Mettre plus chaud puis baisser.",
    category: DESSERT
  },
  { title: "Petits fours à la noix de coco",
    author: "?",
    ingredients: "Pour 35 petits fours:
    • 250gr de noix de coco
    • 250gr de sucre
    • 5 cuillérées à soupe de farine
    • 5 cuillérées à soupe de lait
    • 3 œufs entiers",
    description: "Travailler les œufs avec le sucre, y ajouter la noix de coco, la farine et le lait.
Faire des petits tas, y mettre des petits morceaux de cerises confites.
Four à Th 6 environ ½ heure, à surveiller.",
    category: DESSERT
  },
  { title: "Petits fours aux amandes",
    author: "?",
    ingredients: "    • 200gr d’amandes émondées et moulues
    • 150gr de sucre en poudre
    • 2 blancs d’œufs non battus
    • Un peu d’écorce d’orange confite, hachée très menu",
    description: "Tout mélanger puis, rouler dans les amandes effilées. Passer du lait au pinceau.
Mettre à four chaud pendant 10min.",
    category: DESSERT
  },
  { title: "Tarte flamande",
    author: "?",
    ingredients: "    • 1 œuf entier
    • 5 cuillérées à soupe de farine
    • 3 cuillérées de sucre
    • 3 cuillérées de lait
    • 2 cuillérées d’huile
    • ½ paquet de beurre
    • Travailler le tout",
    description: "Mettre dans un moule à tarte beurrée.
Ajouter dessus 3 poires ou pommes coupées minces.
Mettre à four Th 7 ou 8 un quart d’heure.
Préparer une crème avec 80gr de beurre ramolli, 3 cuillérées de sucre, un œuf. Mettre dessus.
Cuire ¼ d’heure de plus.",
    category: DESSERT
  },
  { title: "Tarte au citron",
    author: "Maria",
    ingredients: "Pâte : • 1 œuf et un jaune
    • 80g de beurre
    • Farine
    • 2 cuillères de sucre
    Crème au citron:
    • 75g de beurre
    • 2 œufs entiers.
    • Rapper 2 citrons
    • 7 cuillérées de sucre,
    • 2 cuillérées d’eau.
    • Le jus de 3 citrons",
    description: "Faire la crême au citron au bain marie
Faire cuire la pâte puis rajouter la crème quand tout est bien froid.",
    category: DESSERT
  },
  { title: "Fudge",
    author: "Fifi",
    ingredients: "    • 450gr de sucre
    • 1 tasse à thé de lait concentré non sucré
    • 6 grandes cuillères à soupe de beurre
    • 1 cuillère à café d’essence de vanille",
    description: "Faire fondre le beurre (pas cuit). Ajouter sucre puis vanille puis le lait.
Faire cuire à gros bouillon de 15 à 20 min avec 1 cuillère en bois.
Quand le sucre se détache, ôter du feu et remuer
Laisser refroidir",
    category: DESSERT
  },
  { title: "Baba au rhum",
    author: "Manou",
    ingredients: "    • 4 cuillères à soupe de sucre
    • 3 œufs
    • 6 cuillères de farine
    • 4/5 cuillères de lait
    • 1 paquet de levure maxi
    • Sirop : ½ litre au moins d’eau / 200-225g de sucre / 1 grand verre de rhum",
    description: "Bien beurrer un grand moule à savarin (baba) (25 cm de diamètre)
Mettre les jaunes d’œufs dans une terrine, garder les blancs.
Ajouter  petit à petit en tournant le sucre, bien travailler le mélange pour qu’il devienne blanc et mousseux.
Incorporer ensuite la farine en remuant, puis le lait, la levure et battre les blancs en neige.
Mélanger le tout légèrement et mettre à four doux (4/5 Th) 20 à 30 minutes. Le baba doit être bien doré et l’aiguille sèche.
Démouler le baba tiède sur une grille, laver le moule, le sécher.
Préparer le sirop.
Remettre le baba dans le moule, l’imprégner petit à petit de sirop chaud.
Ne le démouler qu’avant le repas.
Ajouter de la chantilly et des fruits rouges selon les goûts.",
    category: DESSERT
  },
  { title: "Les Mazamétains",
    author: "?",
    ingredients: "    • 4 blancs d'œufs
    • 200 gr de sucre
    • 150 gr de beurre fondu
    • 70 gr de farine
    • 70 gr d'amandes en poudre
    • 1 sachet de sucre vanillé",
    description: "A feu doux, remuer sans s’arrêter pendant 5 minutes le sucre, les amandes, la farine et les blancs d'œufs.
Ajouter le beurre et le sucre vanillé.
Verser la préparation au 3/4 dans des petits moules (type financiers ou muffins).
Cuire à four préchauffé à 150° (th.5) pendant 25 à 30 minutes",
    category: DESSERT
  },
]

RECIPES.each do |recipe|
  Recipe.new(recipe).tap do |r|
    r.user = initial_publisher
    r.save!
  end
end




