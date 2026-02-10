# myproject/scripts/create_vehicle.py
import sys
import os
import django

sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "orm_test.settings")
django.setup()

from vehicles.models import Vehicle_orm, VehicleDiscount_orm

# create vehicle
v = Vehicle_orm.objects.create(make='Toyota', 
                               model='Corolla', 
                               year=2020, 
                               license_plate='1a8 6958')

# create discount
VehicleDiscount_orm.objects.create(vehicle=v, discount_percent=5)