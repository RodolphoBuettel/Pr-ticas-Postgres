SELECT users.name AS writer, COUNT(testimonials) AS "testimonialCount" FROM testimonials JOIN users
ON testimonials."writerId" = users.id WHERE users.id  = 435 GROUP BY users.name;