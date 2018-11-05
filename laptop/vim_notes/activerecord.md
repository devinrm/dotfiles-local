[Associations](https://guides.rubyonrails.org/association_basics.html)

[Querying](https://guides.rubyonrails.org/active_record_querying.html)


```ruby
selected_users = User.where("user_name LIKE ?", "%isabellasmith%")
selected_users.map{ |u| p u.user_name }
```

```ruby
f << User.where.not(role: "Student").
  where.not(email_domain: nil).map { |user| user.email_domain }
f = File.new("whitelist_domains.rb", "w")
```

* Similar to the (?) replacement style of params, you can also specify keys in
your conditions string along with a corresponding keys/values hash:

```sql
Client.where("created_at >= :start_date AND created_at <= :end_date",
  {start_date: params[:start_date], end_date: params[:end_date]})
```

* Foreign key always goes on the child (belongs_to)

* active record methods:

`find`

`create_with`

`distinct`

`eager_load`

`extending`

`from`

`group`

`having`

`includes`

`joins`

`left_outer_joins`

`limit`

`lock`

`none`

`offset`

`order`

`preload`

`readonly`

`references`

`reorder`

`reverse_order`

`select`

`where`

```sql
EssentialQuestion belongs to Theme:

EssentialQuestion.joins(:theme).where(themes: { license: "Public domain" })

SELECT "essential_questions".*
FROM "essential_questions"
INNER JOIN "themes"
ON "themes"."id" = "essential_questions"."theme_id"
WHERE "themes"."license" = $1  [["license", "Public domain"]]
```

```sql
Theme has_many EssentialQuestions:

Theme.joins(:essential_questions).distinct.where(essential_questions: { license: "Public domain" })

SELECT DISTINCT "themes".*
FROM "themes"
INNER JOIN "essential_questions"
ON "essential_questions"."theme_id" = "themes"."id"
WHERE "essential_questions"."license" = $1
ORDER BY theme ASC  [["license", "Public domain"]]
```

* **Important**: When you have a has_many relationship and you're joining it to
another table. You probably want to use distinct

* `LEFT OUTER JOIN` includes all records, even if missing the relationship. i.e.,
return all Themes whether they have license or not

* Eager loading:

`Theme.includes(:essential_questions).where(essential_questions: { license: "Public domain" })`
`Theme.includes(:essential_questions).where(essential_questions: { license: "Public domain" }).references(:essential_questions)`

Delegations:

Delegations work by a child (belongs_to) asking it's parent for information
