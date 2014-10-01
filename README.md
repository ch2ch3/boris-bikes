Boris Bikes
===========

The Week 2 project introduces us to Object-Oriented Programming and testing with RSpec. We simulated the Barclays Cycle Hire system in London with separate classes for bikes, docking stations, vans, garages, and people.

A person can rent a bike from one station and return it to another. A bike can be broken if the person has an accident. Broken bikes will not be rented out, and can be fixed when picked up by a van and taken to the garage.

How to use
----------
Clone the repository:
```shell
$ git clone git@github.com:ch2ch3/boris-bikes.git
```

Change into the directory:
```shell
$ cd boris-bikes
```

Open in IRB:
```shell
$ irb
  > require './files'
```

Create new objects as needed, e.g.:
```shell
  > old_street = DockingStation.new(bikes: [Bike.new, Bike.new, Bike.new]) # creates a station with 3 bikes inside it
  > ethel = Person.new
  > van = Van.new
  > garage = Garage.new
```

Place a bike into old_street:
```shell
  > old_street.dock(Bike.new)
```

Rent a bike:
```shell
  > ethel.rent_bike_from(old_street)
```

Crash a bike:
```shell
  > ethel.has_accident!
```

Return a bike:
```shell
  > ethel.return_bike_to(old_street)
```

Pick up the broken bike:
```shell
  > van.pick_up_broken_bikes_from(old_street)
```

Drop off the broken bike:
```shell
  > van.drop_off_broken_bikes_at(garage)
```

Pick up the fixed bike:
```shell
  > van.pick_up_fixed_bikes_from(garage)
```

Drop off the fixed bike:
```shell
  > van.drop_off_broken_bikes_at(old_street)
```