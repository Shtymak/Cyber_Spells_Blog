# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create!( [
  {name: "Опера"},
  {name: "Балет"},
  {name: "Бароко-поп"},
  {name: "Епоха класицизму"},
  {name: "Ренесанс"},
  {name: "Романтизм"},
  {name: "Симфонія"},
  {name: "Інша"}
  ] )

  User.first_or_create([
    {email: "admin@gmail.com",nickname:"Admin", password: "testadminuser", password_confirmation: "testadminuser"}
  ])

  Post.first_or_create({
    title: "Симфонія №5",
    body: "Симфонія № 5 ор. 67 Л. Бетховена, до мінор, завершена 1808 року. Складається з 4-х частин:

Allegro con brio, написана в сонатній формі. Темп Allegro con brio означає «швидко, з вогнем». Частина відкривається так званою «темою долі» — мотиву з чотирьох нот, що повторюється двічі, вдруге — одним ступенем нижче. Це основний мотив, з якого виросли всі інші теми частини.
Andante con moto, повільна. Глибокі роздуми про щось серйозне, значне. Написана у формі варіацій на 2 теми.
Scherzo: Allegro (у перекладі з італійської — «жарт»). Музика цієї частини за настроєм повертає нас до першої частини. Третя і четверта частини симфонії звучать одна за одною без перерви. Це єдиний приклад у симфонічній музиці довгого і безупинного crescendo від PP до FF початку фіналу)
Allegro. Фінал. Звучить святково, переможно. Написаний у формі сонатного алегро.",
    set_image: "Bethoven",
    set_audio: "bethoven_-_simfoniya-nomer-5",
    images: nil,
    category_id: 5,
    user_id: 1,
    views: 0
    })

    Rating.first_or_create({
      post_id:1,
      user_id:1,
      value:4
      })
