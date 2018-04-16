# POSTGIS-Find-Geometry-Center-Point
Use this function instead of **ST_Centroid** to make sure that the returned center point is lied on the given geometry. It also can be used for dynamic senario where you don't know what the type of the geometry is and wouldn't like to call ST_Centroid for geometries like linestring or point which they have nothing to do with that. So, when you're querying more than one table with a different geometry types, this function can be helpful.


**Usage:**

Execute the **ap_find_geometry_center.sql** function in the PostgreSQL and call it like the following:

**1. LineString**
```
select public.ap_find_geometry_center('LINESTRING(-71.160281 42.258729,-71.160837 42.259113,-71.161144 42.25932)')
```
**2. Polygon**
```select public.ap_find_geometry_center('POLYGON((-71.1776585052917 42.3902909739571,-71.1776820268866 42.3903701743239,
    -71.1776063012595 42.3903825660754,-71.1775826583081 42.3903033653531,-71.1776585052917 42.3902909739571))')
```
**3. Point**

Please notice that it'll return the same point as given geometry for point type geometries.
```
select st_astext(public.ap_find_geometry_center('POINT(-71.064544 42.28787)'))
```
**4. MultiLineString**
```
select public.ap_find_geometry_center('MULTILINESTRING((-29 -27,-30 -29.7,-36 -31,-45 -33),(-45 -33,-46 -32))')
```
