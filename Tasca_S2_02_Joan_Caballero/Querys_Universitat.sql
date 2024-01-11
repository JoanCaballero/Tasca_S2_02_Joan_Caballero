use universidad;
-- 1
select p.apellido1, p.apellido2, p.nombre
from persona p
where p.tipo = 'alumno'
order by p.apellido1, p.apellido2, p.nombre;

-- 2
select p.apellido1, p.apellido2, p.nombre
from persona p
where p.tipo = 'alumno' and p.telefono is NULL;

-- 3
select p.apellido1, p.apellido2, p.nombre
from persona p
where p.tipo = 'alumno' and left(p.fecha_nacimiento, 4) = 1999;

-- 4
select p.apellido1, p.apellido2, p.nombre
from persona p
where p.tipo = 'profesor' and p.telefono is NULL and right(p.nif, 1) = 'K';

-- 5
select a.nombre
from asignatura a
where  a.cuatrimestre = 1 and a.curso = 3 and a.id_grado = 7;

-- 6
select  p.apellido1, p.apellido2, p.nombre, d.nombre
from persona p
inner join profesor pr on p.id =  pr.id_profesor
inner join departamento d on pr.id_departamento = d.id
order by p.apellido1, p.apellido2, p.nombre; 

-- 7
select a.nombre, ce.anyo_inicio, ce.anyo_fin
from asignatura a 
inner join alumno_se_matricula_asignatura am on a.id = am.id_asignatura
inner join persona p on  p.id = am.id_alumno
inner join curso_escolar ce on ce.id = am.id_curso_escolar
where p.nif = '26902806M';

-- 8
select d.nombre
from departamento d 
where d.id in (
	select pr.id_departamento
    from profesor pr
    where pr.id_profesor in (
		select a.id_profesor
        from asignatura a 
        where a.id_grado in (
			select g.id
			from grado g 
			where g.nombre = 'Grado en Ingeniería Informática (Plan 2015)'
		)
	)
);

-- 9
select distinct p.apellido1, p.apellido2, p.nombre
from persona p
inner join alumno_se_matricula_asignatura am on p.id = am.id_alumno
inner join curso_escolar ce on am.id_curso_escolar = ce.id
where ce.anyo_inicio = 2018;

-- 1 LEFT-RIGHT JOIN
select  p.apellido1, p.apellido2, p.nombre, d.nombre
from persona p
right join profesor pr on p.id =  pr.id_profesor
left join departamento d on pr.id_departamento = d.id
order by p.apellido1, p.apellido2, p.nombre; 

-- 2 LEFT-RIGHT JOIN
select  p.apellido1, p.apellido2, p.nombre
from persona p
right join profesor pr on p.id =  pr.id_profesor
left join departamento d on pr.id_departamento = d.id
where pr.id_departamento is null;
 
-- 3 LEFT-RIGHT JOIN
select d.nombre
from departamento d
left join profesor pr on pr.id_departamento = d.id
where pr.id_departamento is null;

-- 4 LEFT-RIGHT JOIN
select p.apellido1, p.apellido2, p.nombre
from persona p 
inner join profesor pr on pr.id_profesor = p.id
left join asignatura a on pr.id_profesor = a.id_profesor
where a.id_profesor is null;

-- 5 LEFT-RIGHT JOIN
select a.nombre
from asignatura a
left join profesor pr on a.id_profesor = pr.id_profesor
where a.id_profesor is null;

-- 6 LEFT-RIGHT JOIN
select distinct departamento.nombre
from departamento
left join profesor on departamento.id = profesor.id_departamento
left join asignatura on profesor.id_profesor = asignatura.id_profesor
where asignatura.id is null;

-- QUERYS RESUM

-- 1
select count(*)
from persona p
where p.tipo = 'alumno';

-- 2
select count(*)
from persona p
where p.tipo = 'alumno' and year(p.fecha_nacimiento) = 1999;

-- 3
select d.nombre, count(*) as num_profesor
from departamento d
inner join profesor pr on pr.id_departamento = d.id
group by d.id
order by num_profesor;

-- 4
select d.nombre, count(pr.id_profesor) as num_profesor
from departamento d
left join profesor pr on pr.id_departamento = d.id
group by d.id;

-- 5
select g.nombre, COUNT(a.id)  
from grado g 
left join asignatura a on a.id_grado = g.id 
group by g.id 
ORDER BY COUNT(a.id) desc;

-- 6
select g.nombre, COUNT(a.id) 
from grado g 
join asignatura a on a.id_grado = g.id 
group by g.id 
having COUNT(a.id) > 40;

-- 7
select g.nombre , a.tipo, SUM(a.creditos) 
from grado g 
join asignatura a on a.id_grado = g.id 
group by g.nombre, a.tipo;

-- 8
select ce.anyo_inicio, COUNT(am.id_alumno) 
from alumno_se_matricula_asignatura am 
join curso_escolar ce ON ce.id = am.id_curso_escolar 
group by ce.anyo_inicio;

-- 9
select p.id, p.nombre, p.apellido1, p.apellido2, COUNT(a.id) 
from asignatura a 
right join profesor pr ON pr.id_profesor = a.id_profesor 
join persona p on p.id = pr.id_profesor 
group by p.id 
order by COUNT(a.id) desc;

-- 10
select * 
from persona 
where tipo = 'alumno' 
order by fecha_nacimiento desc 
limit 1;

-- 11
select p.* 
from persona p 
join profesor prof on prof.id_profesor = p.id 
join departamento d on d.id = prof.id_departamento 
left join asignatura a on a.id_profesor = prof.id_profesor 
where a.id is null;