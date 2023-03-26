# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Admin.create!(
  email: ENV['ADMIN_EMAIL'],
  password: ENV['ADMIN_PASSWORD']
)

EndUser.create!(
  [
    {email: 'olivia@test.com', last_name: '織馬', first_name: '健', last_name_kana: 'オリバ', first_name_kana: 'ケン', login_name: 'オリケン', password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/no_image.jpg"), filename:"no_image.jpg")},
    {email: 'james@test.com', last_name: 'ジェイムズ', first_name: 'ワットーソン', last_name_kana: 'ジェイムズ', first_name_kana: 'ワットーソン', login_name: 'ジェムソン', password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/no_image.jpg"), filename:"no_image.jpg")},
    {email: 'lucas@test.com', last_name: '流羽粕', first_name: 'ウォーカー', last_name_kana: 'ルウカス', first_name_kana: 'ウォーカー', login_name: 'ルーカス', password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/no_image.jpg"), filename:"no_image.jpg")}
  ]
)

genres = Genre.create!(
  [
    {name: '1飜役' },
    {name: '2飜役' }
  ]
)

MahjongHand.create!(
  [
    {name: 'リーチ (立直)', describe: '門前のみ。立直(リーチ)の宣言後、一巡目までに ツモ またはロンでアガった場合に成立する役。ただし、一巡以内に鳴き(ポン、チー、明槓)が入ると成立しません。', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/no_image.jpg"), filename:"no_image.jpg"), genre_id: genres[0].id},
    {name: 'イッパツ (一発)', describe: '門前のみ。テンパイ の形(アガリの一つ手前の状態)になっている場合、リーチと宣言して1,000点棒(リーチ棒＝供託用)を場に出すことで成立。', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/no_image.jpg"), filename:"no_image.jpg"), genre_id: genres[0].id}
  ]
)

