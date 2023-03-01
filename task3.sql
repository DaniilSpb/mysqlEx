SELECT maker,
	CASE
	WHEN COUNT( DISTINCT pc.model) = 0 THEN
	'no'
	ELSE concat('yes(',count( DISTINCT pc.model),')')end AS pc,
	CASE
	WHEN COUNT( DISTINCT l.model) = 0 THEN
	'no'
	ELSE concat('yes(',count( DISTINCT l.model),')')end AS laptop,
	CASE
	WHEN COUNT( DISTINCT p.model) = 0 THEN
	'no'
	ELSE concat('yes(',count( DISTINCT p.model),')')end AS printer
FROM Product pr
LEFT JOIN PC
	ON pr.model=pc.model
LEFT JOIN laptop l
	ON pr.model=l.model
LEFT JOIN printer p
	ON pr.model=p.model
GROUP BY  maker; 
