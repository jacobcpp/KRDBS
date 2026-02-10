from django.db import models

class Vehicle_orm(models.Model):
    make = models.CharField()
    model = models.CharField()
    year = models.IntegerField()
    license_plate = models.CharField(max_length=10)

class VehicleDiscount_orm(models.Model):
    vehicle = models.OneToOneField(Vehicle_orm, on_delete=models.CASCADE)
    discount_percent = models.DecimalField(max_digits=5, decimal_places=2)
    created_at = models.DateTimeField(auto_now_add=True)

class Vehicle(models.Model):
    vehicle_id = models.BigIntegerField(primary_key=True)
    make = models.CharField()
    model = models.CharField()
    year = models.IntegerField()
    license_plate = models.CharField(max_length=10)
    vehicle_type = models.IntegerField()
    current_location = models.IntegerField()
    status_id = models.IntegerField()

    class Meta:
        db_table='vehicles'
        managed = False

# python main.py makemigrations vehicles
# python main.py migrate
# this will create vehicles and vehicleDiscount tables