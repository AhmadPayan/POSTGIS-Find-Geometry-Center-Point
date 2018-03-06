CREATE OR REPLACE FUNCTION public.ap_find_geometry_center(geometry geometry)
  RETURNS SETOF geometry AS
$BODY$

DECLARE

geometryType text;
centerOfGeometry geometry;

BEGIN

-- Type of geometry : Line,Point,Polygon

geometryType := (SELECT ST_GeometryType(geometry));

IF (geometryType = 'ST_LineString') THEN
centerOfGeometry := (select ST_LineInterpolatePoint(geometry,0.5));
ELSIF (geometryType = 'ST_MultiLineString') THEN
-- It'll find the nearest point to the MultiLineString
centerOfGeometry := (select ST_ClosestPoint(geometry,ST_Centroid(geometry)));
ELSIF (geometryType  = 'ST_Point') THEN
-- There is no need to do any further processing for point geometry, just return itself
centerOfGeometry := geometry;
ELSE
centerOfGeometry := (SELECT ST_Centroid(geometry));
END IF;

RETURN QUERY SELECT centerOfGeometry;

END
$BODY$
  LANGUAGE plpgsql;
