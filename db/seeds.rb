# db/seeds.rb

puts "Clearing existing data"
GardenStep.destroy_all
Task.destroy_all
Step.destroy_all
Garden.destroy_all
Package.destroy_all
User.destroy_all

puts "Creating an admin user"
admin = User.create!(
  id: 1,
  email: 'admin@site.com',
  password: '000000',
  password_confirmation: '000000'
)

puts "Creating gardens for the admin user"
garden1 = Garden.create!(
  name: "Le bac de la courette",
  size: "Bac potager",
  exposition: "Soleil le midi",
  address: "43, boulevard Stalingrad, Nantes, France",
  user_id: 1
)
file = File.open(Rails.root.join("app/assets/images/garden_size/size_2_bac.jpeg"))
garden1.photo.attach(io: file, filename: "size_2_bac.jpeg", content_type: "image/jpeg")

garden2 = Garden.create!(
  name: "Mon magnifique balcon",
  size: "Jardinière",
  exposition: "Pas de soleil",
  address: "43, boulevard Stalingrad, Nantes, France",
  user_id: 1
)
file = File.open(Rails.root.join("app/assets/images/garden_size/size_1_jardiniere.webp"))
garden2.photo.attach(io: file, filename: "size_1_jardiniere.webp", content_type: "image/webp")

garden3 = Garden.create!(
  name: "Le potager partagé",
  size: "potager partagé",
  exposition: "Soleil le matin",
  address: "4, rue de la Moutonnerie, Nantes, France",
  user_id: 1
)
file = File.open(Rails.root.join("app/assets/images/garden_size/size_3_potager.webp"))
garden3.photo.attach(io: file, filename: "size_3_potager", content_type: "image/webp")

puts "Creating packages with steps and tasks"
package1 = Package.create!(
  name: "Kit Kebab",
  category: "Légumes",
  description: "Ce kit vous permettra de cuisiner d'excellents kebabs maison : tomates, oignons, salade",
  size: "Bac potager",
)

step1_1 = Step.create!(
  order: 1,
  name: "Préparer ma terre et acheter le nécessaire",
  description: "Pour un carré potager au sol, la préparation du terrain
  est assez succincte. Suivez les 2 tâches de l'étape.",
  package: package1
)
file = File.open(Rails.root.join("app/assets/images/garden_pictures/preparer_terrain.png"))
step1_1.photo.attach(io: file, filename: "preparer_terrain.png", content_type: "image/png")

step1_2 = Step.create!(
  order: 2,
  name: "Plantons et semons !",
  description: "Cette étape importante vous explique comment planter
  tomates et oignons et semer les salades",
  package: package1
)
file = File.open(Rails.root.join("app/assets/images/garden_pictures/planter.png"))
step1_2.photo.attach(io: file, filename: "planter.png", content_type: "image/png")

step1_3 = Step.create!(
  order: 3,
  name: "Surveillance avant récolte",
  description: "Cette étape vous donne les astuces de la surveillance des légumes,
  l'arrosage, et les temps avant les récoltes",
  package: package1
)
file = File.open(Rails.root.join("app/assets/images/garden_pictures/surveiller.png"))
step1_3.photo.attach(io: file, filename: "surveiller.png", content_type: "image/png")

Task.create!(
  order: 1,
  name: "Aller chercher du terreau",
  description: "Selon la taille approximatif de votre bac, achetez le nombre de litres de terreau nécessaire.",
  step: step1_1
)
Task.create!(
  order: 2,
  name: "Acheter le nécessaire pour les légumes",
  description: "Rendez-vous en ligne ou dans un magasin de jardinage de votre choix
  pour acheter :
  - 4 plants de tomates avec les variétés suivantes Roma, Montfavet, Flavio (vous pouvez mixer ou acheter une seule variété)
  - 10 plants d'oignons jaunes ou rouges
  - 1 sachet de graines de salades comprises dans celles qui aiment le soleil et supportent la chaleur : laitue romaine, laitue pommée, roquette ",
  step: step1_1
)
Task.create!(
  order: 3,
  name: "Verser le terreau dans le bac",
  description: "Verser le terreau dans le bac et tasser avec votre pied au fur et à mesure",
  step: step1_1
)

