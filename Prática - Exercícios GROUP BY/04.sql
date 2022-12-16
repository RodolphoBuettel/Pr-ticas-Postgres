SELECT MAX(salary) AS maximumSalary, roles.name AS "role" FROM jobs JOIN roles
ON jobs."roleId" = roles.id GROUP BY "role" ORDER BY maximumSalary ASC;