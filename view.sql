DROP VIEW IF EXISTS vw_MainFeed;

CREATE VIEW vw_MainFeed AS
SELECT p.post_id, u.username, p.caption, p.created_at,
    COUNT(DISTINCT l.user_id) AS TotalLikes,
    COUNT(DISTINCT c.comment_id) AS TotalComments
FROM Posts p
JOIN Users u
    ON p.user_id = u.user_id
LEFT JOIN likes l
    ON p.post_id = l.post_id
LEFT JOIN comments c
    ON p.post_id = c.post_id
GROUP BY p.post_id, u.username, p.caption, p.created_at; 

SELECT*
FROM vw_MainFeed
ORDER BY created_at DESC;