Task.create!(
  order: 1,
  name: "Semons les salades ! ",
  description: "Sur une ligne de la largeur de votre bac, creusez avec votre doigt un sillon dans la terre
  d'environ 1cm. Prenez un tas de graines du sachet dans votre main gauche et en faisant une pince pouce-index, prenez au fur
  et à mesure des graines et placez les dans le sillon en essayant de ne pas faire de tas. Puis, refermez le sillon en remettant la terre sur
  les graines. ",
  step: step1_2
)

Task.create!(
  order: 2,
  name: "Plantons les tomates ! ",
  description: "Faites autant de trous que de tomates achetées. Vos tomates ont besoin d'être plantées dans un trou qui
  fait 2 fois leur volume de pot. Chaque trou est écarté des autres par 30cms.
  Une fois les trous faits, enlevez chaque tomate de son pot, placez la dans un trou et
  refermez la terre sur elle.
  Une fois que tout est planté, vous pouvez arrosez les tomates avec l'équivalent d'un grand verre d'eau chacune. Les tomates
  auront besoin d'un tuteur que vous pouvez acheter ou confectionner vous même.",
  step: step1_2
)

Task.create!(
  order: 3,
  name: "Plantons les oignons ! ",
  description: "Faites autant de trous que d'oignons achetés. Vos oignons ont besoin d'être plantés dans un trou qui
  fait la taille de leur pot. Chaque trou est écarté des autres par 10cms.
  Une fois les trous faits, enlevez chaque oignon de son pot, placez le dans un trou et
  refermez la terre sur ses racines.
  Une fois que tout est planté, pas besoin d'arroser l'oignon est un bulbe, il est auto-suffisant",
  step: step1_2
)

Task.create!(
  order: 1,
  name: "Surveillance",
  description: "Durant la vie de vos légumes et fruits, il vous faudra surveiller leur évolution au moins 3 fois par semaine. Les oignons nécessitent
  très peu de soin, ils sont autosuffisants. Sur les tomates, il vous faudra enlever les gourmands qui poussent entre le tronc et les branches.
  Les salades nécessitent surtout de la surveillance pour ne pas être mangé dès leur premier stade par les limaces ou les escargots. Le plus efficace demeure de chasser les gastéropodes à la tombée de
  la nuit mais vous pouvez aussi acheter des produits en magasin de jardinage.",
  step: step1_3
)

Task.create!(
  order: 2,
  name: "Arrosage",
  description: "*Salades : votre salade aura besoin d'un arrosage régulier que ce soit par vous ou par la pluie, le sol doit être humide au moins 1 jour sur 2.
  - Tomates : La tomate a besoin d'être arrosé sur son pied et non sur ses feuilles. vous pouvez partir sur un arrosage de un verre d'eau par pied tous les 3 jours
  sauf si le sol est humide.
  - Oignons : l'oignon est facile à entretenir. Il est autosuffisant et rustique. Veillez à ce que son sol ne soit pas humide constamment car un risque de pourriture
  serait alors son principal danger. Avoir un peu d'humidité est suffisant pour lui, s'il est planté pas trop loin de ses amies salades et tomates il profitera de leur
  arrosage",
  step: step1_3
)

Task.create!(
  order: 3,
  name: "Prévoir temps avant récolte",
  description: "Oignons : A recolter environ 4 mois après votre plantation. Ne vous précipitez pas trop pour récolter vos oignons. Pas mûrs à point, ils ne se conserveront pas.
  Attendez que les fanes soient bien sèches et qu’elles aient pratiquement disparu.
  - Tomates : vos tomates vont être produites au fur et à mesure environ 3 mois après votre plantation. Vos tomates peuvent produire jusqu'à l'automne si les températures le permettent.
  - Salades : vos salades peuvent être récoltées petites, grosses et au fur et à mesure. Si vous souhaitez les éclaircir au fur et à mesure vous le pouvez mais ce n'est pas
  obligatoire. Elles supportant la densification et vous pouvez ainsi consommer les feuilles au fur et à mesure sans arracher une salade entière. Elles arriveront à pleine
  maturité environ 2 mois après leur semis (un mois si vous avez choisi la roquette).",
  step: step1_3
)

