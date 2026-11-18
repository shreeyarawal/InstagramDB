# Instagram Database Management System

A relational database project built with **MySQL 8.0** and **MySQL Workbench**. It models Instagram-style accounts, posts, categories, likes, comments, and follower relationships.

## Project overview

This project demonstrates relational database design, primary and foreign keys, sample data insertion, SQL queries with joins and aggregation, and a view that summarizes post engagement.

## Technologies

- MySQL Server 8.0
- MySQL Workbench
- SQL

## Database structure

The database is named `InstagramDB` and contains seven tables:

| Table | Purpose |
| --- | --- |
| `Account_Types` | Defines account types, such as Creator and Business |
| `Users` | Stores account details and assigns an account type to each user |
| `Categories` | Defines post categories |
| `Posts` | Stores posts and links each one to its author and category |
| `Likes` | Records which users liked which posts |
| `Comments` | Stores comments made by users on posts |
| `Follows` | Records who follows whom |

### Relationships

- `Users.account_type_id` references `Account_Types.account_type_id`.
- `Posts.user_id` references `Users.user_id`.
- `Posts.category_id` references `Categories.category_id`.
- `Likes.user_id` references `Users.user_id`, and `Likes.post_id` references `Posts.post_id`.
- `Comments.user_id` references `Users.user_id`, and `Comments.post_id` references `Posts.post_id`.
- `Follows.follower_id` and `Follows.following_id` both reference `Users.user_id`.

The `Likes` table uses the combination of `user_id` and `post_id` as its primary key, preventing the same user from liking the same post more than once. The `Follows` table uses a combined primary key for the follower and followed user.

## Entity-relationship diagram

![InstagramDB ER diagram](InstagramDB_ER_Diagram.png)

An editable MySQL Workbench model is included in `InstagramDB_ER_Diagram.mwb`.

## Sample data

The `seed.sql` script contains sample records for all seven tables:

| Table | Records inserted by the script |
| --- | ---: |
| Account_Types | 5 |
| Users | 6 |
| Categories | 5 |
| Posts | 15 |
| Likes | 15 |
| Comments | 15 |
| Follows | 15 |

These records are for learning and demonstration. The `password_hash` values are placeholders, not real password hashes, and must not be used for production authentication.

## SQL queries

The `queries.sql` file contains five example queries:

1. **Post details:** Shows posts with usernames and category names, newest first.
2. **Posts by account type:** Shows posts by users whose account type is `Creator`.
3. **Comments on a post:** Shows comments and their authors for post ID `1`.
4. **Likes per post:** Counts likes for each post, including posts with zero likes.
5. **Followers and following:** Shows follower/following username pairs.

These queries demonstrate `SELECT`, `WHERE`, `JOIN`, `LEFT JOIN`, `COUNT`, `GROUP BY`, and `ORDER BY`.

## SQL view

The `view.sql` file creates a view called `vw_MainFeed`. It combines posts and usernames with the number of likes and comments on each post.

The view displays the columns `post_id`, `username`, `caption`, `created_at`, `TotalLikes`, and `TotalComments`. It uses `COUNT(DISTINCT ...)` so that joining likes and comments does not inflate the counts.

To display the feed, run:

```sql
SELECT *
FROM vw_MainFeed
ORDER BY created_at DESC;
```

## How to run

1. Install **MySQL Server 8.0** and **MySQL Workbench**.
2. Connect to your MySQL server in Workbench.
3. Open and execute **`schema.sql`** to create the `InstagramDB` database and its seven tables.
4. Open and execute **`seed.sql`** to insert the sample records.
5. Open and execute **`queries.sql`** to view the five example query results.
6. Open and execute **`view.sql`** to create `vw_MainFeed` and display the feed results.
7. Optionally open **`InstagramDB_ER_Diagram.mwb`** in Workbench to inspect the editable ER model.

**Note:** The schema and seed files are intended for an initial setup. Running them multiple times against the same database may cause table-already-exists or duplicate-key errors. Use a fresh database if starting over.

## Project files

```text
InstagramDB/
├── README.md
├── schema.sql
├── seed.sql
├── queries.sql
├── view.sql
├── InstagramDB_ER_Diagram.mwb
└── InstagramDB_ER_Diagram.png
```

## Learning outcomes

- Designed a relational database with seven related tables.
- Used primary keys and foreign keys to define relationships.
- Inserted sample data with `INSERT INTO`.
- Wrote queries with joins, filtering, grouping, counting, and sorting.
- Created an SQL view to summarize post likes and comments.
- Documented the database relationships with an ER diagram.
