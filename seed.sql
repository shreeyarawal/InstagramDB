
USE InstagramDB;

INSERT INTO Account_Types
(account_type_id, account_type_name)
VALUES
(1, 'Personal'),
(2, 'Creator'),
(3, 'Business'),
(4, 'Student'),
(5, 'Organization');

INSERT INTO Categories
(category_id, category_name)
VALUES
(1, 'Travel'),
(2, 'Food'),
(3, 'Technology'),
(4, 'Art'),
(5, 'Fashion');

INSERT INTO Users
(user_id, account_type_id, username, email, password_hash)
VALUES
(1, 2, 'monce1', 'monce@example.com', 'demo01'),
(2, 2, 'sri2', 'sri@example.com', 'demo02'),
(3, 2, 'shreeya2', 'shreyaa@example.com', 'demo03'),
(4, 4, 'rinzin3', 'rinzin@example.com', 'demo04'),
(5, 3, 'andriel4', 'andriel@example.com', 'demo05'),
(6, 2, 'madona5', 'madona@example.com', 'demo06');

INSERT INTO Posts
(post_id, user_id, category_id, caption)
VALUES
(1, 1, 1, 'Beautiful day in New York!'),
(2, 1, 2, 'My favorite restaurant in Queens'),
(3, 1, 3, 'Learning SQL at college'),
(4, 1, 1, 'Weekend trip to Manhattan'),
(5, 1, 4, 'Amazing street art in Brooklyn'),
(6, 2, 1, 'Traveling with my friends'),
(7, 2, 2, 'Delicious homemade pizza'),
(8, 2, 5, 'My new favorite outfit'),
(9, 3, 4, 'My latest drawing'),
(10, 3, 1, 'Beautiful sunset today'),
(11, 3, 2, 'Trying a new coffee shop'),
(12, 4, 3, 'Studying cybersecurity'),
(13, 4, 3, 'Practicing Linux commands'),
(14, 5, 5, 'New fashion inspiration'),
(15, 5, 2, 'Making chocolate cake');

INSERT INTO Likes (user_id, post_id)
VALUES
(2, 1),
(3, 1),
(4, 2),
(5, 2),
(6, 3),
(2, 4),
(3, 5),
(4, 6),
(5, 7),
(6, 8),
(1, 9),
(2, 10),
(3, 11),
(4, 12),
(5, 13);

INSERT INTO Comments
(comment_id, user_id, post_id, comment_text)
VALUES
(1, 2, 1, 'Beautiful picture!'),
(2, 3, 1, 'I love New York!'),
(3, 4, 2, 'That restaurant looks amazing!'),
(4, 5, 3, 'SQL is very interesting!'),
(5, 6, 4, 'I want to visit Manhattan!'),
(6, 1, 5, 'Amazing street art!'),
(7, 3, 6, 'Looks like a fun trip!'),
(8, 4, 7, 'I love homemade pizza!'),
(9, 5, 8, 'Love your outfit!'),
(10, 6, 9, 'Your drawing is beautiful!'),
(11, 1, 10, 'Amazing sunset!'),
(12, 2, 11, 'I love coffee shops!'),
(13, 3, 12, 'Cybersecurity is interesting!'),
(14, 5, 13, 'Linux is so useful!'),
(15, 6, 15, 'That cake looks delicious!');

INSERT INTO Follows (follower_id, following_id)
VALUES
(1, 2),
(2, 1),
(1, 3),
(3, 1),
(1, 4),
(4, 1),
(1, 5),
(5, 1),
(1, 6),
(6, 1),
(2, 3),
(3, 2),
(2, 4),
(4, 2),
(5, 6);