# Task.create!(
#   order: 1,
#   name: "Tâche 1.4.1",
#   description: "Description pour la tâche 1.4.1",
#   step: step1_4
# )

# Task.create!(
#   order: 2,
#   name: "Tâche 1.4.2",
#   description: "Description pour la tâche 1.4.2",
#   step: step1_4
# )

# Task.create!(
#   order: 3,
#   name: "Tâche 1.4.3",
#   description: "Description pour la tâche 1.4.3",
#   step: step1_4
# )

package2 = Package.create!(
  name: "Confiture fraise-framboise",
  category: "Fruits",
  description: "Ce kit vous permettra de cuisiner une confiture maison fruits rouges !",
  size: "Jardinière",
)

step2_1 = Step.create!(
  order: 1,
  name: "Préparer ma terre et acheter le nécessaire",
  description: "Pour une jardinière, la préparation du terrain
  est assez succincte. Suivez les tâches de l'étape.",
  package: package2
)
file = File.open(Rails.root.join("app/assets/images/garden_pictures/preparer_terrain.png"))
step2_1.photo.attach(io: file, filename: "preparer_terrain.png", content_type: "image/png")

step2_2 = Step.create!(
  order: 2,
  name: "Plantons!",
  description: "Cette étape importante vous explique comment planter
  vos fraisiers et votre framboisier",
  package: package2
)
file = File.open(Rails.root.join("app/assets/images/garden_pictures/planter.png"))
step2_2.photo.attach(io: file, filename: "planter.png", content_type: "image/png")

step2_3 = Step.create!(
  order: 3,
  name: "Surveillance avant récolte",
  description: "Cette étape vous donne les astuces de la surveillance des fruits,
  l'arrosage, et les temps avant récolte",
  package: package2
)
file = File.open(Rails.root.join("app/assets/images/garden_pictures/surveiller.png"))
step2_3.photo.attach(io: file, filename: "surveiller.png", content_type: "image/png")

# step2_4 = Step.create!(
#   order: 4,
#   name: "Étape 2.4",
#   description: "Description pour l'étape 2.4",
#   package: package2
# )

Task.create!(
  order: 1,
  name: "Aller chercher du terreau",
  description: "Selon la taille approximatif de votre bac, achetez le nombre de litres de terreau nécessaire.",
  step: step2_1
)

Task.create!(
  order: 2,
  name: "Acheter le nécessaire",
  description: "Rendez-vous en ligne ou dans un magasin de jardinage de votre choix
  pour acheter :
  - 4 plants de fraisiers avec les variétés suivantes mara des bois, pink panda, ou Alexandria, plus adaptés à l'ombre (vous pouvez mixer ou acheter une seule variété)
  - 1 framboisier nain du type Little Sweet Sister, faites vous conseiller en magasin",
  step: step2_1
)

Task.create!(
  order: 3,
  name: "Verser le terreau dans la jardinière",
  description: "Verser le terreau dans la jardinière et tasser avec votre main. Laissez un côté de la
  jardinière remplie seulement à la moitié sur 30 cm environ",
  step: step2_1
)

Task.create!(
  order: 1,
  name: "Plantons le framboisier ! ",
  description: "Du côté où vous avez à moitié rempli la jardinière, placez votre framboisier après l'avoir enlevé de
  son pot. Mettez le terreau nécessaire pour récouvrir toutes les racines.",
  step: step2_2
)

Task.create!(
  order: 2,
  name: "Plantons les fraisiers",
  description: "Faites autant de trous que de fraisiers achetés.
  Vos fraisiers ont besoin d'être plantés dans un trou qui
  fait la taille de leur pot. Chaque trou est écarté des autres par 10cms.
  Une fois les trous faits, enlevez chaque fraisier de son pot, placez le dans un trou et
  refermez la terre sur ses racines.",
  step: step2_2
)

