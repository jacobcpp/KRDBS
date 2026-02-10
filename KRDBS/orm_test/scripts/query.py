import sys, os, django

sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "orm_test.settings")
django.setup()

from vehicles.models import Vehicle_orm, VehicleDiscount_orm

v = Vehicle_orm.objects.filter(year__gt=2005)
print(v)


from vehicles.models import Vehicle

vehicles = Vehicle.objects.all()
old_vehicles = Vehicle.objects.filter(year__lte=2015)

for vehicle in old_vehicles:
    print(f"{vehicle.make} {vehicle.model} {vehicle.year} {vehicle.status_id}")

print('---------------------------')

v = Vehicle.objects.filter(vehicle_id=1)[0]
status_id_new = 4
print(f"{v.make} {v.model} {v.year} {v.status_id} -> {status_id_new}")
v.status_id = status_id_new
v.save()