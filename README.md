# POSTGIS-Find-Geometry-Center-Point
A simple plpgSQL function that returns center point of given geometry based on the geometry type.


**Usage:**
Execute the 'ap_find_geometry_center.sql' function and call it like the following:

**1. LineString**
    
    select public.ap_find_geometry_center('LINESTRING(-71.160281 42.258729,-71.160837 42.259113,-71.161144 42.25932)')
    
**2. Polygon**

    select public.ap_find_geometry_center('POLYGON((-71.1776585052917 42.3902909739571,-71.1776820268866 42.3903701743239,
    -71.1776063012595 42.3903825660754,-71.1775826583081 42.3903033653531,-71.1776585052917 42.3902909739571))')
    
**3. Point**    

    select st_astext(public.ap_find_geometry_center('POINT(-71.064544 42.28787)'))
