DROP VIEW IF EXISTS vw_MainFeed;

CREATE VIEW vw_MainFeed AS
SELECT p.PostID, u.Username, p.Caption, p.CreatedAt,
    COUNT(l.LikeID) AS TotalLikes,
    COUNT(DISTINCT c.CommentID) AS TotalComments
FROM posts p
JOIN users u
    ON p.UserID = u.UserID
LEFT JOIN likes l
    ON p.PostID = l.PostID
LEFT JOIN comments c
    ON p.PostID = c.PostID
GROUP BY p.PostID, u.Username,p.Caption, p.CreatedAt;
