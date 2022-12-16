SELECT users.name AS writer, COUNT(testimonials) AS "testimonialCount" FROM testimonials JOIN users
ON users.id = 435 WHERE testimonials."writerId" = users.id GROUP BY users.name;