# Análisis Exploratorio del Programa de Bicicletas Compartidas Citi Bike

Este proyecto se enfoca en realizar un análisis exploratorio del programa de bicicletas compartidas Citi Bike. A través de este análisis, buscamos entender los patrones de uso, identificar tendencias históricas y proporcionar recomendaciones para la toma de decisiones estratégicas.

![Logo de Citi Bike](images/logo.png)

## Índice

1. [Objetivos](#objetivos)
2. [Herramientas](#herramientas)
3. [Lenguajes](#lenguajes)
4. [Preparación de Datos](#preparación-de-datos)
   - [Revisión de nulos](#revisión-de-nulos)
   - [Revisión de duplicados](#revisión-de-duplicados)
   - [Transformación de variables](#transformación-de-variables)
5. [Métricas Calculadas](#métricas-calculadas)
   - [Métricas diarias](#métricas-diarias)
   - [Métricas históricas](#métricas-históricas)
   - [Crecimiento Diario de Viajes](#crecimiento-diario-de-viajes)
6. [Conclusiones Generales](#conclusiones-generales)
7. [Recomendaciones para el Nuevo CEO](#recomendaciones-para-el-nuevo-ceo)
8. [Dashboard](#dashboard)

## Objetivos

1. **Métricas de uso en un día promedio**
    - **Número promedio de viajes diarios:** Determinar cuántos viajes se realizan en un día promedio.
    - **Estadísticas descriptivas de la duración de los viajes:** Calcular el valor máximo, mínimo, promedio, y la desviación estándar de la duración de los viajes en minutos.

2. **Métricas históricas del servicio**
    - **Total de viajes:** Calcular el número total de viajes realizados durante el periodo de análisis.
    - **Crecimiento del número de viajes diarios:** Analizar cómo ha cambiado el número de viajes diarios a lo largo del tiempo.
    - **Desglose de viajes por perfil de usuario:** Desglosar los viajes por género, edad y tipo de suscripción para identificar patrones de uso.

3. **Descubrimiento de patrones y tendencias**
    - **Patrones de uso:** Identificar patrones en el uso del servicio según el día de la semana, la duración del viaje y el perfil del usuario.
    - **Tendencias históricas:** Detectar tendencias en el número de viajes a lo largo del tiempo, observando aumentos o disminuciones.

4. **Recomendaciones Estratégicas**
    - **Recomendaciones para optimización:** Basado en los hallazgos, ofrecer sugerencias que puedan mejorar la eficiencia del servicio, aumentar la satisfacción del usuario y promover una mayor participación.

## Herramientas

- **Google BigQuery**
- **Tableau**
- **Visual Studio Code**

## Lenguajes

- **SQL en BigQuery**

## Preparación de Datos

1. **Revisión de nulos**

   Durante la revisión de valores nulos en el dataset `citi_bike_trips`, se identificaron nulos en las siguientes variables:
   - **birth_year:** 4,639 valores nulos.
   - **customer_plan:** 50,000 valores nulos.

   Puedes revisar la consulta [aquí](sql/nulls.sql).

1.1 **Decisiones Tomadas**

   - **customer_plan:** Se mantienen los valores nulos ya que podrían indicar errores en la recolección o procesamiento de los datos.
   - **birth_year:** Se eliminaron los registros con valores nulos (4,639 registros) para realizar un análisis demográfico más preciso.
   - **gender:** Se eliminaron los registros con el género `unknown` para obtener información más precisa.

2. **Revisión de duplicados**

   Dado que las variables como `tripduration`, `stoptime`, `start_station_id`, `bikeid`, `usertype`, entre otras, pueden repetirse en múltiples registros, no se consideró necesario eliminar duplicados.

3. **Transformación de variables**
   - La variable `tripduration`, originalmente en segundos, se convirtió a minutos y se redondeó a minutos enteros.
   - Se calculó la variable `starttime_calculated`, restando la duración del viaje (en minutos) de la hora de finalización (`stoptime`).
   - Se creó la variable `age`, calculada como la diferencia entre la fecha actual y `birth_year`.

## Métricas Calculadas

### Métricas diarias

Se calcularon las métricas diarias para entender mejor los patrones de uso y la demanda del servicio.

Puedes revisar la consulta [aquí](sql/metricas_uso_diario_avg.sql).

![Métricas diarias](images/metricas_uso_diario.png)

1. **Número Promedio de Viajes por Día (Avg Daily Trips):** El programa registra un promedio de 47 viajes por día.
2. **Duración Promedio del Viaje (Avg Trip Duration):** La duración promedio de un viaje es de 15 minutos.
3. **Duración Máxima del Viaje (Max Trip Duration):** El viaje más largo registrado tiene una duración de 54.56 minutos.
4. **Duración Mínima del Viaje (Min Trip Duration):** El viaje más corto registrado dura 1 minuto.

### Métricas históricas

Se realizó una consulta para analizar el rendimiento de las bicicletas (`bikeid`) agrupado por edad, tipo de usuario y género.

Puedes revisar la consulta [aquí](sql/metricas_historicas.sql).

### Crecimiento Diario de Viajes

Se calculó la diferencia entre el número de viajes de un día y el del día anterior, para medir el crecimiento diario.

![Crecimiento Diario](images/crecimiento_diario.png)

## Conclusiones Generales

- **Uso Estacional de las Bicicletas:**
    - **Patrón:** El número de viajes aumenta en los meses cálidos, con un pico en septiembre.
    - **Recomendación:** Implementar promociones o eventos durante el invierno para mantener el uso del servicio.

- **Duración del Viaje por Género:**
    - **Patrón:** Las mujeres tienden a realizar viajes más largos que los hombres.
    - **Recomendación:** Investigar rutas preferidas por género para optimizar la distribución de bicicletas.

- **Duración del Viaje por Tipo de Usuario:**
    - **Patrón:** Los clientes ocasionales realizan viajes más largos que los suscriptores.
    - **Recomendación:** Ajustar la estructura de precios o ofrecer paquetes específicos para recorridos largos.

- **Rendimiento por Bicicleta:**
    - **Patrón:** Las estaciones más usadas requieren mantenimiento regular.
    - **Recomendación:** Implementar un programa de mantenimiento preventivo basado en el uso.

- **Estaciones de Inicio y Final:**
    - **Patrón:** Hay estaciones con alta demanda para iniciar y finalizar viajes.
    - **Recomendación:** Redistribuir bicicletas en estaciones populares y considerar añadir más estaciones.

## Recomendaciones para el Nuevo CEO

- **Optimización Estacional:**
    - **Estrategia:** Maximizar ingresos durante meses cálidos y mantener uso en invierno.
  
- **Personalización del Servicio:**
    - **Estrategia:** Ofrecer rutas y promociones basadas en patrones de uso por género y tipo de usuario.

- **Mantenimiento y Gestión de Flotas:**
    - **Estrategia:** Implementar un sistema de mantenimiento predictivo y reactivo.

- **Expansión de Infraestructura:**
    - **Estrategia:** Usar datos de estaciones populares para planificar la expansión.

- **Marketing y Promociones:**
    - **Estrategia:** Dirigir campañas de marketing a clientes ocasionales durante meses fríos.

## Dashboard

Puedes acceder a mi dashboard en Tableau haciendo clic [aquí](https://public.tableau.com/app/profile/veronica.yadira.dom.nguez/viz/citibike_17241285808320/Dashboard5?publish=yes).
