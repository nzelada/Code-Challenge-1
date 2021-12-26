SELECT premium_users.user_id, plans.description
FROM premium_users
JOIN plans
ON premium_users.membership_plan_id =
plans.id;

 SELECT users.id
 FROM users
 LEFT JOIN premium_users
 ON premium_users.user_id = users.id
 WHERE premium_users.user_id IS NULL;
 
 WITH january AS (
  SELECT *
  FROM plays
  WHERE strftime("%m", play_date) = '01'
),
february AS (
  SELECT *
  FROM plays
  WHERE strftime("%m", play_date) = '02'

)
SELECT january.user_id
FROM january
LEFT JOIN february
ON january.user_id = february.user_id
WHERE february.user_id IS NULL;

 SELECT premium_users.user_id, premium_users.purchase_date, premium_users.cancel_date, months.months
 FROM premium_users
 CROSS JOIN months;
 
  SELECT premium_users.user_id,
  months.months,
  CASE
    WHEN (
      premium_users.purchase_date <= months.months
      )
      AND
      (
        premium_users.cancel_date >= months.months
        OR
        premium_users.cancel_date IS NULL
      )
    THEN 'active'
    ELSE 'not_active'
  END AS 'status'
FROM premium_users
CROSS JOIN months;


SELECT *
FROM songs
UNION 
SELECT *
FROM bonus_songs
LIMIT 10;

SELECT '2017-01-01' as month
UNION
SELECT '2017-02-01' as month
UNION 
SELECT '2017-03-01' as month;

WITH play_count AS(
  SELECT song_id,
  COUNT(*) AS 'times_played'
  FROM plays
  GROUP BY song_id
)
SELECT songs.title, songs.artist, play_count.times_played
FROM songs
JOIN play_count
ON play_count.song_id = songs.id;
