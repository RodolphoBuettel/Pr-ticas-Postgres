 SELECT users.id, users.name, roles.name AS role, companies.name AS company, experiences."startDate" FROM users JOIN experiences ON use
rs.id = experiences."userId" JOIN roles ON experiences."roleId" = roles.id JOIN companies ON experiences."companyId" = companies.id WHERE users.id =
 50 AND "endDate" IS NULL;