
USE InstagramDB;


SELECT
    p.post_id,
    u.username,
    c.category_name,
    p.caption,
    p.image_url,
    p.created_at
FROM Posts p
JOIN Users u ON p.user_id = u.user_id
JOIN Categories c ON p.category_id = c.category_id
ORDER BY p.created_at DESC, p.post_id DESC;


SELECT
    u.username,
    a.account_type_name,
    p.post_id,
    p.caption,
    p.created_at
FROM Users u
JOIN Account_Types a
    ON u.account_type_id = a.account_type_id
LEFT JOIN Posts p
    ON u.user_id = p.user_id
WHERE a.account_type_name = 'Creator'
ORDER BY p.created_at DESC, p.post_id DESC;



SELECT
    p.post_id,
    p.caption,
    u.username AS commenter,
    c.comment_text,
    c.created_at
FROM Comments c
JOIN Users u ON c.user_id = u.user_id
JOIN Posts p ON c.post_id = p.post_id
WHERE p.post_id = 1
ORDER BY c.created_at ASC, c.comment_id ASC;



SELECT
    p.post_id,
    p.caption,
    COUNT(l.user_id) AS total_likes
FROM Posts p
LEFT JOIN Likes l ON p.post_id = l.post_id
GROUP BY p.post_id, p.caption
ORDER BY total_likes DESC, p.post_id ASC;


SELECT
    follower.username AS follower_username,
    following_user.username AS following_username,
    f.followed_at
FROM Follows f
JOIN Users follower
    ON f.follower_id = follower.user_id
JOIN Users following_user
    ON f.following_id = following_user.user_id
ORDER BY follower.username, following_user.username;
