# Análisis Exploratorio del Programa de Bicicletas Compartidas Citi Bike

Este proyecto se enfoca en realizar un análisis exploratorio del programa de bicicletas compartidas Citi Bike. A través de este análisis, buscamos entender los patrones de uso, identificar tendencias históricas y proporcionar recomendaciones para la toma de decisiones estratégicas.

![alt text](images/logo.png)

## Objetivos
1. **Métricas de uso en un día promedio**
    - Número promedio de viajes diarios: Determinar cuántos viajes se realizan en un día promedio.
    - Estadísticas descriptivas de la duración de los viajes: Calcular el valor máximo, mínimo, promedio, y la desviación estándar de la duración de los viajes en minutos.
2. **Métricas históricas del servicio**
    - Total de viajes: Calcular el número total de viajes realizados durante el periodo de análisis.
    - Crecimiento del número de viajes diarios: Analizar cómo ha cambiado el número de viajes diarios a lo largo del tiempo.
    - Desglose de viajes por perfil de usuario: Desglosar los viajes por género, edad y tipo de suscripción para identificar patrones de uso.
3. **Descubrimiento de patrones y tendencias**
    - Patrones de uso: Identificar patrones en el uso del servicio según el día de la semana, la duración del viaje y el perfil del usuario.
    - Tendencias históricas: Detectar tendencias en el número de viajes a lo largo del tiempo, observando aumentos o disminuciones.
4. **Recomendaciones Estratégicas**
    - Recomendaciones para optimización: Basado en los hallazgos, ofrecer sugerencias que puedan mejorar la eficiencia del servicio, aumentar la satisfacción del usuario y promover una mayor participación.

## Herramientas
- Google BigQuery.
- Tableu

## Lenguajes
- SQL en BigQuery.

## Preparación de Datos

1. **Revisión de nulos**

Durante la revisión de valores nulos en el dataset citi_bike_trips, se identificaron nulos en las siguientes variables:

   - **birth_year:** 4,639 valores nulos.
   - **null_customer_plan:** 50,000 valores nulos.

Puedes revisar la consulta [aquí](sql/nulls.sql).

1.1 **Decisiones Tomadas**

   - null_customer_plan: Los valores nulos en esta variable se mantienen,existe la posibilidad de que haya ocurrido un error en la recolección o el procesamiento de los datos, dejando esta variable vacía.
   - birth_year: Se decidió eliminar los registros con valores nulos en esta variable (4,639 registros) para realizar un análisis más detallado y preciso. Esta decisión permite centrarse en usuarios con información completa, lo que facilita la segmentación por edad y la generación de insights demográficos más robustos.
   - Se eliminaron regisgtros con gender 'unknown', esto con la finalidad de obtener información más precisa.

2. **Revisión de duplicados**

Las variables como tripduration, stoptime, start_station_id, bikeid, usertype, entre otras, son válidas para repetirse en múltiples registros debido a la naturaleza del sistema de bicicletas compartidas. Es común que diferentes usuarios realicen viajes similares o incluso idénticos en distintos momentos, por lo que la existencia de registros duplicados en este contexto no compromete la integridad del análisis.

3. **Transformación de variables**
- La variable tripduration, que está en segundos, se convierte a minutos y se redondea el valor a minutos enteros.
- Se calcula el tiempo de inicio del viaje (starttime_calculated) restando la duración del viaje (en minutos) de la hora de finalización (stoptime).
- Se creó la variable age, que consta de la resta de la fecha actual menos birth_year.

## Métricas Calculadas

- **Métricas diarias**

Se calcularon las métricas diarias del uso del sistema de bicicletas compartidas, para entender mejor los patrones de uso y la demanda del servicio.

Puedes revisar la consulta [aquí](sql/metricas_uso_diario_avg.sql).

![alt text](images/metricas_uso_diario.png)

1. **Número Promedio de Viajes por Día (Avg Daily Trips):**
El programa registra un promedio de 47 viajes por día. Esta métrica refleja la frecuencia con la que las bicicletas son utilizadas por los usuarios en un día típico.

2. **Duración Promedio del Viaje (Avg Trip Duration):**
La duración promedio de un viaje es de 15 minutos. Este valor indica el tiempo típico que los usuarios pasan utilizando las bicicletas en cada viaje. Un tiempo de viaje de esta duración sugiere que la mayoría de los usuarios utilizan las bicicletas para trayectos cortos, posiblemente como parte de sus desplazamientos diarios o para recorridos recreativos rápidos.

3. **Duración Máxima del Viaje (Max Trip Duration):**
El viaje más largo registrado en los datos tiene una duración de 54.56 minutos. Este valor es atípico en comparación con la duración promedio, lo que sugiere que, aunque la mayoría de los viajes son cortos, algunos usuarios pueden utilizar el servicio para recorridos más extensos.

