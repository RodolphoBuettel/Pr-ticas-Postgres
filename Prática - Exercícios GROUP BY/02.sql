SELECT  "userId" AS "id", COUNT(educations) AS educations FROM educations
GROUP BY "userId";