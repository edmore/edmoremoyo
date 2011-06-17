Factory.define :user do |f|

  f.sequence(:email) { |n| "foo#{n}@gmail.com" }
  f.password  'foobar'
  f.password_confirmation { |u| u.password }

end

Factory.define :profile do |f|

  f.summary  'My Summary'
  f.education  'Education'
  f.skills  'My Skills'
  f.experience 'My Experience'

end

Factory.define :post do |f|
  f.title  'My Blog'
  f.body  'This is my first blog'
end