4. **Duración Mínima del Viaje (Min Trip Duration):**
El viaje más corto registrado dura 1 minuto. Esto podría representar a usuarios que realizan trayectos muy cortos, posiblemente solo para trasladarse entre dos puntos cercanos o debido a un cambio de decisión poco después de iniciar el viaje.

- **Métricas históricas**
Se realizó una consulta para analizar el rendimiento de las bicicletas (bikeid) agrupado por grupos de edad, tipo de usuario y género. Además, calcula el promedio de duración de los viajes, el número de estaciones distintas desde las cuales se han iniciado los viajes, y proporciona conteos totales de viajes por bicicleta, género y tipo de usuario. 

Puedes revisar la consulta [aquí](sql/metricas_historicas.sql).

- **Crecimiento Diario de Viajes**

Se calculó como la diferencia entre el número de viajes de un día y el número de viajes del día anterior, proporcionando una medida del incremento o decremento en la actividad diaria de viajes, con la finalidad de conocer el crecimiento diario, comparado con el día anterior.

![alt text](images/crecimiento_diario.png)

## Conclusiones Generales

- **Uso Estacional de las Bicicletas:**

    - **Patrón:** La cantidad de viajes aumenta durante los meses más cálidos y alcanza su punto máximo en septiembre. La disminución en invierno sugiere que el clima afecta significativamente el uso de bicicletas.
    - **Recomendación:** Considerar implementar promociones o eventos especiales durante los meses fríos para mantener el interés en el servicio durante todo el año.

- **Duración del Viaje por Género:**

     - **Patrón:** Las mujeres tienden a tener una duración de viaje ligeramente mayor que los hombres.
     - **Recomendación:** Investigar las rutas preferidas por género para optimizar la distribución de bicicletas y mejorar la experiencia del usuario en función de estos patrones.

- **Duración del Viaje por Tipo de Usuario:**

    - **Patrón:** Los clientes ocasionales tienen viajes significativamente más largos que los suscriptores, lo que puede indicar un uso más recreativo por parte de los primeros.
    - **Recomendación:** Considerar ajustar la estructura de precios para los suscriptores y clientes ocasionales o ofrecer paquetes específicos para aquellos que usan las bicicletas para recorridos largos.

- **Rendimiento por Bicicleta:**

    - **Patrón:** El gráfico de burbujas muestra qué estaciones de bicicletas son más utilizadas, sugiriendo la necesidad de mantenimiento regular para las estaciones  más usadas.
    **Recomendación:** Establecer un programa de mantenimiento preventivo basado en el uso de cada estación y bicicleta para asegurar que todas se mantengan en óptimas condiciones.

- **Estaciones de Inicio y Final:**

    - **Patrón:** Hay estaciones principales tanto para el inicio como para la finalización de los viajes, indicando puntos de alta demanda.
    - **Recomendación:** Considerar la posibilidad de redistribuir las bicicletas en las estaciones más populares para equilibrar la oferta y la demanda, y posiblemente añadir más estaciones en áreas de alta demanda.

## Recomendaciones para el Nuevo CEO

- **Optimización Estacional:**

    - **Estrategia:** Aprovechar el aumento estacional en el uso durante los meses cálidos para maximizar los ingresos y considerar estrategias para mantener el uso en invierno.
- **Personalización del Servicio:**
    - **Estrategia:** Ofrecer rutas y promociones personalizadas basadas en los patrones de uso por género y tipo de usuario. Esto puede mejorar la satisfacción del cliente y aumentar la retención.
- **Mantenimiento y Gestión de Flotas:**
    - **Estrategia:** Implementar un sistema de mantenimiento predictivo y reactivo para asegurar que las bicicletas más utilizadas reciban el cuidado necesario. También considerar un programa de incentivos para mantener bicicletas en buen estado.
- **Expansión de Infraestructura:**
    - **Estrategia:** Utiliza los datos de las estaciones más populares para planificar la expansión de la infraestructura de bicicletas compartidas. Esto puede incluir la adición de nuevas estaciones y la mejora de las existentes.
- **Marketing y Promociones:**
    - **Estrategia:** Lanzar campañas de marketing dirigidas a los clientes ocasionales durante los meses fríos y promociones para aumentar el uso entre los suscriptores. Considera ofrecer descuentos o paquetes especiales para incentivar el uso durante todo el año.


## Dashboard 
Puedes acceder a mi dashboard en Tableu haciendo clic [aquí](https://public.tableau.com/app/profile/veronica.yadira.dom.nguez/viz/citibike_17241285808320/Dashboard5?publish=yes)