Task.create!(
  order: 3,
  name: "Arrosage à la plantation",
  description: "Arrosez le framboisier avec 1 grand verre d'eau. Arrosez chaque fraisier avec un demi verre d'eau.",
  step: step2_2
)

Task.create!(
  order: 1,
  name: "Surveillance",
  description: "Durant la vie de vos fruits,
  il vous faudra surveiller leur évolution au moins 2 fois par semaine.
  Les framboisiers et fraisiers demandent peu d'entretien et ont peu de prédateurs
  citadins (à part les humains bien sur :-) Regardez les pousser et surtout surveillez l'humidité",
  step: step2_3
)

Task.create!(
  order: 2,
  name: "Arrosage",
  description: "*Fraisiers : vos fraisiers auront besoin d'un arrosage régulier que ce soit par vous ou par la pluie, le terreau doit être humide au moins 1 jour sur 3.
  *Framboisier : votre framboisier aura besoin d'un arrosage régulier que ce soit par vous ou par la pluie, le terreau doit être humide au moins 1 jour sur 4.",
  step: step2_3
)

Task.create!(
  order: 3,
  name: "Prévoir temps avant récolte",
  description: "*Fraisiers : vos fraises vont être produites au fur et à mesure environ 1 mois après plantation.
  *Framboisier : votre framboisier ne va peut-être pas produire la première année car il peut être perturbé par la plantation
  et ne produire qu'à partir de la deuxième année durant laquelle il pourra vous donner des
  fruits à partir du mois de mai ",
  step: step2_3
)

# Task.create!(
#   order: 1,
#   name: "Tâche 2.4.1",
#   description: "Description pour la tâche 2.4.1",
#   step: step2_4
# )

# Task.create!(
#   order: 2,
#   name: "Tâche 2.4.2",
#   description: "Description pour la tâche 2.4.2",
#   step: step2_4
# )

# Task.create!(
#   order: 3,
#   name: "Tâche 2.4.3",
#   description: "Description pour la tâche 2.4.3",
#   step: step2_4
# )

package3 = Package.create!(
  name: "Vous reprendrez bien de la ratatouille ?",
  category: "Mix",
  description: "Ce kit vous permettra de cuisiner une ratatouille provençale !",
  size: "Bac potager",
  )

package4 = Package.create!(
  name: "Tartofraiz & co",
  category: "Fruits",
  description: "Ce kit vous permettra de faire de magnifiques tartes aux fruits !",
  size: "Bac potager",
  )

package5 = Package.create!(
  name: "Tisanes à gogo !",
  category: "Aromatiques",
  description: "Ce kit vous permettra d'aromatiser votre cuisine et préparer de merveilleuses tisanes !",
  size: "Bac potager",
  )

package6 = Package.create!(
  name: "Et si on pédalait dans la choucroute ?",
  category: "Légumes",
  description: "Ce kit vous permettra de cuisiner une petite choucroute alsacienne !",
  size: "Jardinière",
)

package7 = Package.create!(
  name: "Vous reprendrez bien de la soupe ?",
  category: "Mix",
  description: "Ce kit vous permettra de cuisiner une petite soupe !",
  size: "Jardinière",
)

package8 = Package.create!(
  name: "Tisanes relaxantes en préparation",
  category: "Aromatiques",
  description: "Ce kit vous permettra de créer des tisanes maison",
  size: "Jardinière",
)

puts "Creating garden steps"
GardenStep.create!(
  garden: garden1,
  step: step1_1,
  status: 0
)

GardenStep.create!(
  garden: garden1,
  step: step1_2,
  status: 0
)

GardenStep.create!(
  garden: garden1,
  step: step1_3,
  status: 0
)

GardenStep.create!(
  garden: garden2,
  step: step2_1,
  status: 0
)

GardenStep.create!(
  garden: garden2,
  step: step2_2,
  status: 0
)

GardenStep.create!(
  garden: garden2,
  step: step2_3,
  status: 0
)
