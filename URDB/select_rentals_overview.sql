select c.first_name || ' ' || c.last_name as customer,
	v.make || ' ' || v.model || ' ' || v.year as vehicle,
	r.start_date as from,
	r.end_date as to,
	r.end_date-r.start_date as total_days,
	r.cost,
	ls.name as pickup,
	lr.name as return
from rentals r
inner join customers c on c.customer_id = r.customer_id
inner join vehicles v on v.vehicle_id = r.vehicle_id
inner join locations ls on ls.location_id = r.pickup_location
inner join locations lr on lr.location_id = r.return_location