-- Public
CREATE OR REPLACE VIEW view_location AS SELECT m.state_id, s.state, p.municipality_id, m.municipality, p.id AS parish_id, p.parish FROM parishes AS p
LEFT JOIN municipalities AS m ON p.municipality_id = m.id 
LEFT JOIN states AS s ON m.state_id = s.id;

-- general
CREATE OR REPLACE VIEW general.view_location_workers AS SELECT l.*, v.state, v.municipality, v.parish FROM general.location AS l
LEFT JOIN view_location AS v ON l.parish_id = v.parish_id;

CREATE OR REPLACE VIEW general.view_workers AS SELECT w.*, g.gender, d.department, p.position, t.name AS payroll_type, a.area, l.state_id, l.state, l.municipality_id, l.municipality, l.parish_id, l.parish, l.address FROM general.workers AS w
LEFT JOIN genders AS g ON g.id = w.gender_id
LEFT JOIN general.view_location_workers AS l ON w.id = l.worker_id
LEFT JOIN general.department AS d ON d.id = w.department_id
LEFT JOIN general.position AS p ON p.id = w.position_id
LEFT JOIN general.payroll_type AS t ON t.id = w.payroll_type_id
lEFT JOIN general.area_coordination AS a ON a.id = w.area_coordination_id;

-- regions
CREATE OR REPLACE VIEW regions.view_users AS SELECT u.*, r.role, w.identity_card, w.full_name, w.status, w.gender, w.position, w.position_id, w.gender_id, w.department, w.department_id FROM regions.users AS u
LEFT JOIN regions.roles AS r ON r.id = u.role_id
LEFT JOIN general.view_workers AS w ON w.id = u.worker_id;

CREATE OR REPLACE VIEW regions.view_achievements AS select 
	b.*,
	o.place_id,
	o.place_other,
	o.n_womans,
	o.n_man,
	o.n_unspecified,
	o.responsible,
	o.phone_number,
	g.age_range_id,
	g.type_weapon_id,
	g.type_femicide_id,
	g.killer_status_id,
	t.type_telephone_service_id,
	t.great_mission,
	v.country_id,
	v.gender_id,
	v.age,
	v.collection_method,
	v.received
from regions.achievements_base as b 
left join regions.achievements_others as o on o.achievements_id = b.id
left join regions.achievements_g_violence as g on g.achievements_id = b.id
left join regions.achievements_telephone_service as t on t.achievements_id = b.id
left join regions.achievements_victim_traff as v on v.achievements_id = b.id;