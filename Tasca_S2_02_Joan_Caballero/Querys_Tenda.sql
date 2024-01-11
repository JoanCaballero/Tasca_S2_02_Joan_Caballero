use tienda;
-- 1
select nombre
from producto;
-- 2
select nombre, precio
from producto;
-- 3
select *
from producto;
-- 4
select nombre, precio, precio / 1.16
from producto;
-- 5
select nombre as 'nom de producto', precio as euros, precio / 1.16 as 'dòlars'
from producto;
-- 6
select upper(nombre)
from producto;
-- 7
select lower(nombre), precio
from producto;
-- 8
select nombre, upper(left(nombre,2))
from fabricante; 
-- 9
select nombre, round(precio)
from producto;
-- 10
select nombre, floor(precio)
from producto;
-- 11
select codigo_fabricante
from producto;
-- 12
select distinct codigo_fabricante
from producto;
-- 13
select nombre
from producto
order by nombre;
-- 14
select nombre
from producto
order by nombre DESC;
-- 15
select nombre
from producto
order by nombre, precio DESC;
-- 16
select *
from fabricante 
limit 5;
-- 17
select *
from fabricante
limit 2
offset 3;
-- 18
select nombre, precio
from producto
order by precio
limit 1;
-- 19
select nombre, precio
from producto
order by precio DESC
limit 1;
-- 20
select nombre
from producto p
where p.codigo_fabricante = 2;
-- 21
select p.nombre, p.precio, f.nombre
from producto p
inner join fabricante f on p.codigo_fabricante = f.codigo;
-- 22
select p.nombre, p.precio, f.nombre
from producto p
inner join fabricante f on p.codigo_fabricante = f.codigo
order by f.nombre;
-- 23
select p.codigo, p.nombre, f.codigo, f.nombre
from producto p 
inner join fabricante f on p.codigo_fabricante = f.codigo;
-- 24
select p.nombre, p.precio, f.nombre
from producto p 
inner join fabricante f on p.codigo_fabricante = f.codigo
order by precio
limit 1;
-- 25
select p.nombre, p.precio, f.nombre
from producto p 
inner join fabricante f on p.codigo_fabricante = f.codigo
order by precio DESC
limit 1;
-- 26
select p.nombre
from producto p
inner join fabricante f on p.codigo_fabricante = f.codigo
where f.nombre = 'Lenovo';
-- 27
select p.nombre
from producto p
inner join fabricante f on p.codigo_fabricante = f.codigo
where f.nombre = 'Crucial' and p.precio > 200;
-- 28
select p.nombre
from producto p
inner join fabricante f on p.codigo_fabricante = f.codigo
where f.nombre = 'Asus' or f.nombre = 'Hewlett-Packard' or f.nombre = 'Seagate';
-- 29
select p.nombre
from producto p
inner join fabricante f on p.codigo_fabricante = f.codigo
where f.nombre in('Asus', 'Hewlett-Packard', 'Seagate');
-- 30
select p.nombre, p.precio
from producto p
inner join fabricante f on p.codigo_fabricante = f.codigo
where right(f.nombre,1) = 'e';
-- 31
select p.nombre, p.precio
from producto p
inner join fabricante f on p.codigo_fabricante = f.codigo
where f.nombre like '%w%';
-- 32
select p.nombre, p.precio, f.nombre
from producto p
inner join fabricante f on p.codigo_fabricante = f.codigo
where p.precio > 180
order by p.precio DESC, p.nombre;
-- 33
select distinct f.codigo, f.nombre
from fabricante f
inner join producto p on p.codigo_fabricante = f.codigo;
-- 34
select f.nombre, p.nombre
from fabricante f 
left join producto p on f.codigo = p.codigo_fabricante;
-- 35
select f.nombre
from fabricante f 
where f.codigo not in (
select p.codigo_fabricante
from producto p);
-- 36
select p.nombre
from producto p
where p.codigo_fabricante = 2;
-- 37
select *
from producto 
where precio = (
select max(precio)
from producto
where codigo_fabricante = 2);
-- 38
select *
from producto 
where precio = (
select max(precio)
from producto
where codigo_fabricante = 2);
-- 39
select *
from producto
where precio = (
select min(precio)
from producto
where producto.codigo_fabricante = 3);
-- 40
select *
from producto 
where precio >= (
select max(precio)
from producto
where codigo_fabricante = 2);
-- 41
select *
from producto p
where p.codigo_fabricante = 1 and p.precio > (
select avg(precio)
from producto
where producto.codigo_fabricante = 1);
